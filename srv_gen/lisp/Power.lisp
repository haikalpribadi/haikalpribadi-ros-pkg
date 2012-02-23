; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude Power-request.msg.html

(cl:defclass <Power-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass Power-request (<Power-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Power-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Power-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<Power-request> is deprecated: use parallax_eddie_robot-srv:Power-request instead.")))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <Power-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:left-val is deprecated.  Use parallax_eddie_robot-srv:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <Power-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:right-val is deprecated.  Use parallax_eddie_robot-srv:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Power-request>) ostream)
  "Serializes a message object of type '<Power-request>"
  (cl:let* ((signed (cl:slot-value msg 'left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Power-request>) istream)
  "Deserializes a message object of type '<Power-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Power-request>)))
  "Returns string type for a service object of type '<Power-request>"
  "parallax_eddie_robot/PowerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Power-request)))
  "Returns string type for a service object of type 'Power-request"
  "parallax_eddie_robot/PowerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Power-request>)))
  "Returns md5sum for a message object of type '<Power-request>"
  "76c7d662338a707e15612e795d907dce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Power-request)))
  "Returns md5sum for a message object of type 'Power-request"
  "76c7d662338a707e15612e795d907dce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Power-request>)))
  "Returns full string definition for message of type '<Power-request>"
  (cl:format cl:nil "int8 left~%int8 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Power-request)))
  "Returns full string definition for message of type 'Power-request"
  (cl:format cl:nil "int8 left~%int8 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Power-request>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Power-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Power-request
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
))
;//! \htmlinclude Power-response.msg.html

(cl:defclass <Power-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass Power-response (<Power-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Power-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Power-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<Power-response> is deprecated: use parallax_eddie_robot-srv:Power-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <Power-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:message-val is deprecated.  Use parallax_eddie_robot-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Power-response>) ostream)
  "Serializes a message object of type '<Power-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Power-response>) istream)
  "Deserializes a message object of type '<Power-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Power-response>)))
  "Returns string type for a service object of type '<Power-response>"
  "parallax_eddie_robot/PowerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Power-response)))
  "Returns string type for a service object of type 'Power-response"
  "parallax_eddie_robot/PowerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Power-response>)))
  "Returns md5sum for a message object of type '<Power-response>"
  "76c7d662338a707e15612e795d907dce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Power-response)))
  "Returns md5sum for a message object of type 'Power-response"
  "76c7d662338a707e15612e795d907dce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Power-response>)))
  "Returns full string definition for message of type '<Power-response>"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Power-response)))
  "Returns full string definition for message of type 'Power-response"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Power-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Power-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Power-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Power)))
  'Power-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Power)))
  'Power-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Power)))
  "Returns string type for a service object of type '<Power>"
  "parallax_eddie_robot/Power")