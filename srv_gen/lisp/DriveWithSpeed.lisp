; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude DriveWithSpeed-request.msg.html

(cl:defclass <DriveWithSpeed-request> (roslisp-msg-protocol:ros-message)
  ((left
    :reader left
    :initarg :left
    :type cl:fixnum
    :initform 0)
   (right
    :reader right
    :initarg :right
    :type cl:fixnum
    :initform 0))
)

(cl:defclass DriveWithSpeed-request (<DriveWithSpeed-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DriveWithSpeed-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DriveWithSpeed-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<DriveWithSpeed-request> is deprecated: use parallax_eddie_robot-srv:DriveWithSpeed-request instead.")))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <DriveWithSpeed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:left-val is deprecated.  Use parallax_eddie_robot-srv:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <DriveWithSpeed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:right-val is deprecated.  Use parallax_eddie_robot-srv:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DriveWithSpeed-request>) ostream)
  "Serializes a message object of type '<DriveWithSpeed-request>"
  (cl:let* ((signed (cl:slot-value msg 'left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DriveWithSpeed-request>) istream)
  "Deserializes a message object of type '<DriveWithSpeed-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DriveWithSpeed-request>)))
  "Returns string type for a service object of type '<DriveWithSpeed-request>"
  "parallax_eddie_robot/DriveWithSpeedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveWithSpeed-request)))
  "Returns string type for a service object of type 'DriveWithSpeed-request"
  "parallax_eddie_robot/DriveWithSpeedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DriveWithSpeed-request>)))
  "Returns md5sum for a message object of type '<DriveWithSpeed-request>"
  "7b8633b27ab7356cf2073b0a6f6d699f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DriveWithSpeed-request)))
  "Returns md5sum for a message object of type 'DriveWithSpeed-request"
  "7b8633b27ab7356cf2073b0a6f6d699f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DriveWithSpeed-request>)))
  "Returns full string definition for message of type '<DriveWithSpeed-request>"
  (cl:format cl:nil "int16 left~%int16 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DriveWithSpeed-request)))
  "Returns full string definition for message of type 'DriveWithSpeed-request"
  (cl:format cl:nil "int16 left~%int16 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DriveWithSpeed-request>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DriveWithSpeed-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DriveWithSpeed-request
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
))
;//! \htmlinclude DriveWithSpeed-response.msg.html

(cl:defclass <DriveWithSpeed-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass DriveWithSpeed-response (<DriveWithSpeed-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DriveWithSpeed-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DriveWithSpeed-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<DriveWithSpeed-response> is deprecated: use parallax_eddie_robot-srv:DriveWithSpeed-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <DriveWithSpeed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:message-val is deprecated.  Use parallax_eddie_robot-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DriveWithSpeed-response>) ostream)
  "Serializes a message object of type '<DriveWithSpeed-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DriveWithSpeed-response>) istream)
  "Deserializes a message object of type '<DriveWithSpeed-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DriveWithSpeed-response>)))
  "Returns string type for a service object of type '<DriveWithSpeed-response>"
  "parallax_eddie_robot/DriveWithSpeedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveWithSpeed-response)))
  "Returns string type for a service object of type 'DriveWithSpeed-response"
  "parallax_eddie_robot/DriveWithSpeedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DriveWithSpeed-response>)))
  "Returns md5sum for a message object of type '<DriveWithSpeed-response>"
  "7b8633b27ab7356cf2073b0a6f6d699f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DriveWithSpeed-response)))
  "Returns md5sum for a message object of type 'DriveWithSpeed-response"
  "7b8633b27ab7356cf2073b0a6f6d699f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DriveWithSpeed-response>)))
  "Returns full string definition for message of type '<DriveWithSpeed-response>"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DriveWithSpeed-response)))
  "Returns full string definition for message of type 'DriveWithSpeed-response"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DriveWithSpeed-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DriveWithSpeed-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DriveWithSpeed-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DriveWithSpeed)))
  'DriveWithSpeed-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DriveWithSpeed)))
  'DriveWithSpeed-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveWithSpeed)))
  "Returns string type for a service object of type '<DriveWithSpeed>"
  "parallax_eddie_robot/DriveWithSpeed")