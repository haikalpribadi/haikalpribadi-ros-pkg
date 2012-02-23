; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude Speed-request.msg.html

(cl:defclass <Speed-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass Speed-request (<Speed-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Speed-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Speed-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<Speed-request> is deprecated: use parallax_eddie_robot-srv:Speed-request instead.")))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <Speed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:left-val is deprecated.  Use parallax_eddie_robot-srv:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <Speed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:right-val is deprecated.  Use parallax_eddie_robot-srv:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Speed-request>) ostream)
  "Serializes a message object of type '<Speed-request>"
  (cl:let* ((signed (cl:slot-value msg 'left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Speed-request>) istream)
  "Deserializes a message object of type '<Speed-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Speed-request>)))
  "Returns string type for a service object of type '<Speed-request>"
  "parallax_eddie_robot/SpeedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Speed-request)))
  "Returns string type for a service object of type 'Speed-request"
  "parallax_eddie_robot/SpeedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Speed-request>)))
  "Returns md5sum for a message object of type '<Speed-request>"
  "7b8633b27ab7356cf2073b0a6f6d699f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Speed-request)))
  "Returns md5sum for a message object of type 'Speed-request"
  "7b8633b27ab7356cf2073b0a6f6d699f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Speed-request>)))
  "Returns full string definition for message of type '<Speed-request>"
  (cl:format cl:nil "int16 left~%int16 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Speed-request)))
  "Returns full string definition for message of type 'Speed-request"
  (cl:format cl:nil "int16 left~%int16 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Speed-request>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Speed-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Speed-request
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
))
;//! \htmlinclude Speed-response.msg.html

(cl:defclass <Speed-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass Speed-response (<Speed-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Speed-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Speed-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<Speed-response> is deprecated: use parallax_eddie_robot-srv:Speed-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <Speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:message-val is deprecated.  Use parallax_eddie_robot-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Speed-response>) ostream)
  "Serializes a message object of type '<Speed-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Speed-response>) istream)
  "Deserializes a message object of type '<Speed-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Speed-response>)))
  "Returns string type for a service object of type '<Speed-response>"
  "parallax_eddie_robot/SpeedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Speed-response)))
  "Returns string type for a service object of type 'Speed-response"
  "parallax_eddie_robot/SpeedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Speed-response>)))
  "Returns md5sum for a message object of type '<Speed-response>"
  "7b8633b27ab7356cf2073b0a6f6d699f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Speed-response)))
  "Returns md5sum for a message object of type 'Speed-response"
  "7b8633b27ab7356cf2073b0a6f6d699f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Speed-response>)))
  "Returns full string definition for message of type '<Speed-response>"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Speed-response)))
  "Returns full string definition for message of type 'Speed-response"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Speed-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Speed-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Speed-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Speed)))
  'Speed-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Speed)))
  'Speed-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Speed)))
  "Returns string type for a service object of type '<Speed>"
  "parallax_eddie_robot/Speed")