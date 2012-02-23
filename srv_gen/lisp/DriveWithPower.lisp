; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude DriveWithPower-request.msg.html

(cl:defclass <DriveWithPower-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass DriveWithPower-request (<DriveWithPower-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DriveWithPower-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DriveWithPower-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<DriveWithPower-request> is deprecated: use parallax_eddie_robot-srv:DriveWithPower-request instead.")))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <DriveWithPower-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:left-val is deprecated.  Use parallax_eddie_robot-srv:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <DriveWithPower-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:right-val is deprecated.  Use parallax_eddie_robot-srv:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DriveWithPower-request>) ostream)
  "Serializes a message object of type '<DriveWithPower-request>"
  (cl:let* ((signed (cl:slot-value msg 'left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DriveWithPower-request>) istream)
  "Deserializes a message object of type '<DriveWithPower-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DriveWithPower-request>)))
  "Returns string type for a service object of type '<DriveWithPower-request>"
  "parallax_eddie_robot/DriveWithPowerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveWithPower-request)))
  "Returns string type for a service object of type 'DriveWithPower-request"
  "parallax_eddie_robot/DriveWithPowerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DriveWithPower-request>)))
  "Returns md5sum for a message object of type '<DriveWithPower-request>"
  "76c7d662338a707e15612e795d907dce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DriveWithPower-request)))
  "Returns md5sum for a message object of type 'DriveWithPower-request"
  "76c7d662338a707e15612e795d907dce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DriveWithPower-request>)))
  "Returns full string definition for message of type '<DriveWithPower-request>"
  (cl:format cl:nil "int8 left~%int8 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DriveWithPower-request)))
  "Returns full string definition for message of type 'DriveWithPower-request"
  (cl:format cl:nil "int8 left~%int8 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DriveWithPower-request>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DriveWithPower-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DriveWithPower-request
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
))
;//! \htmlinclude DriveWithPower-response.msg.html

(cl:defclass <DriveWithPower-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass DriveWithPower-response (<DriveWithPower-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DriveWithPower-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DriveWithPower-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<DriveWithPower-response> is deprecated: use parallax_eddie_robot-srv:DriveWithPower-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <DriveWithPower-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:message-val is deprecated.  Use parallax_eddie_robot-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DriveWithPower-response>) ostream)
  "Serializes a message object of type '<DriveWithPower-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DriveWithPower-response>) istream)
  "Deserializes a message object of type '<DriveWithPower-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DriveWithPower-response>)))
  "Returns string type for a service object of type '<DriveWithPower-response>"
  "parallax_eddie_robot/DriveWithPowerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveWithPower-response)))
  "Returns string type for a service object of type 'DriveWithPower-response"
  "parallax_eddie_robot/DriveWithPowerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DriveWithPower-response>)))
  "Returns md5sum for a message object of type '<DriveWithPower-response>"
  "76c7d662338a707e15612e795d907dce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DriveWithPower-response)))
  "Returns md5sum for a message object of type 'DriveWithPower-response"
  "76c7d662338a707e15612e795d907dce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DriveWithPower-response>)))
  "Returns full string definition for message of type '<DriveWithPower-response>"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DriveWithPower-response)))
  "Returns full string definition for message of type 'DriveWithPower-response"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DriveWithPower-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DriveWithPower-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DriveWithPower-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DriveWithPower)))
  'DriveWithPower-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DriveWithPower)))
  'DriveWithPower-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveWithPower)))
  "Returns string type for a service object of type '<DriveWithPower>"
  "parallax_eddie_robot/DriveWithPower")