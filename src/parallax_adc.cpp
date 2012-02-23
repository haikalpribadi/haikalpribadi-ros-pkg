/* 
 * File:   parallax_ir.cpp
 * Author: Haikal Pribadi (haikal.pribadi@gmail.com)
 * 
 * Created on February 22, 2012, 9:33 PM
 */

#include "ros/ros.h"
#include "parallax_eddie_robot/ADC.h"
#include "parallax_eddie_robot/BatteryLevel.h"
#include "parallax_eddie_robot/Voltages.h"

class ParallaxADC
{
public:
  ParallaxADC();

  void adcCallback(const parallax_eddie_robot::ADC::ConstPtr& message);

private:
  ros::NodeHandle node_handle_;
  ros::Publisher ir_pub_;
  ros::Publisher battery_pub_;
  ros::Subscriber adc_sub_;
  const double ADC_VOLTAGE_DIVIDER;
  const double BATTERY_VOLTAGE_MULTIPLIER;
  
};

ParallaxADC::ParallaxADC() :
  ADC_VOLTAGE_DIVIDER(819),
  BATTERY_VOLTAGE_MULTIPLIER(3.21)
{
  ir_pub_ = node_handle_.advertise<parallax_eddie_robot::Voltages > ("ir_voltages", 1);
  battery_pub_ = node_handle_.advertise<parallax_eddie_robot::BatteryLevel > ("battery_level", 1);
  adc_sub_ = node_handle_.subscribe("adc_data", 1, &ParallaxADC::adcCallback, this);
}

void ParallaxADC::adcCallback(const parallax_eddie_robot::ADC::ConstPtr& message)
{
  parallax_eddie_robot::Voltages voltages_;
  parallax_eddie_robot::BatteryLevel level_;
  double v, l;
  if (message->status.substr(0, 5) == "ERROR") // ERROR messages may be longer than 5 if in VERBOSE mode
  {
    ROS_INFO("ERROR: Unable to read ADC data for IR");
    return;
  }

  uint i;
  for (i = 0; i < message->value.size() - 1; i++)
  {
    v = message->value[i];
    if (v > 10)
    {
      v = v / ADC_VOLTAGE_DIVIDER;
      voltages_.value.push_back(v);
    }
  }
  l = message->value[i];
  l = l / ADC_VOLTAGE_DIVIDER * BATTERY_VOLTAGE_MULTIPLIER;
  level_.value = l;
  ir_pub_.publish(voltages_);
  battery_pub_.publish(level_);
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "parallax_adc");
  ParallaxADC adc;
  ros::spin();

  return 0;
}