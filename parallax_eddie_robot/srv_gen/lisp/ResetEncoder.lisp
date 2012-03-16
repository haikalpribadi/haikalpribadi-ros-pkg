; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-srv)


;//! \htmlinclude ResetEncoder-request.msg.html

(cl:defclass <ResetEncoder-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ResetEncoder-request (<ResetEncoder-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetEncoder-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetEncoder-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<ResetEncoder-request> is deprecated: use parallax_eddie_robot-srv:ResetEncoder-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetEncoder-request>) ostream)
  "Serializes a message object of type '<ResetEncoder-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetEncoder-request>) istream)
  "Deserializes a message object of type '<ResetEncoder-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetEncoder-request>)))
  "Returns string type for a service object of type '<ResetEncoder-request>"
  "parallax_eddie_robot/ResetEncoderRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetEncoder-request)))
  "Returns string type for a service object of type 'ResetEncoder-request"
  "parallax_eddie_robot/ResetEncoderRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetEncoder-request>)))
  "Returns md5sum for a message object of type '<ResetEncoder-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetEncoder-request)))
  "Returns md5sum for a message object of type 'ResetEncoder-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetEncoder-request>)))
  "Returns full string definition for message of type '<ResetEncoder-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetEncoder-request)))
  "Returns full string definition for message of type 'ResetEncoder-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetEncoder-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetEncoder-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetEncoder-request
))
;//! \htmlinclude ResetEncoder-response.msg.html

(cl:defclass <ResetEncoder-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ResetEncoder-response (<ResetEncoder-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetEncoder-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetEncoder-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<ResetEncoder-response> is deprecated: use parallax_eddie_robot-srv:ResetEncoder-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetEncoder-response>) ostream)
  "Serializes a message object of type '<ResetEncoder-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetEncoder-response>) istream)
  "Deserializes a message object of type '<ResetEncoder-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetEncoder-response>)))
  "Returns string type for a service object of type '<ResetEncoder-response>"
  "parallax_eddie_robot/ResetEncoderResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetEncoder-response)))
  "Returns string type for a service object of type 'ResetEncoder-response"
  "parallax_eddie_robot/ResetEncoderResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetEncoder-response>)))
  "Returns md5sum for a message object of type '<ResetEncoder-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetEncoder-response)))
  "Returns md5sum for a message object of type 'ResetEncoder-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetEncoder-response>)))
  "Returns full string definition for message of type '<ResetEncoder-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetEncoder-response)))
  "Returns full string definition for message of type 'ResetEncoder-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetEncoder-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetEncoder-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetEncoder-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ResetEncoder)))
  'ResetEncoder-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ResetEncoder)))
  'ResetEncoder-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetEncoder)))
  "Returns string type for a service object of type '<ResetEncoder>"
  "parallax_eddie_robot/ResetEncoder")