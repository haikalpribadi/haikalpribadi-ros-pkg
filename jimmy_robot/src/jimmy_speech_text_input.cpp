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
#include <iostream>

/*
 * JimmySpeechTextInput is a console program to take text input to publish to
 * the /jimmy/speech_text_input topic, which will be used by the talker node.
 */
class JimmySpeechTextInput
{
public:
  JimmySpeechTextInput();
  void readLoop();

private:
  ros::NodeHandle node_handle_;
  ros::Publisher text_pub_;

};

JimmySpeechTextInput::JimmySpeechTextInput()
{
  text_pub_ = node_handle_.advertise<std_msgs::String > ("/jimmy/speech_text_input", 1);
}

void JimmySpeechTextInput::readLoop()
{
  ROS_INFO("Welcome to Eddie's text-to-speech input controller");
  ROS_INFO("==================================================");
  ROS_INFO("TYPE IN A MESSAGE AN HIT ENTER");

  std_msgs::String speech;
  std::string message = "";

  while (message != "exit" && ros::ok())
  {
    getline(std::cin, message); //this might hang the system upon terminating for
                                //a little while. The trick is to hit enter after
                                //pressing ctrl+C, so that the line buffer
                                //returns a value.
    ROS_INFO("TYPED MESSAGE: %s", message.data());
    speech.data = message;
    text_pub_.publish(speech);
  }
}
/*
 * 
 */
int main(int argc, char** argv)
{
  ros::init(argc, argv, "jimmy_speech_text_input");
  JimmySpeechTextInput textInput;
  textInput.readLoop();

  return (EXIT_SUCCESS);
}

