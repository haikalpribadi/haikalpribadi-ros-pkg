/* Auto-generated by genmsg_cpp for file /home/haikalpribadi/Workspaces/ROS/haikalpribadi-ros-pkg/parallax_eddie_robot/srv/DriveWithPower.srv */
#ifndef PARALLAX_EDDIE_ROBOT_SERVICE_DRIVEWITHPOWER_H
#define PARALLAX_EDDIE_ROBOT_SERVICE_DRIVEWITHPOWER_H
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

#include "ros/service_traits.h"




namespace parallax_eddie_robot
{
template <class ContainerAllocator>
struct DriveWithPowerRequest_ {
  typedef DriveWithPowerRequest_<ContainerAllocator> Type;

  DriveWithPowerRequest_()
  : left(0)
  , right(0)
  {
  }

  DriveWithPowerRequest_(const ContainerAllocator& _alloc)
  : left(0)
  , right(0)
  {
  }

  typedef int8_t _left_type;
  int8_t left;

  typedef int8_t _right_type;
  int8_t right;


private:
  static const char* __s_getDataType_() { return "parallax_eddie_robot/DriveWithPowerRequest"; }
public:
  ROS_DEPRECATED static const std::string __s_getDataType() { return __s_getDataType_(); }

  ROS_DEPRECATED const std::string __getDataType() const { return __s_getDataType_(); }

private:
  static const char* __s_getMD5Sum_() { return "24825b8956c21f4c3dd28a5a4d09322c"; }
public:
  ROS_DEPRECATED static const std::string __s_getMD5Sum() { return __s_getMD5Sum_(); }

  ROS_DEPRECATED const std::string __getMD5Sum() const { return __s_getMD5Sum_(); }

private:
  static const char* __s_getServerMD5Sum_() { return "24825b8956c21f4c3dd28a5a4d09322c"; }
public:
  ROS_DEPRECATED static const std::string __s_getServerMD5Sum() { return __s_getServerMD5Sum_(); }

  ROS_DEPRECATED const std::string __getServerMD5Sum() const { return __s_getServerMD5Sum_(); }

private:
  static const char* __s_getMessageDefinition_() { return "int8 left\n\
int8 right\n\
\n\
"; }
public:
  ROS_DEPRECATED static const std::string __s_getMessageDefinition() { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED const std::string __getMessageDefinition() const { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED virtual uint8_t *serialize(uint8_t *write_ptr, uint32_t seq) const
  {
    ros::serialization::OStream stream(write_ptr, 1000000000);
    ros::serialization::serialize(stream, left);
    ros::serialization::serialize(stream, right);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint8_t *deserialize(uint8_t *read_ptr)
  {
    ros::serialization::IStream stream(read_ptr, 1000000000);
    ros::serialization::deserialize(stream, left);
    ros::serialization::deserialize(stream, right);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint32_t serializationLength() const
  {
    uint32_t size = 0;
    size += ros::serialization::serializationLength(left);
    size += ros::serialization::serializationLength(right);
    return size;
  }

  typedef boost::shared_ptr< ::parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct DriveWithPowerRequest
typedef  ::parallax_eddie_robot::DriveWithPowerRequest_<std::allocator<void> > DriveWithPowerRequest;

typedef boost::shared_ptr< ::parallax_eddie_robot::DriveWithPowerRequest> DriveWithPowerRequestPtr;
typedef boost::shared_ptr< ::parallax_eddie_robot::DriveWithPowerRequest const> DriveWithPowerRequestConstPtr;


template <class ContainerAllocator>
struct DriveWithPowerResponse_ {
  typedef DriveWithPowerResponse_<ContainerAllocator> Type;

  DriveWithPowerResponse_()
  {
  }

  DriveWithPowerResponse_(const ContainerAllocator& _alloc)
  {
  }


private:
  static const char* __s_getDataType_() { return "parallax_eddie_robot/DriveWithPowerResponse"; }
public:
  ROS_DEPRECATED static const std::string __s_getDataType() { return __s_getDataType_(); }

  ROS_DEPRECATED const std::string __getDataType() const { return __s_getDataType_(); }

private:
  static const char* __s_getMD5Sum_() { return "d41d8cd98f00b204e9800998ecf8427e"; }
public:
  ROS_DEPRECATED static const std::string __s_getMD5Sum() { return __s_getMD5Sum_(); }

  ROS_DEPRECATED const std::string __getMD5Sum() const { return __s_getMD5Sum_(); }

private:
  static const char* __s_getServerMD5Sum_() { return "24825b8956c21f4c3dd28a5a4d09322c"; }
public:
  ROS_DEPRECATED static const std::string __s_getServerMD5Sum() { return __s_getServerMD5Sum_(); }

  ROS_DEPRECATED const std::string __getServerMD5Sum() const { return __s_getServerMD5Sum_(); }

private:
  static const char* __s_getMessageDefinition_() { return "\n\
\n\
"; }
public:
  ROS_DEPRECATED static const std::string __s_getMessageDefinition() { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED const std::string __getMessageDefinition() const { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED virtual uint8_t *serialize(uint8_t *write_ptr, uint32_t seq) const
  {
    ros::serialization::OStream stream(write_ptr, 1000000000);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint8_t *deserialize(uint8_t *read_ptr)
  {
    ros::serialization::IStream stream(read_ptr, 1000000000);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint32_t serializationLength() const
  {
    uint32_t size = 0;
    return size;
  }

  typedef boost::shared_ptr< ::parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct DriveWithPowerResponse
typedef  ::parallax_eddie_robot::DriveWithPowerResponse_<std::allocator<void> > DriveWithPowerResponse;

typedef boost::shared_ptr< ::parallax_eddie_robot::DriveWithPowerResponse> DriveWithPowerResponsePtr;
typedef boost::shared_ptr< ::parallax_eddie_robot::DriveWithPowerResponse const> DriveWithPowerResponseConstPtr;

struct DriveWithPower
{

typedef DriveWithPowerRequest Request;
typedef DriveWithPowerResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct DriveWithPower
} // namespace parallax_eddie_robot

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "24825b8956c21f4c3dd28a5a4d09322c";
  }

  static const char* value(const  ::parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x24825b8956c21f4cULL;
  static const uint64_t static_value2 = 0x3dd28a5a4d09322cULL;
};

template<class ContainerAllocator>
struct DataType< ::parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "parallax_eddie_robot/DriveWithPowerRequest";
  }

  static const char* value(const  ::parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "int8 left\n\
int8 right\n\
\n\
";
  }

  static const char* value(const  ::parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const  ::parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "parallax_eddie_robot/DriveWithPowerResponse";
  }

  static const char* value(const  ::parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "\n\
\n\
";
  }

  static const char* value(const  ::parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.left);
    stream.next(m.right);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct DriveWithPowerRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct DriveWithPowerResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<parallax_eddie_robot::DriveWithPower> {
  static const char* value() 
  {
    return "24825b8956c21f4c3dd28a5a4d09322c";
  }

  static const char* value(const parallax_eddie_robot::DriveWithPower&) { return value(); } 
};

template<>
struct DataType<parallax_eddie_robot::DriveWithPower> {
  static const char* value() 
  {
    return "parallax_eddie_robot/DriveWithPower";
  }

  static const char* value(const parallax_eddie_robot::DriveWithPower&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "24825b8956c21f4c3dd28a5a4d09322c";
  }

  static const char* value(const parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "parallax_eddie_robot/DriveWithPower";
  }

  static const char* value(const parallax_eddie_robot::DriveWithPowerRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "24825b8956c21f4c3dd28a5a4d09322c";
  }

  static const char* value(const parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "parallax_eddie_robot/DriveWithPower";
  }

  static const char* value(const parallax_eddie_robot::DriveWithPowerResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // PARALLAX_EDDIE_ROBOT_SERVICE_DRIVEWITHPOWER_H
