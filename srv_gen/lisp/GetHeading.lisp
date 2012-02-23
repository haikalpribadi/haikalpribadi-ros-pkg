; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude GetHeading-request.msg.html

(cl:defclass <GetHeading-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetHeading-request (<GetHeading-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetHeading-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetHeading-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<GetHeading-request> is deprecated: use parallax_eddie_robot-srv:GetHeading-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetHeading-request>) ostream)
  "Serializes a message object of type '<GetHeading-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetHeading-request>) istream)
  "Deserializes a message object of type '<GetHeading-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetHeading-request>)))
  "Returns string type for a service object of type '<GetHeading-request>"
  "parallax_eddie_robot/GetHeadingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetHeading-request)))
  "Returns string type for a service object of type 'GetHeading-request"
  "parallax_eddie_robot/GetHeadingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetHeading-request>)))
  "Returns md5sum for a message object of type '<GetHeading-request>"
  "7865e925662a7442aa42e1f76faa32f2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetHeading-request)))
  "Returns md5sum for a message object of type 'GetHeading-request"
  "7865e925662a7442aa42e1f76faa32f2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetHeading-request>)))
  "Returns full string definition for message of type '<GetHeading-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetHeading-request)))
  "Returns full string definition for message of type 'GetHeading-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetHeading-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetHeading-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetHeading-request
))
;//! \htmlinclude GetHeading-response.msg.html

(cl:defclass <GetHeading-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform "")
   (heading
    :reader heading
    :initarg :heading
    :type cl:fixnum
    :initform 0))
)

(cl:defclass GetHeading-response (<GetHeading-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetHeading-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetHeading-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<GetHeading-response> is deprecated: use parallax_eddie_robot-srv:GetHeading-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <GetHeading-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:message-val is deprecated.  Use parallax_eddie_robot-srv:message instead.")
  (message m))

(cl:ensure-generic-function 'heading-val :lambda-list '(m))
(cl:defmethod heading-val ((m <GetHeading-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:heading-val is deprecated.  Use parallax_eddie_robot-srv:heading instead.")
  (heading m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetHeading-response>) ostream)
  "Serializes a message object of type '<GetHeading-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'heading)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'heading)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetHeading-response>) istream)
  "Deserializes a message object of type '<GetHeading-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'heading)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'heading)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetHeading-response>)))
  "Returns string type for a service object of type '<GetHeading-response>"
  "parallax_eddie_robot/GetHeadingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetHeading-response)))
  "Returns string type for a service object of type 'GetHeading-response"
  "parallax_eddie_robot/GetHeadingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetHeading-response>)))
  "Returns md5sum for a message object of type '<GetHeading-response>"
  "7865e925662a7442aa42e1f76faa32f2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetHeading-response)))
  "Returns md5sum for a message object of type 'GetHeading-response"
  "7865e925662a7442aa42e1f76faa32f2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetHeading-response>)))
  "Returns full string definition for message of type '<GetHeading-response>"
  (cl:format cl:nil "string message~%uint16 heading~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetHeading-response)))
  "Returns full string definition for message of type 'GetHeading-response"
  (cl:format cl:nil "string message~%uint16 heading~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetHeading-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetHeading-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetHeading-response
    (cl:cons ':message (message msg))
    (cl:cons ':heading (heading msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetHeading)))
  'GetHeading-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetHeading)))
  'GetHeading-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetHeading)))
  "Returns string type for a service object of type '<GetHeading>"
  "parallax_eddie_robot/GetHeading")