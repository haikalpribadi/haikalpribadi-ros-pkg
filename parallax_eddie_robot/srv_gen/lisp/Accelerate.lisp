; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude Accelerate-request.msg.html

(cl:defclass <Accelerate-request> (roslisp-msg-protocol:ros-message)
  ((rate
    :reader rate
    :initarg :rate
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Accelerate-request (<Accelerate-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Accelerate-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Accelerate-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<Accelerate-request> is deprecated: use parallax_eddie_robot-srv:Accelerate-request instead.")))

(cl:ensure-generic-function 'rate-val :lambda-list '(m))
(cl:defmethod rate-val ((m <Accelerate-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:rate-val is deprecated.  Use parallax_eddie_robot-srv:rate instead.")
  (rate m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Accelerate-request>) ostream)
  "Serializes a message object of type '<Accelerate-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rate)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Accelerate-request>) istream)
  "Deserializes a message object of type '<Accelerate-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rate)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Accelerate-request>)))
  "Returns string type for a service object of type '<Accelerate-request>"
  "parallax_eddie_robot/AccelerateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Accelerate-request)))
  "Returns string type for a service object of type 'Accelerate-request"
  "parallax_eddie_robot/AccelerateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Accelerate-request>)))
  "Returns md5sum for a message object of type '<Accelerate-request>"
  "5d7032a19fb9c1282f0a629414d15b97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Accelerate-request)))
  "Returns md5sum for a message object of type 'Accelerate-request"
  "5d7032a19fb9c1282f0a629414d15b97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Accelerate-request>)))
  "Returns full string definition for message of type '<Accelerate-request>"
  (cl:format cl:nil "uint16 rate~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Accelerate-request)))
  "Returns full string definition for message of type 'Accelerate-request"
  (cl:format cl:nil "uint16 rate~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Accelerate-request>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Accelerate-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Accelerate-request
    (cl:cons ':rate (rate msg))
))
;//! \htmlinclude Accelerate-response.msg.html

(cl:defclass <Accelerate-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Accelerate-response (<Accelerate-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Accelerate-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Accelerate-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<Accelerate-response> is deprecated: use parallax_eddie_robot-srv:Accelerate-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Accelerate-response>) ostream)
  "Serializes a message object of type '<Accelerate-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Accelerate-response>) istream)
  "Deserializes a message object of type '<Accelerate-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Accelerate-response>)))
  "Returns string type for a service object of type '<Accelerate-response>"
  "parallax_eddie_robot/AccelerateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Accelerate-response)))
  "Returns string type for a service object of type 'Accelerate-response"
  "parallax_eddie_robot/AccelerateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Accelerate-response>)))
  "Returns md5sum for a message object of type '<Accelerate-response>"
  "5d7032a19fb9c1282f0a629414d15b97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Accelerate-response)))
  "Returns md5sum for a message object of type 'Accelerate-response"
  "5d7032a19fb9c1282f0a629414d15b97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Accelerate-response>)))
  "Returns full string definition for message of type '<Accelerate-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Accelerate-response)))
  "Returns full string definition for message of type 'Accelerate-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Accelerate-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Accelerate-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Accelerate-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Accelerate)))
  'Accelerate-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Accelerate)))
  'Accelerate-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Accelerate)))
  "Returns string type for a service object of type '<Accelerate>"
  "parallax_eddie_robot/Accelerate")