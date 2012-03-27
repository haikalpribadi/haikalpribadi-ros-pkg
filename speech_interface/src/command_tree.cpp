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


#include "command_tree.h"

/*
 * CommandTrie is a class that contains all the possible valid that could be
 * understood. It is developed based on the Suffix Trie data structure.
 */

CommandTree::CommandTree()
{
  element_ = "$root";
}

void CommandTree::populate(std::vector<std::vector<std::string> > commandSet)
{
  for(uint i=0; i<commandSet.size(); i++){
    add(commandSet[i]);
  }
}
void CommandTree::add(std::vector<std::string> command)
{
  std::string end = "$end";
  command.push_back(end);
  add$(command);
}

void CommandTree::add$(std::vector<std::string> command)
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
  CommandTree child;
  child.element_ = command[0];
  if(command.size()>1){
    std::vector<std::string> sub(&command[1],&command[command.size()]);
    child.add$(sub);
  }
  children_.push_back(child);
  return;
}

bool CommandTree::containsCommand(std::vector<std::string> sentence, std::vector<std::string>& cmd)
{
  if(sentence.size()==0)
    return false;
  std::string end = "$end";
  sentence.push_back(end);
  return containsCommand$(sentence, cmd, const_cast<CommandTree *>(this));
}

bool CommandTree::containsCommand$(std::vector<std::string> sentence, std::vector<std::string>& cmd,
  CommandTree* root)
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

