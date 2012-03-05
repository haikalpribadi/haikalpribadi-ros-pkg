/*
 * parallax_board.cpp
 * Author: Haikal Pribadi (haikal.pribadi@gmail.com)
 * 
 * Created on February 19, 2012, 5:34 PM
 */

#include "ros/ros.h"
#include "eddie.h"
#include <sstream>
typedef std::map<std::string, unsigned char[6] > CommandMap;

Eddie::Eddie(std::string port) :
  GPIO_COUNT(10), ADC_PIN_COUNT(8), DIGITAL_PIN_COUNT(10), AUXILIARY_POWER_RELAY_COUNT(3),
  PARALLAX_MAX_BUFFER(256), ENCODER_COUNT(2), ADC_VOLTAGE_MULTIPLIER(1 / 819),
  BATTERY_VOLTAGE_DIVIDER(3.21), MOTOR_POWER_STOP(0), MOTOR_POWER_MAX_FORWARD(127),
  MOTOR_POWER_MAX_REVERSE(-127), TRAVEL_SPEED_MAX_FORWARD(32767), TRAVEL_SPEED_MAX_REVERSE(-32767),
  TRAVEL_MAX_SPEED(65535), RELAY_33V_PIN_NUMBER(17), RELAY_5V_PIN_NUMBER(17),
  RELAY_12V_PIN_NUMBER(18), PACKET_TERMINATOR('\r'), PARAMETER_DELIMITER(' '),
  ERROR("ERROR"), DEFAULT_WHEEL_RADIUS(0.0762), DEFAULT_TICKS_PER_REVOLUTION(36),
  GET_VERSION_STRING("VER"), SET_GPIO_DIRECTION_OUT_STRING("OUT"), SET_GPIO_DIRECTION_IN_STRING("IN"),
  SET_GPIO_STATE_HIGH_STRING("HIGH"), SET_GPIO_STATE_LOW_STRING("LOW"), GET_GPIO_STATE_STRING("READ"),
  GET_ADC_VALUE_STRING("ADC"), GET_PING_VALUE_STRING("PING"), SET_DRIVE_POWER_STRING("GO"),
  SET_DRIVE_SPEED_STRING("GOSPD"), SET_DRIVE_DISTANCE_STRING("TRVL"), SET_STOP_DISTANCE_STRING("STOP"),
  SET_ROTATE_STRING("TURN"), GET_CURRENT_SPEED_STRING("SPD"), GET_CURRENT_HEADING_STRING("HEAD"),
  GET_ENCODER_TICKS_STRING("DIST"), RESET_ENCODER_TICKS_STRING("RST"), SET_RAMPING_VALUE_STRING("ACC"),
  FLUSH_BUFFERS_STRING("\r\r\r")
{
  sem_init(&mutex, 0, 1);
  ping_pub_ = node_handle_.advertise<parallax_eddie_robot::Ping > ("ping_data", 1);
  adc_pub_ = node_handle_.advertise<parallax_eddie_robot::ADC > ("adc_data", 1);

  accelerate_srv_ = node_handle_.advertiseService("accelerate", &Eddie::accelerate, this);
  drive_with_distance_srv_ = node_handle_.advertiseService("drive_with_distance", &Eddie::driveWithDistance, this);
  drive_with_power_srv_ = node_handle_.advertiseService("drive_with_power", &Eddie::driveWithPower, this);
  drive_with_speed_srv_ = node_handle_.advertiseService("drive_with_speed", &Eddie::driveWithSpeed, this);
  get_distance_srv_ = node_handle_.advertiseService("get_distance", &Eddie::getDistance, this);
  get_heading_srv_ = node_handle_.advertiseService("get_heading", &Eddie::getHeading, this);
  get_speed_srv_ = node_handle_.advertiseService("get_speed", &Eddie::GetSpeed, this);
  reset_encoder_srv_ = node_handle_.advertiseService("reset_encoder", &Eddie::resetEncoder, this);
  rotate_srv_ = node_handle_.advertiseService("rotate", &Eddie::rotate, this);
  stop_at_distance_srv_ = node_handle_.advertiseService("stop_at_distance", &Eddie::stopAtDistance, this);

  initialize(port);
}

Eddie::~Eddie()
{
  command("STOP 0");
  close(tty_fd);
}

void Eddie::initialize(std::string port)
{
  ROS_INFO("Initializing Parallax board serial port connection");

  memset(&tio, 0, sizeof (tio));
  tio.c_iflag = 0;
  tio.c_oflag = 0;
  tio.c_cflag = CS8 | CREAD | CLOCAL; // 8n1, see termios.h for more information
  tio.c_lflag = 0;
  tio.c_cc[VMIN] = 1;
  tio.c_cc[VTIME] = 5;

  tty_fd = open(port.data(), O_RDWR | O_NONBLOCK);
  cfsetospeed(&tio, B115200); // 115200 baud
  cfsetispeed(&tio, B115200); // 115200 baud

  tcsetattr(tty_fd, TCSANOW, &tio);
  usleep(100000);
  //std::string result = command("GO 36 36");

}

std::string Eddie::command(std::string str)
{
  sem_wait(&mutex);
  ssize_t written;
  std::stringstream result("");
  int count = 0;
  unsigned char c;
  int size = str.size() + 1;
  unsigned char command[size];

  for (int i = 0; i < size - 1; i++)
  {
    command[i] = str[i];
  }
  command[size - 1] = PACKET_TERMINATOR; // Having exces terminator is okay, it's good to guarantee
  written = write(tty_fd, command, size);
  usleep(100); //Give some time for the board to process
  while (c != '\r' && count < 1000)
  {
    if (read(tty_fd, &c, 1) > 0)
    {
      result << c;
    }
    else{
      count++;
    }
  }
  if(count==1000){
    ROS_ERROR("ERROR: NO PARALLAX EDDIE ROBOT IS CONNECTED.");
  }
  sem_post(&mutex);
  return result.str();
}

std::string Eddie::generateCommand(std::string str1){
  std::stringstream ss;
  ss << str1 << PACKET_TERMINATOR;
  return ss.str();
}
std::string Eddie::generateCommand(std::string str1, int num1){
  std::stringstream ss;
  ss << str1 << PARAMETER_DELIMITER << intToHexString(num1) << PACKET_TERMINATOR;
  return ss.str();
}
std::string Eddie::generateCommand(std::string str1, int num1, int num2){
  std::stringstream ss;
  ss << str1 << PARAMETER_DELIMITER << intToHexString(num1) << PARAMETER_DELIMITER << intToHexString(num2) << PACKET_TERMINATOR;
  return ss.str();
}
std::string Eddie::intToHexString(int num){
  std::stringstream ss;
  ss << std::hex << num;
  return ss.str();
}

parallax_eddie_robot::Ping Eddie::getPingData()
{
  std::string result = command(GET_PING_VALUE_STRING);
  parallax_eddie_robot::Ping ping_data;
  if (result.size() <= 1)
  {
    ping_data.status = "EMPTY";
    return ping_data;
  }
  else if (result.size() >= 6)
  {
    if (result.substr(0, 5) == "ERROR")
    {
      ping_data.status = result;
      return ping_data;
    }
  }
  ping_data.status = "SUCCESS";
  std::stringstream value;
  uint16_t data;
  for (ushort i = 0; i < result.size(); i += 4)
  {
    if (result[i] == '\r') break;
    value << std::hex << result.substr(i, 3);
    value >> data;
    ping_data.value.push_back(data);
    value.str(std::string());
    value.clear();
  }
  return ping_data;
}

parallax_eddie_robot::ADC Eddie::getADCData()
{
  std::string result = command(GET_ADC_VALUE_STRING);
  parallax_eddie_robot::ADC adc_data;
  if (result.size() <= 1)
  {
    adc_data.status = "EMPTY";
    return adc_data;
  }
  else if (result.size() >= 6)
  {
    if (result.substr(0, 5) == "ERROR")
    {
      adc_data.status = result;
      return adc_data;
    }
  }
  adc_data.status = "SUCCESS";
  std::stringstream value;
  uint16_t data;
  for (ushort i = 0; i < result.size(); i += 4)
  {
    if (result[i] == '\r') break;
    value << std::hex << result.substr(i, 3);
    value >> data;
    adc_data.value.push_back(data);
    value.str(std::string());
    value.clear();
  }
  return adc_data;
}

bool Eddie::accelerate(parallax_eddie_robot::Accelerate::Request &req,
  parallax_eddie_robot::Accelerate::Response &res)
{
  //this feature does not need to validate the parameters due the limited range of parameter data type
  std::string cmd;
  cmd = generateCommand(SET_RAMPING_VALUE_STRING, req.rate);
  std::string cmd_response = command(cmd);
  if (cmd_response == "\r")
    return true;
  else
    return false;
}

bool Eddie::driveWithDistance(parallax_eddie_robot::DriveWithDistance::Request &req,
  parallax_eddie_robot::DriveWithDistance::Response &res)
{
  //this feature does not need to validate the parameters due the limited range of parameter data type
  std::string cmd;
  cmd = generateCommand(SET_DRIVE_DISTANCE_STRING, req.distance, req.speed);
  std::string cmd_response = command(cmd);
  if (cmd_response == "\r")
    return true;
  else
    return false;
}

bool Eddie::driveWithPower(parallax_eddie_robot::DriveWithPower::Request &req,
  parallax_eddie_robot::DriveWithPower::Response &res)
{
  if (req.left > MOTOR_POWER_MAX_FORWARD || req.right > MOTOR_POWER_MAX_FORWARD ||
      req.left < MOTOR_POWER_MAX_REVERSE || req.right < MOTOR_POWER_MAX_REVERSE)
  {
    return false;
  }
  std::string cmd;
  cmd = generateCommand(SET_DRIVE_POWER_STRING, req.left, req.right);
  std::string cmd_response = command(cmd);
  if (cmd_response == "\r")
    return true;
  else
    return false;
}

bool Eddie::driveWithSpeed(parallax_eddie_robot::DriveWithSpeed::Request &req,
  parallax_eddie_robot::DriveWithSpeed::Response &res)
{
  if (req.left > TRAVEL_SPEED_MAX_FORWARD || req.right > TRAVEL_SPEED_MAX_FORWARD ||
      req.left < TRAVEL_SPEED_MAX_REVERSE || req.right < TRAVEL_SPEED_MAX_REVERSE)
  {
    return false;
  }
  std::string cmd;
  cmd = generateCommand(SET_DRIVE_SPEED_STRING, req.left, req.right);
  std::string cmd_response = command(cmd);
  if (cmd_response == "\r")
    return true;
  else
    return false;
}

bool Eddie::getDistance(parallax_eddie_robot::GetDistance::Request &req,
  parallax_eddie_robot::GetDistance::Response &res)
{
  std::string cmd = GET_ENCODER_TICKS_STRING;
  std::string cmd_response = command(cmd);
  if (cmd_response.substr(0, 5) != "ERROR" && cmd_response.size() >= 18)
  {
    std::stringstream value;
    value << std::hex << cmd_response.substr(0, 8);
    value >> res.left;
    value.str(std::string());
    value.clear();
    value << std::hex << cmd_response.substr(9, 8);
    value >> res.right;
    return true;
  }
  else
    return false;
}

bool Eddie::getHeading(parallax_eddie_robot::GetHeading::Request &req,
  parallax_eddie_robot::GetHeading::Response &res)
{
  std::string cmd = GET_CURRENT_HEADING_STRING;
  std::string cmd_response = command(cmd);
  if (cmd_response.substr(0, 5) != "ERROR" && cmd_response.size() >= 4)
  {
    std::stringstream value;
    value << std::hex << cmd_response.substr(0, 3);
    value >> res.heading;
    return true;
  }
  else
    return false;
}

bool Eddie::GetSpeed(parallax_eddie_robot::GetSpeed::Request &req,
  parallax_eddie_robot::GetSpeed::Response &res)
{
  std::string cmd = GET_CURRENT_SPEED_STRING;
  std::string cmd_response = command(cmd);
  if (cmd_response.substr(0, 5) != "ERROR" && cmd_response.size() >= 10)
  {
    std::stringstream value;
    value << std::hex << cmd_response.substr(0, 4);
    value >> res.left;
    value.str(std::string());
    value.clear();
    value << std::hex << cmd_response.substr(5, 4);
    value >> res.right;
    return true;
  }
  else
    return false;
}

bool Eddie::resetEncoder(parallax_eddie_robot::ResetEncoder::Request &req,
  parallax_eddie_robot::ResetEncoder::Response &res)
{
  std::string cmd = RESET_ENCODER_TICKS_STRING;
  std::string cmd_response = command(cmd);
  if (cmd_response == "\r")
    return true;
  else
    return false;
}

bool Eddie::rotate(parallax_eddie_robot::Rotate::Request &req,
  parallax_eddie_robot::Rotate::Response &res)
{
  std::string cmd;
  cmd = generateCommand(SET_ROTATE_STRING, req.angle, req.speed);
  std::string cmd_response = command(cmd);
  if (cmd_response == "\r")
    return true;
  else
    return false;
}

bool Eddie::stopAtDistance(parallax_eddie_robot::StopAtDistance::Request &req,
  parallax_eddie_robot::StopAtDistance::Response &res)
{
  std::string cmd;
  cmd = generateCommand(SET_STOP_DISTANCE_STRING, req.distance);
  std::string cmd_response = command(cmd);
  if (cmd_response == "\r")
    return true;
  else
    return false;
}

int main(int argc, char** argv)
{
  ROS_INFO("Parallax Board booting up");
  ros::init(argc, argv, "parallax_board");
  Eddie eddie("/dev/ttyUSB0"); //set port to connect to Paralax controller board
  ros::Rate loop_rate(10);

  int counter = 0;
  while (ros::ok())
  {
    //ROS_INFO("LOOP STEP [%d]", counter++);

    //THIS SECTION IS COMMENTED OUT JUST FOR THIS DEMO SESSION;
    //eddie.ping_pub_.publish(eddie.getPingData());
    //eddie.adc_pub_.publish(eddie.getADCData());

    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}
