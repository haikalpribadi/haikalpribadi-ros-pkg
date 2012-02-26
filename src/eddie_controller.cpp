/*
 * parallax_board.cpp
 * Author: Haikal Pribadi (haikal.pribadi@gmail.com)
 *
 * Created on February 24, 2012, 1:51 PM
 */

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

  void velocityCallback(const parallax_eddie_robot::Velocity::ConstPtr& message);
private:
  ros::NodeHandle node_handle_;
  ros::Subscriber velocity_sub_;
  ros::ServiceClient eddie_drive_power_;
  ros::ServiceClient eddie_turn_;
  ros::ServiceClient eddie_stop_;

};

EddieController::EddieController()
{
  velocity_sub_ = node_handle_.subscribe("command_velocity", 1, &EddieController::velocityCallback, this);
  eddie_drive_power_ = node_handle_.serviceClient<parallax_eddie_robot::DriveWithPower > ("drive_with_power");
  eddie_turn_ = node_handle_.serviceClient<parallax_eddie_robot::Rotate > ("rotate");
  eddie_stop_ = node_handle_.serviceClient<parallax_eddie_robot::StopAtDistance > ("stop_at_distance");

}

void EddieController::velocityCallback(const parallax_eddie_robot::Velocity::ConstPtr& message)
{
  float linear = message->linear;
  float angular = message->angular;

  if (linear == 0 && angular == 0)
  {
    parallax_eddie_robot::StopAtDistance dist;
    dist.request.distance = 5;
    for(int i=0; !eddie_stop_.call(dist) && i<5; i++)
    {
      ROS_ERROR("ERROR: at trying to stop Eddie. Trying to auto send command again...");
    }
  }
  else if (linear != 0 && angular == 0)
  {
    parallax_eddie_robot::DriveWithPower power;
    power.request.left = 40 * (linear / abs(linear));
    power.request.right = 40 * (linear / abs(linear));
    if (eddie_drive_power_.call(power))
    {
      ROS_INFO("SUCCESS: Moving FORWARD/REVERSE");
    }
    else
    {
      ROS_ERROR("ERROR: at trying to move Eddie forward/reverse. Please try sending command again...");
    }
  }
  else if (linear == 0 && angular != 0)
  {
    parallax_eddie_robot::Rotate degree;
    degree.request.angle = angular / abs(angular) * 360;
    degree.request.speed = 36;
    if (eddie_turn_.call(degree))
    {
      ROS_INFO("SUCCESS: rotating RIGHT/LEFT");
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

