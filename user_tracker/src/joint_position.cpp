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

#include "joint_position.h"


JointPosition::JointPosition()
{
  get_joint_coordinate_srv_ = node_handle_.advertiseService("get_joint_coordinate",
    &JointPosition::getJointCoordinate, this);
}

bool JointPosition::getJointCoordinate(user_tracker::GetJointCoordinate::Request& req,
  user_tracker::GetJointCoordinate::Response& res)
{
  /*if(req.joint!="head" && req.joint!="neck" && req.joint!="torso"
     req.joint!="left_shoulder" && req.joint!="left_elbow" && req.joint!="left_hand"
     req.joint!="right_shoulder" && req.joint!="right_elbow" && req.joint!="right_hand"
     req.joint!="left_hip" && req.joint!="left_knee" && req.joint!="left_foot"
     req.joint!="right_hip" && req.joint!="right_knee" && req.joint!="right_foot");
  {
    std::string message;
    message = "Invalid joint name was provided to get_joint_coordinate.";
    message += "\nPossible joint names are: head, neck, torso, left_shoulder, left_elbow, ";
    message += "left_hand, right_shoulder, right_elbow, right_hand, left_hip, left_knee, ";
    message += "left_foot, right_hip, right_knee, right_foot";
    ROS_ERROR("%s", message);
    return false;
  }*/

  tf::StampedTransform joint_transform;
  try
  {
    tf_kinect_listener_.lookupTransform("/openni_depth_frame", "/"+req.joint,
      ros::Time(0), joint_transform);
  }
  catch(tf::TransformException ex)
  {
    ROS_ERROR("%s", ex.what());
    return false;
  }

  res.x = joint_transform.getOrigin().x();
  res.y = joint_transform.getOrigin().y();
  res.z = joint_transform.getOrigin().z();

  return true;
}
/*
 * 
 */
int main(int argc, char** argv)
{
  ros::init(argc, argv, "joint_position");
  JointPosition joint_position;
  ros::spin();

  return (EXIT_SUCCESS);
}

