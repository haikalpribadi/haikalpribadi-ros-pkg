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
  left_power_(60), right_power_(62), power_acceleration_(24), min_power_(32),
  left_speed_(36), right_speed_(36), rotation_speed_(36), speed_acceleration_(36)
{
  velocity_sub_ = node_handle_.subscribe("/eddie/command_velocity", 1, &EddieController::velocityCallback, this);
  eddie_drive_power_ = node_handle_.serviceClient<parallax_eddie_robot::DriveWithPower > ("drive_with_power");
  eddie_drive_speed_ = node_handle_.serviceClient<parallax_eddie_robot::DriveWithSpeed > ("drive_with_speed");
  eddie_acceleration_rate_ = node_handle_.serviceClient<parallax_eddie_robot::Accelerate > ("acceleration_rate");
  eddie_turn_ = node_handle_.serviceClient<parallax_eddie_robot::Rotate > ("rotate");
  eddie_stop_ = node_handle_.serviceClient<parallax_eddie_robot::StopAtDistance > ("stop_at_distance");

  node_handle_.param("left_motor_power", left_power_, left_power_);
  node_handle_.param("right_motor_power", right_power_, right_power_);
  node_handle_.param("power_acceleration", power_acceleration_, power_acceleration_);
  node_handle_.param("left_motor_speed", left_speed_, left_speed_);
  node_handle_.param("right_motor_speed", right_speed_, right_speed_);
  node_handle_.param("rotation_speed", rotation_speed_, rotation_speed_);
  node_handle_.param("speed_acceleration", speed_acceleration_, speed_acceleration_);
  node_handle_.param("min_power", min_power_, min_power_);
  
  sem_init(&mutex_execute_, 0, 1);
  sem_init(&mutex_interrupt_, 0, 1);
  sem_init(&mutex_state_, 0, 1);

  sem_wait(&mutex_state_);
  current_speed_ = 0;
  current_power_ = 16;
  left_ = 0;
  right_ = 0;
  process_ = false;
  accelerate_time_ = ros::Time::now();
  sem_post(&mutex_state_);
  sem_wait(&mutex_interrupt_);
  interrupt_ = false;
  sem_post(&mutex_interrupt_);

  setAccelerationRate(speed_acceleration_);
}

void EddieController::velocityCallback(const parallax_eddie_robot::Velocity::ConstPtr& message)
{
  float linear = message->linear;
  int16_t angular = message->angular;

  if (linear == 0 && angular == 0)
  {
    stop();
  }
  else if (linear != 0 && angular == 0)
  {
    moveLinear(linear);
  }
  else if (linear == 0 && angular != 0)
  {
    moveAngular(angular);
  }
  else //if (linear!=0 && angular !=0)
  {
    moveLinearAngular(linear, angular);
  }
}

void EddieController::stop()
{
  parallax_eddie_robot::StopAtDistance dist;
  dist.request.distance = 4;
  
  sem_wait(&mutex_interrupt_);
  interrupt_ = true;
  sem_post(&mutex_interrupt_);
  
  for (int i = 0; !eddie_stop_.call(dist) && i < 5; i++)
  {
    ROS_ERROR("ERROR: at trying to stop Eddie. Trying to auto send command again...");
  }
  current_power_ = 0;
}

int8_t EddieController::clipPower(int power_unit, float linear)
{
  int8_t power;
  if (power_unit * abs(linear) > 127)
  {
    if (linear > 0)
      power = 127;
    else
      power = -127;
  }
  else
    power = power_unit * linear;

  return power;
}

int16_t EddieController::clipSpeed(int speed_unit, float linear)
{
  int16_t speed;
  if (speed_unit * abs(linear) > 32767)
  {
    if (linear > 0)
      speed = 32767;
    else
      speed = -32767;
  }
  else
    speed = speed_unit * linear;

  return speed;
}

void EddieController::setAccelerationRate(int rate)
{
  parallax_eddie_robot::Accelerate acc;
  acc.request.rate = speed_acceleration_;
  if (eddie_acceleration_rate_.call(acc))
  {
    ROS_INFO("SUCCESS: Set acceleration rate to %d", rate);
  }
  else
  {
    ROS_ERROR("ERROR: Failed to set acceleration rate to %d", rate);
  }
}

void EddieController::moveLinear(float linear)
{
  parallax_eddie_robot::DriveWithPower power;
  int8_t left, right;

  left = clipPower(left_power_, linear);
  right = clipPower(right_power_, linear);
  
  sem_wait(&mutex_interrupt_);
  interrupt_ = true;
  left_ = left;
  right_ = right;
  process_ = true;
  sem_post(&mutex_interrupt_);
  //drive(left, right);
}

void EddieController::moveAngular(int16_t angular)
{
  parallax_eddie_robot::Rotate degree;
  degree.request.angle = angular;
  degree.request.speed = rotation_speed_;
  
  sem_wait(&mutex_interrupt_);
  interrupt_ = true;
  sem_post(&mutex_interrupt_);
  if (eddie_turn_.call(degree))
  {
    if (angular / abs(angular) > 0)
      ROS_INFO("SUCCESS: Rotating RIGHT");
    else
      ROS_INFO("SUCCESS: Rotating LEFT");
  }
  else
  {
    ROS_ERROR("ERROR: at trying to rotate Eddie right/left. Please try sending command again...");
  }
}

void EddieController::moveLinearAngular(float linear, int16_t angular)
{
  parallax_eddie_robot::DriveWithPower power;
  int8_t left, right;
  if (angular > 0)
  {
    angular = angular % 360;
    left = clipPower(left_power_, linear);
    right = left - (int8_t) (left * (float) angular / 180);
  }
  else
  {
    angular = angular % 360;
    right = clipPower(right_power_, linear);
    left = right - (int8_t) (right * (float) angular / -180);
  }
  
  sem_wait(&mutex_interrupt_);
  interrupt_ = true;
  left_ = left;
  right_ = right;
  process_ = true;
  sem_post(&mutex_interrupt_);
  //drive(left, right);
}

void EddieController::drive(int8_t left, int8_t right)
{
  sem_wait(&mutex_execute_);
  sem_wait(&mutex_interrupt_);
  interrupt_ = false;
  bool cancel = interrupt_;
  sem_post(&mutex_interrupt_);
  
  parallax_eddie_robot::DriveWithPower power;
  ros::Time now;
  bool shift = true;
  int8_t previous_power = 0;
  
  //ROS_INFO("GOT HERE 3 left: %d, right: %d, cancel: %d, shift: %d, power: %d", 
  //  left, right, cancel, shift, current_power_);
  while (ros::ok() && shift && !cancel)
  {
    now = ros::Time::now();
    if ((now.toSec() - accelerate_time_.toSec())>=0.1)
    {
      previous_power = current_power_;
      updatePower(left, right);
      
      if (left > right)
      {
        power.request.left = current_power_;
        power.request.right = (int8_t)(current_power_ * ((double)right/left));
      }
      else
      {
        power.request.right = current_power_;
        power.request.left = (int8_t)(current_power_ * ((double)left/right));
      }
      if(eddie_drive_power_.call(power))
      {
        ROS_INFO("SUCCESS: Driving with power left: %d, right: %d", 
          power.request.left, power.request.right);
        accelerate_time_ = ros::Time::now();
      }
      else{
        current_power_ = previous_power;
      }
    }
    ros::spinOnce();
    usleep(1000);
    sem_wait(&mutex_interrupt_);
    cancel = interrupt_;
    sem_post(&mutex_interrupt_);
    if(left!=current_power_ || right!=current_power_)
      shift = true;
    else
      shift = false;
  }
    
  sem_post(&mutex_execute_);
}

void EddieController::updatePower(int8_t left, int8_t right)
{
  if(left>0 && right>0)
  {
    if(current_power_>-1*min_power_ && current_power_<min_power_)
      current_power_ = min_power_;

    if(current_power_>power_acceleration_+left && current_power_>power_acceleration_+right)
      current_power_ = left>right ? left-power_acceleration_ : right-power_acceleration_;
    else if(current_power_>left || current_power_>right)
      current_power_ = left>right ? left : right;
    else if(current_power_<-1*min_power_)
      current_power_ += 10;
    else
      current_power_ += power_acceleration_ / 10;
    
  }
  else if(left<0 && right<0)
  {
    if(current_power_>-1*min_power_ && current_power_<min_power_)
      current_power_ = -1*min_power_;

    if(current_power_<left-power_acceleration_ && current_power_<right-power_acceleration_)
      current_power_ = left>right ? left-power_acceleration_ : right-power_acceleration_;
    else if(current_power_<left || current_power_<right)
      current_power_ = left<right ? left : right;
    else if(current_power_>min_power_)
      current_power_ -= 10;
    else
      current_power_ -= power_acceleration_ / 10;
  }
}

void EddieController::execute()
{
  ros::Rate rate(1000);
  while(ros::ok())
  {
    sem_wait(&mutex_interrupt_);
    bool ex = process_;
    sem_post(&mutex_interrupt_);
    if(ex)
    {
      sem_wait(&mutex_interrupt_);
      process_ = false;
      int8_t l = left_;
      int8_t r = right_;
      sem_post(&mutex_interrupt_);
      drive(l, r);
    }
    
    ros::spinOnce();
    rate.sleep();
  }
}

/*
 * 
 */
int main(int argc, char** argv)
{
  ros::init(argc, argv, "eddie_controller");
  EddieController controller;
  controller.execute();

  return (EXIT_SUCCESS);
}

