/* Auto-generated by genmsg_cpp for file /home/haikalpribadi/Workspaces/ROS/haikalpribadi-ros-pkg/parallax_eddie_robot/srv/GetHeading.srv */
#ifndef PARALLAX_EDDIE_ROBOT_SERVICE_GETHEADING_H
#define PARALLAX_EDDIE_ROBOT_SERVICE_GETHEADING_H
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
struct GetHeadingRequest_ {
  typedef GetHeadingRequest_<ContainerAllocator> Type;

  GetHeadingRequest_()
  {
  }

  GetHeadingRequest_(const ContainerAllocator& _alloc)
  {
  }


private:
  static const char* __s_getDataType_() { return "parallax_eddie_robot/GetHeadingRequest"; }
public:
  ROS_DEPRECATED static const std::string __s_getDataType() { return __s_getDataType_(); }

  ROS_DEPRECATED const std::string __getDataType() const { return __s_getDataType_(); }

private:
  static const char* __s_getMD5Sum_() { return "d41d8cd98f00b204e9800998ecf8427e"; }
public:
  ROS_DEPRECATED static const std::string __s_getMD5Sum() { return __s_getMD5Sum_(); }

  ROS_DEPRECATED const std::string __getMD5Sum() const { return __s_getMD5Sum_(); }

private:
  static const char* __s_getServerMD5Sum_() { return "3204bea69e84bbd63420c608a176827e"; }
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

  typedef boost::shared_ptr< ::parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct GetHeadingRequest
typedef  ::parallax_eddie_robot::GetHeadingRequest_<std::allocator<void> > GetHeadingRequest;

typedef boost::shared_ptr< ::parallax_eddie_robot::GetHeadingRequest> GetHeadingRequestPtr;
typedef boost::shared_ptr< ::parallax_eddie_robot::GetHeadingRequest const> GetHeadingRequestConstPtr;


template <class ContainerAllocator>
struct GetHeadingResponse_ {
  typedef GetHeadingResponse_<ContainerAllocator> Type;

  GetHeadingResponse_()
  : heading(0)
  {
  }

  GetHeadingResponse_(const ContainerAllocator& _alloc)
  : heading(0)
  {
  }

  typedef uint16_t _heading_type;
  uint16_t heading;


private:
  static const char* __s_getDataType_() { return "parallax_eddie_robot/GetHeadingResponse"; }
public:
  ROS_DEPRECATED static const std::string __s_getDataType() { return __s_getDataType_(); }

  ROS_DEPRECATED const std::string __getDataType() const { return __s_getDataType_(); }

private:
  static const char* __s_getMD5Sum_() { return "3204bea69e84bbd63420c608a176827e"; }
public:
  ROS_DEPRECATED static const std::string __s_getMD5Sum() { return __s_getMD5Sum_(); }

  ROS_DEPRECATED const std::string __getMD5Sum() const { return __s_getMD5Sum_(); }

private:
  static const char* __s_getServerMD5Sum_() { return "3204bea69e84bbd63420c608a176827e"; }
public:
  ROS_DEPRECATED static const std::string __s_getServerMD5Sum() { return __s_getServerMD5Sum_(); }

  ROS_DEPRECATED const std::string __getServerMD5Sum() const { return __s_getServerMD5Sum_(); }

private:
  static const char* __s_getMessageDefinition_() { return "uint16 heading\n\
\n\
\n\
"; }
public:
  ROS_DEPRECATED static const std::string __s_getMessageDefinition() { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED const std::string __getMessageDefinition() const { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED virtual uint8_t *serialize(uint8_t *write_ptr, uint32_t seq) const
  {
    ros::serialization::OStream stream(write_ptr, 1000000000);
    ros::serialization::serialize(stream, heading);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint8_t *deserialize(uint8_t *read_ptr)
  {
    ros::serialization::IStream stream(read_ptr, 1000000000);
    ros::serialization::deserialize(stream, heading);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint32_t serializationLength() const
  {
    uint32_t size = 0;
    size += ros::serialization::serializationLength(heading);
    return size;
  }

  typedef boost::shared_ptr< ::parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct GetHeadingResponse
typedef  ::parallax_eddie_robot::GetHeadingResponse_<std::allocator<void> > GetHeadingResponse;

typedef boost::shared_ptr< ::parallax_eddie_robot::GetHeadingResponse> GetHeadingResponsePtr;
typedef boost::shared_ptr< ::parallax_eddie_robot::GetHeadingResponse const> GetHeadingResponseConstPtr;

struct GetHeading
{

typedef GetHeadingRequest Request;
typedef GetHeadingResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct GetHeading
} // namespace parallax_eddie_robot

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const  ::parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "parallax_eddie_robot/GetHeadingRequest";
  }

  static const char* value(const  ::parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "\n\
\n\
";
  }

  static const char* value(const  ::parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "3204bea69e84bbd63420c608a176827e";
  }

  static const char* value(const  ::parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x3204bea69e84bbd6ULL;
  static const uint64_t static_value2 = 0x3420c608a176827eULL;
};

template<class ContainerAllocator>
struct DataType< ::parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "parallax_eddie_robot/GetHeadingResponse";
  }

  static const char* value(const  ::parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "uint16 heading\n\
\n\
\n\
";
  }

  static const char* value(const  ::parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct GetHeadingRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.heading);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct GetHeadingResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<parallax_eddie_robot::GetHeading> {
  static const char* value() 
  {
    return "3204bea69e84bbd63420c608a176827e";
  }

  static const char* value(const parallax_eddie_robot::GetHeading&) { return value(); } 
};

template<>
struct DataType<parallax_eddie_robot::GetHeading> {
  static const char* value() 
  {
    return "parallax_eddie_robot/GetHeading";
  }

  static const char* value(const parallax_eddie_robot::GetHeading&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "3204bea69e84bbd63420c608a176827e";
  }

  static const char* value(const parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "parallax_eddie_robot/GetHeading";
  }

  static const char* value(const parallax_eddie_robot::GetHeadingRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "3204bea69e84bbd63420c608a176827e";
  }

  static const char* value(const parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "parallax_eddie_robot/GetHeading";
  }

  static const char* value(const parallax_eddie_robot::GetHeadingResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // PARALLAX_EDDIE_ROBOT_SERVICE_GETHEADING_H
