; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-msg)


;//! \htmlinclude ADC.msg.html

(cl:defclass <ADC> (roslisp-msg-protocol:ros-message)
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
    :initform 0)
   (value3
    :reader value3
    :initarg :value3
    :type cl:fixnum
    :initform 0)
   (value4
    :reader value4
    :initarg :value4
    :type cl:fixnum
    :initform 0)
   (value5
    :reader value5
    :initarg :value5
    :type cl:fixnum
    :initform 0)
   (value6
    :reader value6
    :initarg :value6
    :type cl:fixnum
    :initform 0)
   (value7
    :reader value7
    :initarg :value7
    :type cl:fixnum
    :initform 0)
   (value8
    :reader value8
    :initarg :value8
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ADC (<ADC>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ADC>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ADC)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-msg:<ADC> is deprecated: use parallax_eddie_robot-msg:ADC instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <ADC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-msg:status-val is deprecated.  Use parallax_eddie_robot-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'value1-val :lambda-list '(m))
(cl:defmethod value1-val ((m <ADC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-msg:value1-val is deprecated.  Use parallax_eddie_robot-msg:value1 instead.")
  (value1 m))

(cl:ensure-generic-function 'value2-val :lambda-list '(m))
(cl:defmethod value2-val ((m <ADC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-msg:value2-val is deprecated.  Use parallax_eddie_robot-msg:value2 instead.")
  (value2 m))

(cl:ensure-generic-function 'value3-val :lambda-list '(m))
(cl:defmethod value3-val ((m <ADC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-msg:value3-val is deprecated.  Use parallax_eddie_robot-msg:value3 instead.")
  (value3 m))

(cl:ensure-generic-function 'value4-val :lambda-list '(m))
(cl:defmethod value4-val ((m <ADC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-msg:value4-val is deprecated.  Use parallax_eddie_robot-msg:value4 instead.")
  (value4 m))

(cl:ensure-generic-function 'value5-val :lambda-list '(m))
(cl:defmethod value5-val ((m <ADC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-msg:value5-val is deprecated.  Use parallax_eddie_robot-msg:value5 instead.")
  (value5 m))

(cl:ensure-generic-function 'value6-val :lambda-list '(m))
(cl:defmethod value6-val ((m <ADC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-msg:value6-val is deprecated.  Use parallax_eddie_robot-msg:value6 instead.")
  (value6 m))

(cl:ensure-generic-function 'value7-val :lambda-list '(m))
(cl:defmethod value7-val ((m <ADC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-msg:value7-val is deprecated.  Use parallax_eddie_robot-msg:value7 instead.")
  (value7 m))

(cl:ensure-generic-function 'value8-val :lambda-list '(m))
(cl:defmethod value8-val ((m <ADC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-msg:value8-val is deprecated.  Use parallax_eddie_robot-msg:value8 instead.")
  (value8 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ADC>) ostream)
  "Serializes a message object of type '<ADC>"
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
  (cl:let* ((signed (cl:slot-value msg 'value3)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'value4)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'value5)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'value6)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'value7)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'value8)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ADC>) istream)
  "Deserializes a message object of type '<ADC>"
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value3) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value4) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value5) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value6) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value7) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value8) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ADC>)))
  "Returns string type for a message object of type '<ADC>"
  "parallax_eddie_robot/ADC")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ADC)))
  "Returns string type for a message object of type 'ADC"
  "parallax_eddie_robot/ADC")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ADC>)))
  "Returns md5sum for a message object of type '<ADC>"
  "5007bc3b23ea814869e7acca4b5c929c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ADC)))
  "Returns md5sum for a message object of type 'ADC"
  "5007bc3b23ea814869e7acca4b5c929c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ADC>)))
  "Returns full string definition for message of type '<ADC>"
  (cl:format cl:nil "string status~%int16 value1~%int16 value2~%int16 value3~%int16 value4~%int16 value5~%int16 value6~%int16 value7~%int16 value8~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ADC)))
  "Returns full string definition for message of type 'ADC"
  (cl:format cl:nil "string status~%int16 value1~%int16 value2~%int16 value3~%int16 value4~%int16 value5~%int16 value6~%int16 value7~%int16 value8~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ADC>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'status))
     2
     2
     2
     2
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ADC>))
  "Converts a ROS message object to a list"
  (cl:list 'ADC
    (cl:cons ':status (status msg))
    (cl:cons ':value1 (value1 msg))
    (cl:cons ':value2 (value2 msg))
    (cl:cons ':value3 (value3 msg))
    (cl:cons ':value4 (value4 msg))
    (cl:cons ':value5 (value5 msg))
    (cl:cons ':value6 (value6 msg))
    (cl:cons ':value7 (value7 msg))
    (cl:cons ':value8 (value8 msg))
))
