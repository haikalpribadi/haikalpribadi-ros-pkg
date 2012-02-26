/* 
 * File:   eddie_text.cpp
 * Author: haikalpribadi
 *
 * Created on February 26, 2012, 6:58 AM
 */

#include "ros/ros.h"
#include "parallax_eddie_robot/Speech.h"
#include <iostream>

class EddieText
{
public:
  EddieText();
  void readLoop();

private:
  ros::NodeHandle node_handle_;
  ros::Publisher text_pub_;

};

EddieText::EddieText()
{
  text_pub_ = node_handle_.advertise<parallax_eddie_robot::Speech > ("text_to_speech", 1);
}

void EddieText::readLoop()
{
  ROS_INFO("Welcome to Eddie's text-to-speech controller.");
  ROS_INFO("=============================================");
  ROS_INFO("TYPE IN A MESSAGE AN HIT ENTER");

  parallax_eddie_robot::Speech speech;
  std::string message = "";

  while (message != "exit")
  {
    getline(std::cin, message);
    ROS_INFO("TYPED MESSAGE: %s", message.data());
    speech.text = message;
    text_pub_.publish(speech);
  }
}

/*
 * 
 */
int main(int argc, char** argv)
{
  ros::init(argc, argv, "eddie_text");
  EddieText text;
  text.readLoop();

  return (EXIT_SUCCESS);
}

