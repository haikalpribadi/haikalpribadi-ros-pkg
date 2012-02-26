; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude DriveWithDistance-request.msg.html

(cl:defclass <DriveWithDistance-request> (roslisp-msg-protocol:ros-message)
  ((distance
    :reader distance
    :initarg :distance
    :type cl:fixnum
    :initform 0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:fixnum
    :initform 0))
)

(cl:defclass DriveWithDistance-request (<DriveWithDistance-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DriveWithDistance-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DriveWithDistance-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<DriveWithDistance-request> is deprecated: use parallax_eddie_robot-srv:DriveWithDistance-request instead.")))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <DriveWithDistance-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:distance-val is deprecated.  Use parallax_eddie_robot-srv:distance instead.")
  (distance m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <DriveWithDistance-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:speed-val is deprecated.  Use parallax_eddie_robot-srv:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DriveWithDistance-request>) ostream)
  "Serializes a message object of type '<DriveWithDistance-request>"
  (cl:let* ((signed (cl:slot-value msg 'distance)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DriveWithDistance-request>) istream)
  "Deserializes a message object of type '<DriveWithDistance-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'distance) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DriveWithDistance-request>)))
  "Returns string type for a service object of type '<DriveWithDistance-request>"
  "parallax_eddie_robot/DriveWithDistanceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveWithDistance-request)))
  "Returns string type for a service object of type 'DriveWithDistance-request"
  "parallax_eddie_robot/DriveWithDistanceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DriveWithDistance-request>)))
  "Returns md5sum for a message object of type '<DriveWithDistance-request>"
  "8400577676ea99352eba444e9a54a4e6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DriveWithDistance-request)))
  "Returns md5sum for a message object of type 'DriveWithDistance-request"
  "8400577676ea99352eba444e9a54a4e6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DriveWithDistance-request>)))
  "Returns full string definition for message of type '<DriveWithDistance-request>"
  (cl:format cl:nil "int16 distance~%uint16 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DriveWithDistance-request)))
  "Returns full string definition for message of type 'DriveWithDistance-request"
  (cl:format cl:nil "int16 distance~%uint16 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DriveWithDistance-request>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DriveWithDistance-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DriveWithDistance-request
    (cl:cons ':distance (distance msg))
    (cl:cons ':speed (speed msg))
))
;//! \htmlinclude DriveWithDistance-response.msg.html

(cl:defclass <DriveWithDistance-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass DriveWithDistance-response (<DriveWithDistance-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DriveWithDistance-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DriveWithDistance-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<DriveWithDistance-response> is deprecated: use parallax_eddie_robot-srv:DriveWithDistance-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DriveWithDistance-response>) ostream)
  "Serializes a message object of type '<DriveWithDistance-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DriveWithDistance-response>) istream)
  "Deserializes a message object of type '<DriveWithDistance-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DriveWithDistance-response>)))
  "Returns string type for a service object of type '<DriveWithDistance-response>"
  "parallax_eddie_robot/DriveWithDistanceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveWithDistance-response)))
  "Returns string type for a service object of type 'DriveWithDistance-response"
  "parallax_eddie_robot/DriveWithDistanceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DriveWithDistance-response>)))
  "Returns md5sum for a message object of type '<DriveWithDistance-response>"
  "8400577676ea99352eba444e9a54a4e6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DriveWithDistance-response)))
  "Returns md5sum for a message object of type 'DriveWithDistance-response"
  "8400577676ea99352eba444e9a54a4e6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DriveWithDistance-response>)))
  "Returns full string definition for message of type '<DriveWithDistance-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DriveWithDistance-response)))
  "Returns full string definition for message of type 'DriveWithDistance-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DriveWithDistance-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DriveWithDistance-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DriveWithDistance-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DriveWithDistance)))
  'DriveWithDistance-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DriveWithDistance)))
  'DriveWithDistance-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveWithDistance)))
  "Returns string type for a service object of type '<DriveWithDistance>"
  "parallax_eddie_robot/DriveWithDistance")