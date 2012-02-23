; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude Travel-request.msg.html

(cl:defclass <Travel-request> (roslisp-msg-protocol:ros-message)
  ((distance
    :reader distance
    :initarg :distance
    :type cl:fixnum
    :initform 0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Travel-request (<Travel-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Travel-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Travel-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<Travel-request> is deprecated: use parallax_eddie_robot-srv:Travel-request instead.")))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <Travel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:distance-val is deprecated.  Use parallax_eddie_robot-srv:distance instead.")
  (distance m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <Travel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:speed-val is deprecated.  Use parallax_eddie_robot-srv:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Travel-request>) ostream)
  "Serializes a message object of type '<Travel-request>"
  (cl:let* ((signed (cl:slot-value msg 'distance)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Travel-request>) istream)
  "Deserializes a message object of type '<Travel-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'distance) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Travel-request>)))
  "Returns string type for a service object of type '<Travel-request>"
  "parallax_eddie_robot/TravelRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Travel-request)))
  "Returns string type for a service object of type 'Travel-request"
  "parallax_eddie_robot/TravelRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Travel-request>)))
  "Returns md5sum for a message object of type '<Travel-request>"
  "1aac722b8dc69f896e41647fceba2db6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Travel-request)))
  "Returns md5sum for a message object of type 'Travel-request"
  "1aac722b8dc69f896e41647fceba2db6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Travel-request>)))
  "Returns full string definition for message of type '<Travel-request>"
  (cl:format cl:nil "int16 distance~%uint16 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Travel-request)))
  "Returns full string definition for message of type 'Travel-request"
  (cl:format cl:nil "int16 distance~%uint16 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Travel-request>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Travel-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Travel-request
    (cl:cons ':distance (distance msg))
    (cl:cons ':speed (speed msg))
))
;//! \htmlinclude Travel-response.msg.html

(cl:defclass <Travel-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass Travel-response (<Travel-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Travel-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Travel-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<Travel-response> is deprecated: use parallax_eddie_robot-srv:Travel-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <Travel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:message-val is deprecated.  Use parallax_eddie_robot-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Travel-response>) ostream)
  "Serializes a message object of type '<Travel-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Travel-response>) istream)
  "Deserializes a message object of type '<Travel-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Travel-response>)))
  "Returns string type for a service object of type '<Travel-response>"
  "parallax_eddie_robot/TravelResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Travel-response)))
  "Returns string type for a service object of type 'Travel-response"
  "parallax_eddie_robot/TravelResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Travel-response>)))
  "Returns md5sum for a message object of type '<Travel-response>"
  "1aac722b8dc69f896e41647fceba2db6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Travel-response)))
  "Returns md5sum for a message object of type 'Travel-response"
  "1aac722b8dc69f896e41647fceba2db6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Travel-response>)))
  "Returns full string definition for message of type '<Travel-response>"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Travel-response)))
  "Returns full string definition for message of type 'Travel-response"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Travel-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Travel-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Travel-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Travel)))
  'Travel-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Travel)))
  'Travel-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Travel)))
  "Returns string type for a service object of type '<Travel>"
  "parallax_eddie_robot/Travel")