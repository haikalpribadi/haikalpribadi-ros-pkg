/*
 * Software License Agreement (BSD License)
 *
 * Copyright (c) 2012, Haikal Pribadi <haikal.pribadi@gmail.com>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials provided
 *    with the distribution.
 *  * Neither the name of the Haikal Pribadi nor the names of other
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#include "ros/ros.h"
#include "std_msgs/String.h"
#include <festival/festival.h>

/*
 * JimmySpeechTalker is a speech-to-text program that uses the Festival library
 */
class JimmySpeechTalker
{
public:
  JimmySpeechTalker();

private:
  ros::NodeHandle node_handle_;
  ros::Subscriber speech_sub_;
  void speechCallback(const std_msgs::String::ConstPtr& message);
};

JimmySpeechTalker::JimmySpeechTalker()
{
  speech_sub_ = node_handle_.subscribe("/jimmy/speech_text_input", 1, &JimmySpeechTalker::speechCallback, this);
  int heap_size = 210000;
  int load_init_files = 1;
  festival_initialize(load_init_files, heap_size);
  //festival_eval_command("(voice_rab_diphone)");
}

void JimmySpeechTalker::speechCallback(const std_msgs::String::ConstPtr& message)
{
  ROS_INFO("SPEECH: %s", message->data.c_str());
  festival_say_text(message->data.c_str());
  festival_wait_for_spooler();
}

/*
 * 
 */
int main(int argc, char** argv)
{
  ros::init(argc, argv, "jimmy_speech_talker");
  JimmySpeechTalker talker;
  ros::spin();

  return (EXIT_SUCCESS);
}

