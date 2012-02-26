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
  "09d1b2323a1aeae9343e81809a820b60")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetSpeed-request)))
  "Returns md5sum for a message object of type 'GetSpeed-request"
  "09d1b2323a1aeae9343e81809a820b60")
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

(cl:defclass GetSpeed-response (<GetSpeed-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetSpeed-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetSpeed-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<GetSpeed-response> is deprecated: use parallax_eddie_robot-srv:GetSpeed-response instead.")))

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
  "09d1b2323a1aeae9343e81809a820b60")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetSpeed-response)))
  "Returns md5sum for a message object of type 'GetSpeed-response"
  "09d1b2323a1aeae9343e81809a820b60")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetSpeed-response>)))
  "Returns full string definition for message of type '<GetSpeed-response>"
  (cl:format cl:nil "int16 left~%int16 right~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetSpeed-response)))
  "Returns full string definition for message of type 'GetSpeed-response"
  (cl:format cl:nil "int16 left~%int16 right~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetSpeed-response>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetSpeed-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetSpeed-response
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