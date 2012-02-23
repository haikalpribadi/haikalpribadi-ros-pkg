; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude ResetEncoder-request.msg.html

(cl:defclass <ResetEncoder-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ResetEncoder-request (<ResetEncoder-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetEncoder-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetEncoder-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<ResetEncoder-request> is deprecated: use parallax_eddie_robot-srv:ResetEncoder-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetEncoder-request>) ostream)
  "Serializes a message object of type '<ResetEncoder-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetEncoder-request>) istream)
  "Deserializes a message object of type '<ResetEncoder-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetEncoder-request>)))
  "Returns string type for a service object of type '<ResetEncoder-request>"
  "parallax_eddie_robot/ResetEncoderRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetEncoder-request)))
  "Returns string type for a service object of type 'ResetEncoder-request"
  "parallax_eddie_robot/ResetEncoderRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetEncoder-request>)))
  "Returns md5sum for a message object of type '<ResetEncoder-request>"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetEncoder-request)))
  "Returns md5sum for a message object of type 'ResetEncoder-request"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetEncoder-request>)))
  "Returns full string definition for message of type '<ResetEncoder-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetEncoder-request)))
  "Returns full string definition for message of type 'ResetEncoder-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetEncoder-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetEncoder-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetEncoder-request
))
;//! \htmlinclude ResetEncoder-response.msg.html

(cl:defclass <ResetEncoder-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ResetEncoder-response (<ResetEncoder-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetEncoder-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetEncoder-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<ResetEncoder-response> is deprecated: use parallax_eddie_robot-srv:ResetEncoder-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ResetEncoder-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:message-val is deprecated.  Use parallax_eddie_robot-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetEncoder-response>) ostream)
  "Serializes a message object of type '<ResetEncoder-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetEncoder-response>) istream)
  "Deserializes a message object of type '<ResetEncoder-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetEncoder-response>)))
  "Returns string type for a service object of type '<ResetEncoder-response>"
  "parallax_eddie_robot/ResetEncoderResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetEncoder-response)))
  "Returns string type for a service object of type 'ResetEncoder-response"
  "parallax_eddie_robot/ResetEncoderResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetEncoder-response>)))
  "Returns md5sum for a message object of type '<ResetEncoder-response>"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetEncoder-response)))
  "Returns md5sum for a message object of type 'ResetEncoder-response"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetEncoder-response>)))
  "Returns full string definition for message of type '<ResetEncoder-response>"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetEncoder-response)))
  "Returns full string definition for message of type 'ResetEncoder-response"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetEncoder-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetEncoder-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetEncoder-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ResetEncoder)))
  'ResetEncoder-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ResetEncoder)))
  'ResetEncoder-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetEncoder)))
  "Returns string type for a service object of type '<ResetEncoder>"
  "parallax_eddie_robot/ResetEncoder")