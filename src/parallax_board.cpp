/* parallax_board.cpp
 * Author: Haikal Pribadi (haikal.pribadi@gmail.com)
 * 
 * Created on February 19, 2012, 5:34 PM
 */

#include "ros/ros.h"
#include "parallax_board.h"
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
  memset(&stdio, 0, sizeof (stdio));
  stdio.c_iflag = 0;
  stdio.c_oflag = 0;
  stdio.c_cflag = 0;
  stdio.c_lflag = 0;
  stdio.c_cc[VMIN] = 1;
  stdio.c_cc[VTIME] = 0;
  tcsetattr(STDOUT_FILENO, TCSANOW, &stdio);
  tcsetattr(STDOUT_FILENO, TCSAFLUSH, &stdio);
  fcntl(STDIN_FILENO, F_SETFL, O_NONBLOCK); // make the reads non-blocking

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
}

unsigned char* ParallaxBoard::convertToByte(std::string str)
{
  unsigned char command[str.size()];

  return command;
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "parallax_board");
  ros::NodeHandle node;


  return 0;
}
