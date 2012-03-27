/* 
 * File:   text_to_speech_talker.h
 * Author: haikalpribadi
 *
 * Created on March 28, 2012, 12:39 AM
 */

#ifndef _TEXT_TO_SPEECH_TALKER_H
#define	_TEXT_TO_SPEECH_TALKER_H

#include "ros/ros.h"
#include "std_msgs/String.h"
#include <festival/festival.h>

/*
 * TextToSpeechTalker is a text-to-speech program that uses the Festival library.
 * Text inputs are taken from the topic /speech/text_to_speech_input
 */

class TextToSpeechTalker
{
public:
  TextToSpeechTalker();

private:
  ros::NodeHandle node_handle_;
  ros::Subscriber speech_sub_;
  void speechCallback(const std_msgs::String::ConstPtr& message);
};

#endif	/* _TEXT_TO_SPEECH_TALKER_H */

