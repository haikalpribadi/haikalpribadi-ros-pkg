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

#ifndef _CAMERA_TILT_H
#define	_CAMERA_TILT_H

#include <ros/ros.h>
#include <semaphore.h>
#include <std_msgs/Float64.h>
#include <user_tracker/Coordinate.h>
#include <user_tracker/GetCameraAngle.h>

#define PI 3.14159265

class CameraTilt {
public:
    CameraTilt();
private:
    sem_t mutex_;
    ros::NodeHandle node_handle_;
    ros::Subscriber target_angle_sub_;
    ros::Subscriber current_angle_sub_;
    ros::Subscriber set_angle_sub_;
    ros::Publisher set_angle_pub_;
    ros::ServiceServer get_angle_srv_;

    double tilt_angle_;

    void cameraTargetCallback(const user_tracker::Coordinate::ConstPtr& message);
    void currentAngleCallback(const std_msgs::Float64::ConstPtr& message);
    void setAngleCallback(const std_msgs::Float64::ConstPtr& message);
    bool getAngle(user_tracker::GetCameraAngle::Request &req,
        user_tracker::GetCameraAngle::Response &res);
};

#endif	/* _CAMERA_TILT_H */

