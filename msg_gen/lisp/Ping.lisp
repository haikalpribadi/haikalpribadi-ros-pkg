; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-msg)


;//! \htmlinclude Ping.msg.html

(cl:defclass <Ping> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:string
    :initform "")
   (value1
    :reader value1
    :initarg :value1
    :type cl:fixnum
    :initform 0)
   (value2
    :reader value2
    :initarg :value2
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Ping (<Ping>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Ping>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Ping)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-msg:<Ping> is deprecated: use parallax_eddie_robot-msg:Ping instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <Ping>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-msg:status-val is deprecated.  Use parallax_eddie_robot-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'value1-val :lambda-list '(m))
(cl:defmethod value1-val ((m <Ping>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-msg:value1-val is deprecated.  Use parallax_eddie_robot-msg:value1 instead.")
  (value1 m))

(cl:ensure-generic-function 'value2-val :lambda-list '(m))
(cl:defmethod value2-val ((m <Ping>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-msg:value2-val is deprecated.  Use parallax_eddie_robot-msg:value2 instead.")
  (value2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Ping>) ostream)
  "Serializes a message object of type '<Ping>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
  (cl:let* ((signed (cl:slot-value msg 'value1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'value2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Ping>) istream)
  "Deserializes a message object of type '<Ping>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value1) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value2) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Ping>)))
  "Returns string type for a message object of type '<Ping>"
  "parallax_eddie_robot/Ping")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ping)))
  "Returns string type for a message object of type 'Ping"
  "parallax_eddie_robot/Ping")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Ping>)))
  "Returns md5sum for a message object of type '<Ping>"
  "a9ac828bf931795f5243ecde9378b11f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Ping)))
  "Returns md5sum for a message object of type 'Ping"
  "a9ac828bf931795f5243ecde9378b11f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Ping>)))
  "Returns full string definition for message of type '<Ping>"
  (cl:format cl:nil "string status~%int16 value1~%int16 value2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Ping)))
  "Returns full string definition for message of type 'Ping"
  (cl:format cl:nil "string status~%int16 value1~%int16 value2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Ping>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'status))
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Ping>))
  "Converts a ROS message object to a list"
  (cl:list 'Ping
    (cl:cons ':status (status msg))
    (cl:cons ':value1 (value1 msg))
    (cl:cons ':value2 (value2 msg))
))
