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
  "810ecc07236797df75a38fc217bb9783")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Accelerate-request)))
  "Returns md5sum for a message object of type 'Accelerate-request"
  "810ecc07236797df75a38fc217bb9783")
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
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass Accelerate-response (<Accelerate-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Accelerate-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Accelerate-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parallax_eddie_robot-srv:<Accelerate-response> is deprecated: use parallax_eddie_robot-srv:Accelerate-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <Accelerate-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parallax_eddie_robot-srv:message-val is deprecated.  Use parallax_eddie_robot-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Accelerate-response>) ostream)
  "Serializes a message object of type '<Accelerate-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Accelerate-response>) istream)
  "Deserializes a message object of type '<Accelerate-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Accelerate-response>)))
  "Returns string type for a service object of type '<Accelerate-response>"
  "parallax_eddie_robot/AccelerateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Accelerate-response)))
  "Returns string type for a service object of type 'Accelerate-response"
  "parallax_eddie_robot/AccelerateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Accelerate-response>)))
  "Returns md5sum for a message object of type '<Accelerate-response>"
  "810ecc07236797df75a38fc217bb9783")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Accelerate-response)))
  "Returns md5sum for a message object of type 'Accelerate-response"
  "810ecc07236797df75a38fc217bb9783")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Accelerate-response>)))
  "Returns full string definition for message of type '<Accelerate-response>"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Accelerate-response)))
  "Returns full string definition for message of type 'Accelerate-response"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Accelerate-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Accelerate-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Accelerate-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Accelerate)))
  'Accelerate-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Accelerate)))
  'Accelerate-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Accelerate)))
  "Returns string type for a service object of type '<Accelerate>"
  "parallax_eddie_robot/Accelerate")