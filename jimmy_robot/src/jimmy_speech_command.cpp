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
#include <vector>
#include <sstream>
#include <fstream>

/*
 * CommandTrie is a class that contains all the possible valid that could be
 * understood. It is developed based on the Suffix Trie data structure.
 */
class CommandTrie
{
public:
  CommandTrie();
  std::string element_;
  std::vector<CommandTrie> children_;
  void populate(std::vector<std::vector<std::string> > commandSet);
  void add(std::vector<std::string> command);
  bool containsCommand(std::vector<std::string> sentence, std::vector<std::string>& cmd);
private:
  void add$(std::vector<std::string> command);
  bool containsCommand$(std::vector<std::string> sentence, std::vector<std::string>& cmd, 
    CommandTrie* root);
};

CommandTrie::CommandTrie()
{
  element_ = "$root";
}

void CommandTrie::populate(std::vector<std::vector<std::string> > commandSet)
{
  for(uint i=0; i<commandSet.size(); i++){
    add(commandSet[i]);
  }
}
void CommandTrie::add(std::vector<std::string> command)
{
  std::string end = "$end";
  command.push_back(end);
  add$(command);
}

void CommandTrie::add$(std::vector<std::string> command)
{
  if(command.size()==0){
    return;
  }
  for(uint i=0; i<children_.size(); i++){
    if(children_[i].element_==command[0]){
      if(command.size()>1){
        std::vector<std::string> sub(&command[1],&command[command.size()]);
        children_[i].add$(sub);
      }
      return;
    }
  }
  CommandTrie child;
  child.element_ = command[0];
  if(command.size()>1){
    std::vector<std::string> sub(&command[1],&command[command.size()]);
    child.add$(sub);
  }
  children_.push_back(child);
  return;
}

bool CommandTrie::containsCommand(std::vector<std::string> sentence, std::vector<std::string>& cmd)
{
  if(sentence.size()==0)
    return false;
  std::string end = "$end";
  sentence.push_back(end);
  return containsCommand$(sentence, cmd, const_cast<CommandTrie *>(this));
}

bool CommandTrie::containsCommand$(std::vector<std::string> sentence, std::vector<std::string>& cmd, 
  CommandTrie* root)
{
  bool star = false;
  for(uint i=0; i<sentence.size(); i++){
    for(uint j=0; j<children_.size(); j++){
      if(sentence[i]==children_[j].element_){
        if(sentence[i]=="$end"){
          return true;
        }
        else{
          cmd.push_back(sentence[i]);
          std::vector<std::string> subsentence(&sentence[i+1], &sentence[sentence.size()]);
          return children_[j].containsCommand$(subsentence, cmd, root);
        }
      }
      if(children_[j].element_=="*"){
        star = true;
      }
    }
    if(star){
      cmd.clear();
      std::vector<std::string> subsentence(&sentence[i], &sentence[sentence.size()]);
      return root->containsCommand$(subsentence, cmd, root);
    }
  }
  cmd.clear();
  return false;
}

/*
 * JimmySpeechCommand is a class that takes the recognized sentence from the
 * speech recognizer (pocketsphinx) and extracts the command contained in the
 * sentence (if there is any).
 */
class JimmySpeechCommand
{
public:
  JimmySpeechCommand();

private:
  ros::NodeHandle node_handle_;
  ros::Subscriber speech_sub_;
  ros::Publisher voice_command_pub_;
  CommandTrie command_trie_;

  void speechCallback(const std_msgs::String::ConstPtr& message);
  void parseCommands(std::string filename);
  std::vector<std::string> parseString(std::string sentence);
  std::vector<std::string> cmd;
};

JimmySpeechCommand::JimmySpeechCommand()
{
  speech_sub_ = node_handle_.subscribe("/recognizer/output", 1, &JimmySpeechCommand::speechCallback, this);
  voice_command_pub_ = node_handle_.advertise<std_msgs::String > ("/jimmy/voice_command", 1);

  std::string file;
  if (node_handle_.getParam("command_list", file))
  {
    ROS_INFO("Using command_list file: %s", file.c_str());
    parseCommands(file);
  }
  else
  {
    ROS_ERROR("Please set the command_list (file) parameter for jimmy_speech_command");
    ros::requestShutdown();
  }
}

void JimmySpeechCommand::parseCommands(std::string filename)
{
  std::ifstream infile;
  std::string command;
  std::vector<std::vector<std::string> > commandSet;
  infile.open(filename.data());
  while (!infile.eof())
  {
    getline(infile, command);
    std::vector<std::string> parsedCmd = parseString(command);
    commandSet.push_back(parsedCmd);
  }
  infile.close();
  command_trie_.populate(commandSet);
}

std::vector<std::string> JimmySpeechCommand::parseString(std::string sentence)
{
  std::istringstream stream(sentence);
  std::vector<std::string> words;

  do{
    std::string sub;
    stream >> sub;
    words.push_back(sub);
  }while(stream);
  return words;
}

void JimmySpeechCommand::speechCallback(const std_msgs::String::ConstPtr& message)
{
  std_msgs::String recognized;
  std::string speech = message->data;
  std::vector<std::string> command;
  std::string rec("");
  std::vector<std::string> parsedSpch = parseString(speech);
  if(command_trie_.containsCommand(parsedSpch, command)){
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
  ros::init(argc, argv, "jimmy_speech_listener");
  JimmySpeechCommand listener;
  ros::spin();

  return (EXIT_SUCCESS);
}

