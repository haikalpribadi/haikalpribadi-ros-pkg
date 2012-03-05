/* 
 * File:   eddie_speech.cpp
 * Author: haikalpribadi
 *
 * Created on February 26, 2012, 4:33 AM
 */

#include "ros/ros.h"
#include "parallax_eddie_robot/Speech.h"
#include <festival/festival.h>

class EddieSpeech
{
public:
  EddieSpeech();

private:
  ros::NodeHandle node_handle_;
  ros::Subscriber speech_sub_;
  void speechCallback(const parallax_eddie_robot::Speech::ConstPtr& message);
};

EddieSpeech::EddieSpeech()
{
  speech_sub_ = node_handle_.subscribe("text_to_speech", 1, &EddieSpeech::speechCallback, this);
  int heap_size = 210000;
  int load_init_files = 1;
  festival_initialize(load_init_files, heap_size);
  //festival_eval_command("(voice_rab_diphone)");
}

void EddieSpeech::speechCallback(const parallax_eddie_robot::Speech::ConstPtr& message)
{
  ROS_INFO("SPEECH: %s", message->text.c_str());
  festival_say_text(message->text.c_str());
  festival_wait_for_spooler();
}

/*
 * 
 */
int main(int argc, char** argv)
{
  ros::init(argc, argv, "eddie_speech");
  EddieSpeech speech;
  ros::spin();

  return (EXIT_SUCCESS);
}

