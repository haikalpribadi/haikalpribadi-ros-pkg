; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-msg)


;//! \htmlinclude KeyStroke.msg.html

(cl:defclass <KeyStroke> (roslisp-msg-protocol:ros-message)
  ((keycode
    :reader keycode
    :initarg :keycode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass KeyStroke (<KeyStroke>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KeyStroke>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KeyStroke)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-msg:<KeyStroke> is deprecated: use parallax_eddie_robot-msg:KeyStroke instead.")))

(cl:ensure-generic-function 'keycode-val :lambda-list '(m))
(cl:defmethod keycode-val ((m <KeyStroke>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-msg:keycode-val is deprecated.  Use parallax_eddie_robot-msg:keycode instead.")
  (keycode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KeyStroke>) ostream)
  "Serializes a message object of type '<KeyStroke>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'keycode)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KeyStroke>) istream)
  "Deserializes a message object of type '<KeyStroke>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'keycode)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KeyStroke>)))
  "Returns string type for a message object of type '<KeyStroke>"
  "parallax_eddie_robot/KeyStroke")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KeyStroke)))
  "Returns string type for a message object of type 'KeyStroke"
  "parallax_eddie_robot/KeyStroke")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KeyStroke>)))
  "Returns md5sum for a message object of type '<KeyStroke>"
  "a93d576beb5f3535c249bfdbb8e89901")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KeyStroke)))
  "Returns md5sum for a message object of type 'KeyStroke"
  "a93d576beb5f3535c249bfdbb8e89901")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KeyStroke>)))
  "Returns full string definition for message of type '<KeyStroke>"
  (cl:format cl:nil "uint8 keycode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KeyStroke)))
  "Returns full string definition for message of type 'KeyStroke"
  (cl:format cl:nil "uint8 keycode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KeyStroke>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KeyStroke>))
  "Converts a ROS message object to a list"
  (cl:list 'KeyStroke
    (cl:cons ':keycode (keycode msg))
))
