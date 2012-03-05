/*
 * parallax_board.cpp
 * Author: Haikal Pribadi (haikal.pribadi@gmail.com)
 *
 * Created on February 24, 2012, 1:58 PM
 */

#include "ros/ros.h"
#include <signal.h>
#include <termios.h>
#include <stdio.h>
#include <fcntl.h>
#include "parallax_eddie_robot/Velocity.h"
#include "parallax_eddie_robot/KeyStroke.h"
#include "parallax_eddie_robot/Speech.h"

#define KEYCODE_U 0x41
#define KEYCODE_D 0x42
#define KEYCODE_R 0x43
#define KEYCODE_L 0x44
#define KEYCODE_x 0x78
#define KEYCODE_q 0x71


int kfd = 0;
struct termios cooked, raw;

class EddieTeleop
{
public:
  EddieTeleop();
  void keyLoop();

private:
  ros::NodeHandle node_handle_;
  ros::Publisher velocity_pub_;
  ros::Publisher keyboard_pub_;
  ros::Publisher speech_pub_; //THIS IS JUST TEMPORARY FOR DEMO-ING eddie_speech
  float linear_, angular_, l_scale_, a_scale_;

};

EddieTeleop::EddieTeleop() :
  linear_(0), angular_(0), l_scale_(2.0), a_scale_(2.0)
{
  velocity_pub_ = node_handle_.advertise<parallax_eddie_robot::Velocity > ("command_velocity", 1);
  keyboard_pub_ = node_handle_.advertise<parallax_eddie_robot::KeyStroke > ("key_stroke", 1);
  speech_pub_ = node_handle_.advertise<parallax_eddie_robot::Speech > ("text_to_speech", 1);
}

void EddieTeleop::keyLoop()
{
  char c, cb, cp;
  std::vector<int> stack;
  bool move = false;
  bool talk = false; //THIS IS JUST TEMPORARY FOR DEMO-ING eddie_speech
  int r; //THIS IS JUST TEMPORARY FOR DEMO

  std::string text;

  //get the console in raw mode
  tcgetattr(kfd, &cooked);
  memcpy(&raw, &cooked, sizeof (struct termios));
  raw.c_lflag &= ~(ICANON | ECHO);
  // Setting a new line, then end of file
  raw.c_cc[VEOL] = 1;
  raw.c_cc[VEOF] = 2;
  tcsetattr(kfd, TCSANOW, &raw);

  int flags;
  flags = fcntl(kfd, F_GETFL);
  flags |= O_NONBLOCK;
  fcntl(0, F_SETFL, flags);

  ROS_INFO("Reading from keyboard");
  ROS_INFO("=====================");
  ROS_INFO("Use arrow keys to navigate");

  cp = 'x'; //just to initialize;
  while (true)
  {
    cb = 0;
    usleep(100000); //in microseconds
    //get the next event from the keyboard
    //by getting the very last value stored in the keyboard buffer
    while (read(kfd, &c, 1) >= 0)
    {
      cb = c;
    }
    if (cb == 0)
    {
      stack.push_back(KEYCODE_x);
      if (stack.size() >= 5)
        c = KEYCODE_x;
    }
    else
    {
      stack.clear();
      c = cb;
    }

    if (c == cp || c == 27 || c == 91)
    {
      continue;
    }

    cp = c;
    linear_ = angular_ = 0;
    //ROS_INFO("value: 0x%02X\n", c);
    //ROS_INFO("KEY PRESSED: %s", &c);
    switch (c)
    {
      case KEYCODE_L:
        ROS_DEBUG("LEFT");
        angular_ = -1.0;
        move = true;
        break;
      case KEYCODE_R:
        ROS_DEBUG("RIGHT");
        angular_ = 1.0;
        move = true;
        break;
      case KEYCODE_U:
        ROS_DEBUG("UP");
        linear_ = 1.0;
        move = true;
        break;
      case KEYCODE_D:
        ROS_DEBUG("DOWN");
        linear_ = -1.0;
        move = true;
        break;
        //the following letters 'a' to 'g' are temporary cases to test eddie_speech and images
      case 'a':
        ROS_DEBUG("TALK: Would you like a drink, Sir?");
        text = "Would you like a drink, Sir?";
        talk = true;
        break;
      case 's':
        ROS_DEBUG("TALK: Coming right up, Sir!");
        text = "Coming right up!";
        talk = true;
        break;
      case 'd':
        ROS_DEBUG("TALK: Yes, Sir!");
        text = "Yes, Sir!";
        talk = true;
        break;
      case 'f':
        ROS_DEBUG("TALK: Here you go, Sir!");
        text = "Here you go, Sir!";
        talk = true;
        break;
      case 'g':
        ROS_DEBUG("TALK: Thank you, Sir!");
        text = "Thank you, Sir!";
        talk = true;
        break;
      case 'h':
        ROS_DEBUG("TALK: I'm sorry, Sir.");
        text = "I'm sorry, Sir.";
        talk = true;
        break;
      case 'j':
        ROS_DEBUG("TALK: Why do you want another drink?");
        text = "Why do you want another drink?";
        talk = true;
        break;
      case 'k':
        ROS_DEBUG("TALK: Don't you already have enough drinks?");
        text = "Don't you already have enough drinks?";
        talk = true;
        break;
      case 'i':
        ROS_DEBUG("TALK: I don't feel really well.");
        text = "I dont feel really well";
        talk = true;
        break;
      case 'q':
        r = system("eog -f $HOME/Pictures/black.jpg &");
        break;
      case 'w':
        r = system("eog -f $HOME/Pictures/gin.jpg &");
        break;
      case ' ':
      case KEYCODE_x:
      default:
        ROS_DEBUG("RELEASE");
        linear_ = 0;
        angular_ = 0;
        move = true;
        break;
    }


    if (move)
    {
      parallax_eddie_robot::Velocity vel;
      vel.angular = a_scale_ * angular_;
      vel.linear = l_scale_ * linear_;
      velocity_pub_.publish(vel);
      move = false;
    }
    if (talk)
    {
      parallax_eddie_robot::Speech speech;
      speech.text = text;
      speech_pub_.publish(speech);
      talk = false;
    }
  }
}

void quit(int sig)
{
  tcsetattr(kfd, TCSANOW, &cooked);
  ros::shutdown();
  exit(0);
}

/*
 *
 */
int main(int argc, char** argv)
{
  ros::init(argc, argv, "eddie_teleop");
  EddieTeleop eddie_teleop;

  signal(SIGINT, quit);

  eddie_teleop.keyLoop();

  return (EXIT_SUCCESS);
}

