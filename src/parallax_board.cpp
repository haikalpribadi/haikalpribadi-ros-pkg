/* parallax_board.cpp
 * Author: Haikal Pribadi (haikal.pribadi@gmail.com)
 * 
 * Created on February 19, 2012, 5:34 PM
 */

#include "ros/ros.h"
#include "parallax_board.h"
#include <sstream>
typedef std::map<std::string, unsigned char[6] > CommandMap;

ParallaxBoard::ParallaxBoard(std::string port) :
  GPIO_COUNT(10), ADC_PIN_COUNT(8), DIGITAL_PIN_COUNT(10), AUXILIARY_POWER_RELAY_COUNT(3),
  PARALLAX_MAX_BUFFER(256), ENCODER_COUNT(2), ADC_VOLTAGE_MULTIPLIER(1 / 819.2),
  BATTERY_VOLTAGE_DIVIDER(3.21), MOTOR_POWER_STOP(0), MOTOR_POWER_MAX_FORWARD(127),
  MOTOR_POWER_MAX_REVERSE(-127), RELAY_33V_PIN_NUMBER(17), RELAY_5V_PIN_NUMBER(17),
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
  initialize(port);
}

ParallaxBoard::ParallaxBoard(const ParallaxBoard& orig) :
  GPIO_COUNT(10), ADC_PIN_COUNT(8), DIGITAL_PIN_COUNT(10), AUXILIARY_POWER_RELAY_COUNT(3),
  PARALLAX_MAX_BUFFER(256), ENCODER_COUNT(2), ADC_VOLTAGE_MULTIPLIER(1 / 819.2),
  BATTERY_VOLTAGE_DIVIDER(3.21), MOTOR_POWER_STOP(0), MOTOR_POWER_MAX_FORWARD(127),
  MOTOR_POWER_MAX_REVERSE(-127), RELAY_33V_PIN_NUMBER(17), RELAY_5V_PIN_NUMBER(17),
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
}

ParallaxBoard::~ParallaxBoard()
{
  close(tty_fd);
}

void ParallaxBoard::initialize(std::string port)
{
  ROS_INFO("Initializing Parallax board serial port connection");
  //memset(&stdio, 0, sizeof (stdio));
  //stdio.c_iflag = 0;
  //stdio.c_oflag = 0;
  //stdio.c_cflag = 0;
  //stdio.c_lflag = 0;
  //stdio.c_cc[VMIN] = 1;
  //stdio.c_cc[VTIME] = 0;
  //tcsetattr(STDOUT_FILENO, TCSANOW, &stdio);
  //tcsetattr(STDOUT_FILENO, TCSAFLUSH, &stdio);
  //fcntl(STDIN_FILENO, F_SETFL, O_NONBLOCK); // make the reads non-blocking

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
  std::string result;
  result = command("PING");
  ROS_INFO("%s",result.data());
}

std::string ParallaxBoard::command(std::string str)
{
  std::stringstream result;
  unsigned char c;
  int size = str.size() + 1;
  unsigned char command[size];
  
  for (int i = 0; i < size - 1; i++)
  {
    command[i] = str[i];
  }
  command[size - 1] = '\r';
  write(tty_fd, command, size);
  usleep(100); //Give some time for the board to process
  while (c != '\r')
  {
    if (read(tty_fd, &c, 1) > 0)
    {
      result << c;
    }
  }
  return result.str();
}

parallax_eddie_robot::Ping ParallaxBoard::getPingData()
{
  std::stringstream value;
  std::string result = command(GET_PING_VALUE_STRING);
  //std::string result = "000 8CB\r";
  parallax_eddie_robot::Ping ping_data;
  if(result.size()==1){
    ping_data.status = "EMPTY";
    return ping_data;
  }
  else if(result.size()>=6){
    if(result.substr(0,5)=="ERROR"){
      ping_data.status = "ERROR";
    }
  }
  ping_data.status = "SUCCESS";
  value << std::hex << result.substr(0,3);
  ROS_INFO(value.str().data());
  value >> ping_data.value1;
  value.flush();
  value << std::hex << result.substr(4,3);
  value >> ping_data.value2;
  ROS_INFO(value.str().data());
  ROS_INFO("PING_DATA msg :-%d-%d-", ping_data.value1, ping_data.value2);
  return ping_data;
}

parallax_eddie_robot::ADC ParallaxBoard::getADCData()
{
  std::string result = command(GET_ADC_VALUE_STRING);
  parallax_eddie_robot::ADC adc_data;
  
  return adc_data;
}

int main(int argc, char** argv)
{
  ROS_INFO("Parallax Board booting up");
  ParallaxBoard Board("/dev/ttyUSB0"); //set port to connect to Paralax controller board
  ros::init(argc, argv, "parallax_board");
  ros::NodeHandle node;
  ros::Rate loop_rate(1);

  ros::Publisher ping_pub = node.advertise<parallax_eddie_robot::Ping > ("ping_data", 1000);
  ros::Publisher adc_pub = node.advertise<parallax_eddie_robot::ADC > ("adc_data", 1000);

  int counter = 0;
  while (ros::ok())
  {
    ROS_INFO("LOOP STEP [%d]", counter++);

    parallax_eddie_robot::Ping ping_msg;
    ROS_INFO("ABOUT TO READ PING DATA");
    ping_msg = Board.getPingData();
    ROS_INFO("ABOUT TO PUBLISH PING DATA");
    ping_pub.publish(ping_msg);

    //parallax_eddie_robot::ADC adc_msg;
    //adc_msg = Board.getADCData();
    //adc_pub.publish(adc_msg);

    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}
