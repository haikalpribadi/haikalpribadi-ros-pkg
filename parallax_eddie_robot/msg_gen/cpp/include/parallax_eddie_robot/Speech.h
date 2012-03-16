/* Auto-generated by genmsg_cpp for file /home/haikalpribadi/Workspaces/ROS/haikalpribadi-ros-pkg/parallax_eddie_robot/msg/Speech.msg */
#ifndef PARALLAX_EDDIE_ROBOT_MESSAGE_SPEECH_H
#define PARALLAX_EDDIE_ROBOT_MESSAGE_SPEECH_H
#include <string>
#include <vector>
#include <map>
#include <ostream>
#include "ros/serialization.h"
#include "ros/builtin_message_traits.h"
#include "ros/message_operations.h"
#include "ros/time.h"

#include "ros/macros.h"

#include "ros/assert.h"


namespace parallax_eddie_robot
{
template <class ContainerAllocator>
struct Speech_ {
  typedef Speech_<ContainerAllocator> Type;

  Speech_()
  : text()
  {
  }

  Speech_(const ContainerAllocator& _alloc)
  : text(_alloc)
  {
  }

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _text_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  text;


private:
  static const char* __s_getDataType_() { return "parallax_eddie_robot/Speech"; }
public:
  ROS_DEPRECATED static const std::string __s_getDataType() { return __s_getDataType_(); }

  ROS_DEPRECATED const std::string __getDataType() const { return __s_getDataType_(); }

private:
  static const char* __s_getMD5Sum_() { return "74697ed3d931f6eede8bf3a8dfeca160"; }
public:
  ROS_DEPRECATED static const std::string __s_getMD5Sum() { return __s_getMD5Sum_(); }

  ROS_DEPRECATED const std::string __getMD5Sum() const { return __s_getMD5Sum_(); }

private:
  static const char* __s_getMessageDefinition_() { return "string text\n\
\n\
"; }
public:
  ROS_DEPRECATED static const std::string __s_getMessageDefinition() { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED const std::string __getMessageDefinition() const { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED virtual uint8_t *serialize(uint8_t *write_ptr, uint32_t seq) const
  {
    ros::serialization::OStream stream(write_ptr, 1000000000);
    ros::serialization::serialize(stream, text);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint8_t *deserialize(uint8_t *read_ptr)
  {
    ros::serialization::IStream stream(read_ptr, 1000000000);
    ros::serialization::deserialize(stream, text);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint32_t serializationLength() const
  {
    uint32_t size = 0;
    size += ros::serialization::serializationLength(text);
    return size;
  }

  typedef boost::shared_ptr< ::parallax_eddie_robot::Speech_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::parallax_eddie_robot::Speech_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct Speech
typedef  ::parallax_eddie_robot::Speech_<std::allocator<void> > Speech;

typedef boost::shared_ptr< ::parallax_eddie_robot::Speech> SpeechPtr;
typedef boost::shared_ptr< ::parallax_eddie_robot::Speech const> SpeechConstPtr;


template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const  ::parallax_eddie_robot::Speech_<ContainerAllocator> & v)
{
  ros::message_operations::Printer< ::parallax_eddie_robot::Speech_<ContainerAllocator> >::stream(s, "", v);
  return s;}

} // namespace parallax_eddie_robot

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::parallax_eddie_robot::Speech_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::parallax_eddie_robot::Speech_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::parallax_eddie_robot::Speech_<ContainerAllocator> > {
  static const char* value() 
  {
    return "74697ed3d931f6eede8bf3a8dfeca160";
  }

  static const char* value(const  ::parallax_eddie_robot::Speech_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x74697ed3d931f6eeULL;
  static const uint64_t static_value2 = 0xde8bf3a8dfeca160ULL;
};

template<class ContainerAllocator>
struct DataType< ::parallax_eddie_robot::Speech_<ContainerAllocator> > {
  static const char* value() 
  {
    return "parallax_eddie_robot/Speech";
  }

  static const char* value(const  ::parallax_eddie_robot::Speech_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::parallax_eddie_robot::Speech_<ContainerAllocator> > {
  static const char* value() 
  {
    return "string text\n\
\n\
";
  }

  static const char* value(const  ::parallax_eddie_robot::Speech_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::parallax_eddie_robot::Speech_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.text);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct Speech_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::parallax_eddie_robot::Speech_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const  ::parallax_eddie_robot::Speech_<ContainerAllocator> & v) 
  {
    s << indent << "text: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.text);
  }
};


} // namespace message_operations
} // namespace ros

#endif // PARALLAX_EDDIE_ROBOT_MESSAGE_SPEECH_H

