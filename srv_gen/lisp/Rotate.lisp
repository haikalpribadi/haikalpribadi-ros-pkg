; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude Rotate-request.msg.html

(cl:defclass <Rotate-request> (roslisp-msg-protocol:ros-message)
  ((angle
    :reader angle
    :initarg :angle
    :type cl:fixnum
    :initform 0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Rotate-request (<Rotate-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Rotate-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Rotate-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<Rotate-request> is deprecated: use parallax_eddie_robot-srv:Rotate-request instead.")))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <Rotate-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:angle-val is deprecated.  Use parallax_eddie_robot-srv:angle instead.")
  (angle m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <Rotate-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:speed-val is deprecated.  Use parallax_eddie_robot-srv:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Rotate-request>) ostream)
  "Serializes a message object of type '<Rotate-request>"
  (cl:let* ((signed (cl:slot-value msg 'angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Rotate-request>) istream)
  "Deserializes a message object of type '<Rotate-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'angle) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Rotate-request>)))
  "Returns string type for a service object of type '<Rotate-request>"
  "parallax_eddie_robot/RotateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Rotate-request)))
  "Returns string type for a service object of type 'Rotate-request"
  "parallax_eddie_robot/RotateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Rotate-request>)))
  "Returns md5sum for a message object of type '<Rotate-request>"
  "d3db82965a5ad154ac99a267d1b43b65")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Rotate-request)))
  "Returns md5sum for a message object of type 'Rotate-request"
  "d3db82965a5ad154ac99a267d1b43b65")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Rotate-request>)))
  "Returns full string definition for message of type '<Rotate-request>"
  (cl:format cl:nil "int16 angle~%uint16 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Rotate-request)))
  "Returns full string definition for message of type 'Rotate-request"
  (cl:format cl:nil "int16 angle~%uint16 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Rotate-request>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Rotate-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Rotate-request
    (cl:cons ':angle (angle msg))
    (cl:cons ':speed (speed msg))
))
;//! \htmlinclude Rotate-response.msg.html

(cl:defclass <Rotate-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass Rotate-response (<Rotate-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Rotate-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Rotate-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<Rotate-response> is deprecated: use parallax_eddie_robot-srv:Rotate-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <Rotate-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:message-val is deprecated.  Use parallax_eddie_robot-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Rotate-response>) ostream)
  "Serializes a message object of type '<Rotate-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Rotate-response>) istream)
  "Deserializes a message object of type '<Rotate-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Rotate-response>)))
  "Returns string type for a service object of type '<Rotate-response>"
  "parallax_eddie_robot/RotateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Rotate-response)))
  "Returns string type for a service object of type 'Rotate-response"
  "parallax_eddie_robot/RotateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Rotate-response>)))
  "Returns md5sum for a message object of type '<Rotate-response>"
  "d3db82965a5ad154ac99a267d1b43b65")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Rotate-response)))
  "Returns md5sum for a message object of type 'Rotate-response"
  "d3db82965a5ad154ac99a267d1b43b65")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Rotate-response>)))
  "Returns full string definition for message of type '<Rotate-response>"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Rotate-response)))
  "Returns full string definition for message of type 'Rotate-response"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Rotate-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Rotate-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Rotate-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Rotate)))
  'Rotate-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Rotate)))
  'Rotate-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Rotate)))
  "Returns string type for a service object of type '<Rotate>"
  "parallax_eddie_robot/Rotate")