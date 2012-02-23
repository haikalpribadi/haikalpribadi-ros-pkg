/*
 * File:   parallax_ir.cpp
 * Author: Haikal Pribadi (haikal.pribadi@gmail.com)
 *
 * Created on February 22, 2012, 9:33 PM
 */

#include "ros/ros.h"
#include "parallax_eddie_robot/Ping.h"
#include "parallax_eddie_robot/Distances.h"


//==============================================================================//
// This class is provided as a template for future features on the Ping sensors //
//==============================================================================//
class ParallaxPing
{
public:
  ParallaxPing();

  void pingCallback(const parallax_eddie_robot::Ping::ConstPtr& message);

private:
  ros::NodeHandle node_handle_;
  ros::Publisher ping_pub_;
  ros::Subscriber ping_sub_;
};

ParallaxPing::ParallaxPing()
{
  ping_pub_ = node_handle_.advertise<parallax_eddie_robot::Distances > ("ping_distances", 1);
  ping_sub_ = node_handle_.subscribe("ping_data", 1, &ParallaxPing::pingCallback, this);
}

void ParallaxPing::pingCallback(const parallax_eddie_robot::Ping::ConstPtr& message)
{
  parallax_eddie_robot::Distances distances;
  uint16_t d;
  if (message->status.substr(0, 5) == "ERROR") // ERROR messages may be longer than 5 if in VERBOSE mode
  {
    ROS_INFO("ERROR: Unable to read Ping data from ping sensors");
    return;
  }
  for (uint i = 0; i < message->value.size(); i++)
  {
    //OTHER WAYS OF ENCODING THE DATA MAY BE DONE HERE.
    //DEFAULT DATA REPRESENTS DISTANCE IN MILLIMETERS
    d = message->value[i];
    distances.value.push_back(d);
  }
  ping_pub_.publish(distances);
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "parallax_ping");
  ParallaxPing ping;
  ros::spin();

  return 0;
}