; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude StopAtDistance-request.msg.html

(cl:defclass <StopAtDistance-request> (roslisp-msg-protocol:ros-message)
  ((distance
    :reader distance
    :initarg :distance
    :type cl:fixnum
    :initform 0))
)

(cl:defclass StopAtDistance-request (<StopAtDistance-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StopAtDistance-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StopAtDistance-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<StopAtDistance-request> is deprecated: use parallax_eddie_robot-srv:StopAtDistance-request instead.")))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <StopAtDistance-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:distance-val is deprecated.  Use parallax_eddie_robot-srv:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StopAtDistance-request>) ostream)
  "Serializes a message object of type '<StopAtDistance-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StopAtDistance-request>) istream)
  "Deserializes a message object of type '<StopAtDistance-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StopAtDistance-request>)))
  "Returns string type for a service object of type '<StopAtDistance-request>"
  "parallax_eddie_robot/StopAtDistanceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopAtDistance-request)))
  "Returns string type for a service object of type 'StopAtDistance-request"
  "parallax_eddie_robot/StopAtDistanceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StopAtDistance-request>)))
  "Returns md5sum for a message object of type '<StopAtDistance-request>"
  "4db6e4febd2342355b86e2b5ee754faf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StopAtDistance-request)))
  "Returns md5sum for a message object of type 'StopAtDistance-request"
  "4db6e4febd2342355b86e2b5ee754faf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StopAtDistance-request>)))
  "Returns full string definition for message of type '<StopAtDistance-request>"
  (cl:format cl:nil "uint16 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StopAtDistance-request)))
  "Returns full string definition for message of type 'StopAtDistance-request"
  (cl:format cl:nil "uint16 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StopAtDistance-request>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StopAtDistance-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StopAtDistance-request
    (cl:cons ':distance (distance msg))
))
;//! \htmlinclude StopAtDistance-response.msg.html

(cl:defclass <StopAtDistance-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass StopAtDistance-response (<StopAtDistance-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StopAtDistance-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StopAtDistance-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<StopAtDistance-response> is deprecated: use parallax_eddie_robot-srv:StopAtDistance-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StopAtDistance-response>) ostream)
  "Serializes a message object of type '<StopAtDistance-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StopAtDistance-response>) istream)
  "Deserializes a message object of type '<StopAtDistance-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StopAtDistance-response>)))
  "Returns string type for a service object of type '<StopAtDistance-response>"
  "parallax_eddie_robot/StopAtDistanceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopAtDistance-response)))
  "Returns string type for a service object of type 'StopAtDistance-response"
  "parallax_eddie_robot/StopAtDistanceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StopAtDistance-response>)))
  "Returns md5sum for a message object of type '<StopAtDistance-response>"
  "4db6e4febd2342355b86e2b5ee754faf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StopAtDistance-response)))
  "Returns md5sum for a message object of type 'StopAtDistance-response"
  "4db6e4febd2342355b86e2b5ee754faf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StopAtDistance-response>)))
  "Returns full string definition for message of type '<StopAtDistance-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StopAtDistance-response)))
  "Returns full string definition for message of type 'StopAtDistance-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StopAtDistance-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StopAtDistance-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StopAtDistance-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StopAtDistance)))
  'StopAtDistance-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StopAtDistance)))
  'StopAtDistance-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopAtDistance)))
  "Returns string type for a service object of type '<StopAtDistance>"
  "parallax_eddie_robot/StopAtDistance")