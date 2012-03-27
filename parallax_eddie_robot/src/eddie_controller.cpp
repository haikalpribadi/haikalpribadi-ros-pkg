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

#include "eddie_controller.h"

EddieController::EddieController() :
  left_power_(60), right_power_(62)
{
  velocity_sub_ = node_handle_.subscribe("/eddie/command_velocity", 1, &EddieController::velocityCallback, this);
  eddie_drive_power_ = node_handle_.serviceClient<parallax_eddie_robot::DriveWithPower > ("drive_with_power");
  eddie_turn_ = node_handle_.serviceClient<parallax_eddie_robot::Rotate > ("rotate");
  eddie_stop_ = node_handle_.serviceClient<parallax_eddie_robot::StopAtDistance > ("stop_at_distance");

  node_handle_.param("left_motor_power", left_power_, left_power_);
  node_handle_.param("right_motor_power", right_power_, right_power_);

}

void EddieController::velocityCallback(const parallax_eddie_robot::Velocity::ConstPtr& message)
{
  float linear = message->linear;
  float angular = message->angular;

  if (linear == 0 && angular == 0)
  {
    parallax_eddie_robot::StopAtDistance dist;
    dist.request.distance = 3;
    for (int i = 0; !eddie_stop_.call(dist) && i < 5; i++)
    {
      ROS_ERROR("ERROR: at trying to stop Eddie. Trying to auto send command again...");
    }
  }
  else if (linear != 0 && angular == 0)
  {
    parallax_eddie_robot::DriveWithPower power;
    int8_t left, right;

    if(left_power_*abs(linear)>127){
      if (linear > 0)
        left = 127;
      else
        left = -127;
    }
    else
      left = left_power_ * linear;

    if(right_power_*abs(linear)>127){
      if (linear > 0)
        right = 127;
      else
        right = -127;
    }
    else
      right = right_power_ * linear;

    power.request.left = left;
    power.request.right = right;
    if (eddie_drive_power_.call(power))
    {
      if (linear / abs(linear) > 0)
        ROS_INFO("SUCCESS: Moving FORWARD");
      else
        ROS_INFO("SUCCESS: Moving REVERSE");
    }
    else
    {
      ROS_ERROR("ERROR: at trying to move Eddie forward/reverse. Please try sending command again... %d, %d,", left, right);
    }
  }
  else if (linear == 0 && angular != 0)
  {
    parallax_eddie_robot::Rotate degree;
    degree.request.angle = angular * 180;
    degree.request.speed = 36;
    if (eddie_turn_.call(degree))
    {
      if (angular / abs(angular) > 0)
        ROS_INFO("SUCCESS: rotating RIGHT");
      else
        ROS_INFO("SUCCESS: rotating LEFT");
    }
    else
    {
      ROS_ERROR("ERROR: at trying to rotate Eddie right/left. Please try sending command again...");
    }
  }
}

/*
 * 
 */
int main(int argc, char** argv)
{
  ros::init(argc, argv, "eddie_controller");
  EddieController controller;
  ros::spin();

  return (EXIT_SUCCESS);
}

