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

#ifndef _EDDIE_CONTROLLER_H
#define	_EDDIE_CONTROLLER_H

#include "ros/ros.h"
#include "parallax_eddie_robot/Velocity.h"
#include "parallax_eddie_robot/DriveWithDistance.h"
#include "parallax_eddie_robot/DriveWithPower.h"
#include "parallax_eddie_robot/DriveWithSpeed.h"
#include "parallax_eddie_robot/Rotate.h"
#include "parallax_eddie_robot/StopAtDistance.h"

class EddieController
{
public:
  EddieController();

private:
  ros::NodeHandle node_handle_;
  ros::Subscriber velocity_sub_;
  ros::ServiceClient eddie_drive_power_;
  ros::ServiceClient eddie_turn_;
  ros::ServiceClient eddie_stop_;

  int left_power_, right_power_;

  void velocityCallback(const parallax_eddie_robot::Velocity::ConstPtr& message);
};

#endif	/* _EDDIE_CONTROLLER_H */

