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


#include "speech_to_command.h"

/*
 * SpeechToCommand is a class that takes the recognized sentence from the
 * speech recognizer (pocketsphinx) and extracts the command contained in the
 * sentence (if there is any) based on the given commands that are recognized.
 */

SpeechToCommand::SpeechToCommand()
{
  speech_sub_ = node_handle_.subscribe("/recognizer/output", 1, &SpeechToCommand::speechCallback, this);
  voice_command_pub_ = node_handle_.advertise<std_msgs::String > ("/speech/speech_to_command", 1);

  std::string file;
  if (node_handle_.getParam("command_list", file))
  {
    ROS_INFO("Using command_list file: %s", file.c_str());
    parseCommands(file);
  }
  else
  {
    ROS_ERROR("Please set the command_list (file) parameter for speech_to_command");
    ros::requestShutdown();
  }
}

void SpeechToCommand::parseCommands(std::string filename)
{
  std::ifstream infile;
  std::string command;
  std::vector<std::vector<std::string> > commandSet;
  infile.open(filename.data());
  while (!infile.eof())
  {
    getline(infile, command);
    std::vector<std::string> parsedCmd = parseString(command);
    if(parsedCmd.size()==0)
      continue;
    commandSet.push_back(parsedCmd);
  }
  infile.close();
  command_tree_.populate(commandSet);
  //uncomment the following line to view the command tree build by this parser
  //CommandTree::print(command_tree_);
}

std::vector<std::string> SpeechToCommand::parseString(std::string sentence)
{
  std::istringstream stream(sentence);
  std::vector<std::string> words;

  while(true){
    std::string sub;
    stream >> sub;
    if(sub.size()==0)
      break;
    words.push_back(sub);
  }
  return words;
}

void SpeechToCommand::speechCallback(const std_msgs::String::ConstPtr& message)
{
  std_msgs::String recognized;
  std::string speech = message->data;
  std::vector<std::string> command;
  std::string rec("");
  std::vector<std::string> parsedSpch = parseString(speech);
  if(command_tree_.containsCommand(parsedSpch, command)){
    for(uint i=0; i<command.size(); i++){
      rec += command[i];
      if(i!=command.size()-1)
        rec += " ";
    }
    recognized.data = rec;
  }
  else{
    recognized.data = "unrecognized";
  }
  voice_command_pub_.publish(recognized);
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "speech_to_command");
  SpeechToCommand listener;
  ros::spin();

  return (EXIT_SUCCESS);
}

