; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude GetDistance-request.msg.html

(cl:defclass <GetDistance-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetDistance-request (<GetDistance-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetDistance-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetDistance-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<GetDistance-request> is deprecated: use parallax_eddie_robot-srv:GetDistance-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetDistance-request>) ostream)
  "Serializes a message object of type '<GetDistance-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetDistance-request>) istream)
  "Deserializes a message object of type '<GetDistance-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetDistance-request>)))
  "Returns string type for a service object of type '<GetDistance-request>"
  "parallax_eddie_robot/GetDistanceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDistance-request)))
  "Returns string type for a service object of type 'GetDistance-request"
  "parallax_eddie_robot/GetDistanceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetDistance-request>)))
  "Returns md5sum for a message object of type '<GetDistance-request>"
  "febc810ab9cc360ca3f47fcee4f2ba71")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetDistance-request)))
  "Returns md5sum for a message object of type 'GetDistance-request"
  "febc810ab9cc360ca3f47fcee4f2ba71")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetDistance-request>)))
  "Returns full string definition for message of type '<GetDistance-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetDistance-request)))
  "Returns full string definition for message of type 'GetDistance-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetDistance-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetDistance-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetDistance-request
))
;//! \htmlinclude GetDistance-response.msg.html

(cl:defclass <GetDistance-response> (roslisp-msg-protocol:ros-message)
  ((left
    :reader left
    :initarg :left
    :type cl:integer
    :initform 0)
   (right
    :reader right
    :initarg :right
    :type cl:integer
    :initform 0))
)

(cl:defclass GetDistance-response (<GetDistance-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetDistance-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetDistance-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<GetDistance-response> is deprecated: use parallax_eddie_robot-srv:GetDistance-response instead.")))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <GetDistance-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:left-val is deprecated.  Use parallax_eddie_robot-srv:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <GetDistance-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:right-val is deprecated.  Use parallax_eddie_robot-srv:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetDistance-response>) ostream)
  "Serializes a message object of type '<GetDistance-response>"
  (cl:let* ((signed (cl:slot-value msg 'left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetDistance-response>) istream)
  "Deserializes a message object of type '<GetDistance-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetDistance-response>)))
  "Returns string type for a service object of type '<GetDistance-response>"
  "parallax_eddie_robot/GetDistanceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDistance-response)))
  "Returns string type for a service object of type 'GetDistance-response"
  "parallax_eddie_robot/GetDistanceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetDistance-response>)))
  "Returns md5sum for a message object of type '<GetDistance-response>"
  "febc810ab9cc360ca3f47fcee4f2ba71")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetDistance-response)))
  "Returns md5sum for a message object of type 'GetDistance-response"
  "febc810ab9cc360ca3f47fcee4f2ba71")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetDistance-response>)))
  "Returns full string definition for message of type '<GetDistance-response>"
  (cl:format cl:nil "int32 left~%int32 right~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetDistance-response)))
  "Returns full string definition for message of type 'GetDistance-response"
  (cl:format cl:nil "int32 left~%int32 right~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetDistance-response>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetDistance-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetDistance-response
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetDistance)))
  'GetDistance-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetDistance)))
  'GetDistance-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDistance)))
  "Returns string type for a service object of type '<GetDistance>"
  "parallax_eddie_robot/GetDistance")