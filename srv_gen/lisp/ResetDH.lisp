; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude ResetDH-request.msg.html

(cl:defclass <ResetDH-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ResetDH-request (<ResetDH-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetDH-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetDH-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<ResetDH-request> is deprecated: use parallax_eddie_robot-srv:ResetDH-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetDH-request>) ostream)
  "Serializes a message object of type '<ResetDH-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetDH-request>) istream)
  "Deserializes a message object of type '<ResetDH-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetDH-request>)))
  "Returns string type for a service object of type '<ResetDH-request>"
  "parallax_eddie_robot/ResetDHRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetDH-request)))
  "Returns string type for a service object of type 'ResetDH-request"
  "parallax_eddie_robot/ResetDHRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetDH-request>)))
  "Returns md5sum for a message object of type '<ResetDH-request>"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetDH-request)))
  "Returns md5sum for a message object of type 'ResetDH-request"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetDH-request>)))
  "Returns full string definition for message of type '<ResetDH-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetDH-request)))
  "Returns full string definition for message of type 'ResetDH-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetDH-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetDH-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetDH-request
))
;//! \htmlinclude ResetDH-response.msg.html

(cl:defclass <ResetDH-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ResetDH-response (<ResetDH-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetDH-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetDH-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<ResetDH-response> is deprecated: use parallax_eddie_robot-srv:ResetDH-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ResetDH-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:message-val is deprecated.  Use parallax_eddie_robot-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetDH-response>) ostream)
  "Serializes a message object of type '<ResetDH-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetDH-response>) istream)
  "Deserializes a message object of type '<ResetDH-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetDH-response>)))
  "Returns string type for a service object of type '<ResetDH-response>"
  "parallax_eddie_robot/ResetDHResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetDH-response)))
  "Returns string type for a service object of type 'ResetDH-response"
  "parallax_eddie_robot/ResetDHResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetDH-response>)))
  "Returns md5sum for a message object of type '<ResetDH-response>"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetDH-response)))
  "Returns md5sum for a message object of type 'ResetDH-response"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetDH-response>)))
  "Returns full string definition for message of type '<ResetDH-response>"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetDH-response)))
  "Returns full string definition for message of type 'ResetDH-response"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetDH-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetDH-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetDH-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ResetDH)))
  'ResetDH-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ResetDH)))
  'ResetDH-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetDH)))
  "Returns string type for a service object of type '<ResetDH>"
  "parallax_eddie_robot/ResetDH")