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
  text_pub_ = node_handle_.advertise<parallax_eddie_robot::Speech > ("/eddie/text_to_speech", 1);
}

void EddieText::readLoop()
{
  ROS_INFO("Welcome to Eddie's text-to-speech input controller");
  ROS_INFO("==================================================");
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

