; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude GetSpeed-request.msg.html

(cl:defclass <GetSpeed-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetSpeed-request (<GetSpeed-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetSpeed-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetSpeed-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<GetSpeed-request> is deprecated: use parallax_eddie_robot-srv:GetSpeed-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetSpeed-request>) ostream)
  "Serializes a message object of type '<GetSpeed-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetSpeed-request>) istream)
  "Deserializes a message object of type '<GetSpeed-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetSpeed-request>)))
  "Returns string type for a service object of type '<GetSpeed-request>"
  "parallax_eddie_robot/GetSpeedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSpeed-request)))
  "Returns string type for a service object of type 'GetSpeed-request"
  "parallax_eddie_robot/GetSpeedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetSpeed-request>)))
  "Returns md5sum for a message object of type '<GetSpeed-request>"
  "15ce3af46664ba56d07de9daa31408bd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetSpeed-request)))
  "Returns md5sum for a message object of type 'GetSpeed-request"
  "15ce3af46664ba56d07de9daa31408bd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetSpeed-request>)))
  "Returns full string definition for message of type '<GetSpeed-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetSpeed-request)))
  "Returns full string definition for message of type 'GetSpeed-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetSpeed-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetSpeed-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetSpeed-request
))
;//! \htmlinclude GetSpeed-response.msg.html

(cl:defclass <GetSpeed-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform "")
   (left
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

(cl:defclass GetSpeed-response (<GetSpeed-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetSpeed-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetSpeed-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<GetSpeed-response> is deprecated: use parallax_eddie_robot-srv:GetSpeed-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <GetSpeed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:message-val is deprecated.  Use parallax_eddie_robot-srv:message instead.")
  (message m))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <GetSpeed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:left-val is deprecated.  Use parallax_eddie_robot-srv:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <GetSpeed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:right-val is deprecated.  Use parallax_eddie_robot-srv:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetSpeed-response>) ostream)
  "Serializes a message object of type '<GetSpeed-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
  (cl:let* ((signed (cl:slot-value msg 'left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetSpeed-response>) istream)
  "Deserializes a message object of type '<GetSpeed-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetSpeed-response>)))
  "Returns string type for a service object of type '<GetSpeed-response>"
  "parallax_eddie_robot/GetSpeedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSpeed-response)))
  "Returns string type for a service object of type 'GetSpeed-response"
  "parallax_eddie_robot/GetSpeedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetSpeed-response>)))
  "Returns md5sum for a message object of type '<GetSpeed-response>"
  "15ce3af46664ba56d07de9daa31408bd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetSpeed-response)))
  "Returns md5sum for a message object of type 'GetSpeed-response"
  "15ce3af46664ba56d07de9daa31408bd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetSpeed-response>)))
  "Returns full string definition for message of type '<GetSpeed-response>"
  (cl:format cl:nil "string message~%int16 left~%int16 right~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetSpeed-response)))
  "Returns full string definition for message of type 'GetSpeed-response"
  (cl:format cl:nil "string message~%int16 left~%int16 right~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetSpeed-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetSpeed-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetSpeed-response
    (cl:cons ':message (message msg))
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetSpeed)))
  'GetSpeed-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetSpeed)))
  'GetSpeed-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSpeed)))
  "Returns string type for a service object of type '<GetSpeed>"
  "parallax_eddie_robot/GetSpeed")