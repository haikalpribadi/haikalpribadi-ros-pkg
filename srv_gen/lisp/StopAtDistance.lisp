; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude StopAtDistance-request.msg.html

(cl:defclass <StopAtDistance-request> (roslisp-msg-protocol:ros-message)
  ((distance
    :reader distance
    :initarg :distance
    :type cl:fixnum
    :initform 0))
)

(cl:defclass StopAtDistance-request (<StopAtDistance-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StopAtDistance-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StopAtDistance-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<StopAtDistance-request> is deprecated: use parallax_eddie_robot-srv:StopAtDistance-request instead.")))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <StopAtDistance-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:distance-val is deprecated.  Use parallax_eddie_robot-srv:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StopAtDistance-request>) ostream)
  "Serializes a message object of type '<StopAtDistance-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StopAtDistance-request>) istream)
  "Deserializes a message object of type '<StopAtDistance-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StopAtDistance-request>)))
  "Returns string type for a service object of type '<StopAtDistance-request>"
  "parallax_eddie_robot/StopAtDistanceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopAtDistance-request)))
  "Returns string type for a service object of type 'StopAtDistance-request"
  "parallax_eddie_robot/StopAtDistanceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StopAtDistance-request>)))
  "Returns md5sum for a message object of type '<StopAtDistance-request>"
  "4ad421c5c9f6450a242633ba426475ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StopAtDistance-request)))
  "Returns md5sum for a message object of type 'StopAtDistance-request"
  "4ad421c5c9f6450a242633ba426475ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StopAtDistance-request>)))
  "Returns full string definition for message of type '<StopAtDistance-request>"
  (cl:format cl:nil "uint16 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StopAtDistance-request)))
  "Returns full string definition for message of type 'StopAtDistance-request"
  (cl:format cl:nil "uint16 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StopAtDistance-request>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StopAtDistance-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StopAtDistance-request
    (cl:cons ':distance (distance msg))
))
;//! \htmlinclude StopAtDistance-response.msg.html

(cl:defclass <StopAtDistance-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass StopAtDistance-response (<StopAtDistance-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StopAtDistance-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StopAtDistance-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<StopAtDistance-response> is deprecated: use parallax_eddie_robot-srv:StopAtDistance-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <StopAtDistance-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:message-val is deprecated.  Use parallax_eddie_robot-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StopAtDistance-response>) ostream)
  "Serializes a message object of type '<StopAtDistance-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StopAtDistance-response>) istream)
  "Deserializes a message object of type '<StopAtDistance-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StopAtDistance-response>)))
  "Returns string type for a service object of type '<StopAtDistance-response>"
  "parallax_eddie_robot/StopAtDistanceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopAtDistance-response)))
  "Returns string type for a service object of type 'StopAtDistance-response"
  "parallax_eddie_robot/StopAtDistanceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StopAtDistance-response>)))
  "Returns md5sum for a message object of type '<StopAtDistance-response>"
  "4ad421c5c9f6450a242633ba426475ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StopAtDistance-response)))
  "Returns md5sum for a message object of type 'StopAtDistance-response"
  "4ad421c5c9f6450a242633ba426475ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StopAtDistance-response>)))
  "Returns full string definition for message of type '<StopAtDistance-response>"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StopAtDistance-response)))
  "Returns full string definition for message of type 'StopAtDistance-response"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StopAtDistance-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StopAtDistance-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StopAtDistance-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StopAtDistance)))
  'StopAtDistance-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StopAtDistance)))
  'StopAtDistance-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopAtDistance)))
  "Returns string type for a service object of type '<StopAtDistance>"
  "parallax_eddie_robot/StopAtDistance")