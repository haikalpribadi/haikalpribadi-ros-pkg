; Auto-generated. Do not edit!


(cl:in-package parallax_eddie_robot-msg)


;//! \htmlinclude Distances.msg.html

(cl:defclass <Distances> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass Distances (<Distances>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Distances>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Distances)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-msg:<Distances> is deprecated: use parallax_eddie_robot-msg:Distances instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <Distances>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-msg:value-val is deprecated.  Use parallax_eddie_robot-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Distances>) ostream)
  "Serializes a message object of type '<Distances>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Distances>) istream)
  "Deserializes a message object of type '<Distances>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'value) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'value)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Distances>)))
  "Returns string type for a message object of type '<Distances>"
  "parallax_eddie_robot/Distances")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Distances)))
  "Returns string type for a message object of type 'Distances"
  "parallax_eddie_robot/Distances")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Distances>)))
  "Returns md5sum for a message object of type '<Distances>"
  "589316cc3e2406b1889ccc3e95d6a413")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Distances)))
  "Returns md5sum for a message object of type 'Distances"
  "589316cc3e2406b1889ccc3e95d6a413")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Distances>)))
  "Returns full string definition for message of type '<Distances>"
  (cl:format cl:nil "uint16[] value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Distances)))
  "Returns full string definition for message of type 'Distances"
  (cl:format cl:nil "uint16[] value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Distances>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'value) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Distances>))
  "Converts a ROS message object to a list"
  (cl:list 'Distances
    (cl:cons ':value (value msg))
))
