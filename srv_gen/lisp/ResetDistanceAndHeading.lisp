; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude ResetDistanceAndHeading-request.msg.html

(cl:defclass <ResetDistanceAndHeading-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ResetDistanceAndHeading-request (<ResetDistanceAndHeading-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetDistanceAndHeading-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetDistanceAndHeading-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<ResetDistanceAndHeading-request> is deprecated: use parallax_eddie_robot-srv:ResetDistanceAndHeading-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetDistanceAndHeading-request>) ostream)
  "Serializes a message object of type '<ResetDistanceAndHeading-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetDistanceAndHeading-request>) istream)
  "Deserializes a message object of type '<ResetDistanceAndHeading-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetDistanceAndHeading-request>)))
  "Returns string type for a service object of type '<ResetDistanceAndHeading-request>"
  "parallax_eddie_robot/ResetDistanceAndHeadingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetDistanceAndHeading-request)))
  "Returns string type for a service object of type 'ResetDistanceAndHeading-request"
  "parallax_eddie_robot/ResetDistanceAndHeadingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetDistanceAndHeading-request>)))
  "Returns md5sum for a message object of type '<ResetDistanceAndHeading-request>"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetDistanceAndHeading-request)))
  "Returns md5sum for a message object of type 'ResetDistanceAndHeading-request"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetDistanceAndHeading-request>)))
  "Returns full string definition for message of type '<ResetDistanceAndHeading-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetDistanceAndHeading-request)))
  "Returns full string definition for message of type 'ResetDistanceAndHeading-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetDistanceAndHeading-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetDistanceAndHeading-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetDistanceAndHeading-request
))
;//! \htmlinclude ResetDistanceAndHeading-response.msg.html

(cl:defclass <ResetDistanceAndHeading-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ResetDistanceAndHeading-response (<ResetDistanceAndHeading-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetDistanceAndHeading-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetDistanceAndHeading-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<ResetDistanceAndHeading-response> is deprecated: use parallax_eddie_robot-srv:ResetDistanceAndHeading-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ResetDistanceAndHeading-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:message-val is deprecated.  Use parallax_eddie_robot-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetDistanceAndHeading-response>) ostream)
  "Serializes a message object of type '<ResetDistanceAndHeading-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetDistanceAndHeading-response>) istream)
  "Deserializes a message object of type '<ResetDistanceAndHeading-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetDistanceAndHeading-response>)))
  "Returns string type for a service object of type '<ResetDistanceAndHeading-response>"
  "parallax_eddie_robot/ResetDistanceAndHeadingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetDistanceAndHeading-response)))
  "Returns string type for a service object of type 'ResetDistanceAndHeading-response"
  "parallax_eddie_robot/ResetDistanceAndHeadingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetDistanceAndHeading-response>)))
  "Returns md5sum for a message object of type '<ResetDistanceAndHeading-response>"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetDistanceAndHeading-response)))
  "Returns md5sum for a message object of type 'ResetDistanceAndHeading-response"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetDistanceAndHeading-response>)))
  "Returns full string definition for message of type '<ResetDistanceAndHeading-response>"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetDistanceAndHeading-response)))
  "Returns full string definition for message of type 'ResetDistanceAndHeading-response"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetDistanceAndHeading-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetDistanceAndHeading-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetDistanceAndHeading-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ResetDistanceAndHeading)))
  'ResetDistanceAndHeading-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ResetDistanceAndHeading)))
  'ResetDistanceAndHeading-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetDistanceAndHeading)))
  "Returns string type for a service object of type '<ResetDistanceAndHeading>"
  "parallax_eddie_robot/ResetDistanceAndHeading")