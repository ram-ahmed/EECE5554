; Auto-generated. Do not edit!


(cl:in-package imu_driver-srv)


;//! \htmlinclude convert_to_quaternion_datatype-request.msg.html

(cl:defclass <convert_to_quaternion_datatype-request> (roslisp-msg-protocol:ros-message)
  ((deg_yaw
    :reader deg_yaw
    :initarg :deg_yaw
    :type cl:float
    :initform 0.0)
   (deg_pitch
    :reader deg_pitch
    :initarg :deg_pitch
    :type cl:float
    :initform 0.0)
   (deg_roll
    :reader deg_roll
    :initarg :deg_roll
    :type cl:float
    :initform 0.0))
)

(cl:defclass convert_to_quaternion_datatype-request (<convert_to_quaternion_datatype-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <convert_to_quaternion_datatype-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'convert_to_quaternion_datatype-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imu_driver-srv:<convert_to_quaternion_datatype-request> is deprecated: use imu_driver-srv:convert_to_quaternion_datatype-request instead.")))

(cl:ensure-generic-function 'deg_yaw-val :lambda-list '(m))
(cl:defmethod deg_yaw-val ((m <convert_to_quaternion_datatype-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_driver-srv:deg_yaw-val is deprecated.  Use imu_driver-srv:deg_yaw instead.")
  (deg_yaw m))

(cl:ensure-generic-function 'deg_pitch-val :lambda-list '(m))
(cl:defmethod deg_pitch-val ((m <convert_to_quaternion_datatype-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_driver-srv:deg_pitch-val is deprecated.  Use imu_driver-srv:deg_pitch instead.")
  (deg_pitch m))

(cl:ensure-generic-function 'deg_roll-val :lambda-list '(m))
(cl:defmethod deg_roll-val ((m <convert_to_quaternion_datatype-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_driver-srv:deg_roll-val is deprecated.  Use imu_driver-srv:deg_roll instead.")
  (deg_roll m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <convert_to_quaternion_datatype-request>) ostream)
  "Serializes a message object of type '<convert_to_quaternion_datatype-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'deg_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'deg_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'deg_roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <convert_to_quaternion_datatype-request>) istream)
  "Deserializes a message object of type '<convert_to_quaternion_datatype-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'deg_yaw) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'deg_pitch) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'deg_roll) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<convert_to_quaternion_datatype-request>)))
  "Returns string type for a service object of type '<convert_to_quaternion_datatype-request>"
  "imu_driver/convert_to_quaternion_datatypeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'convert_to_quaternion_datatype-request)))
  "Returns string type for a service object of type 'convert_to_quaternion_datatype-request"
  "imu_driver/convert_to_quaternion_datatypeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<convert_to_quaternion_datatype-request>)))
  "Returns md5sum for a message object of type '<convert_to_quaternion_datatype-request>"
  "b6b76783e497fcb836668982f5fd5ffd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'convert_to_quaternion_datatype-request)))
  "Returns md5sum for a message object of type 'convert_to_quaternion_datatype-request"
  "b6b76783e497fcb836668982f5fd5ffd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<convert_to_quaternion_datatype-request>)))
  "Returns full string definition for message of type '<convert_to_quaternion_datatype-request>"
  (cl:format cl:nil "float64 deg_yaw~%float64 deg_pitch~%float64 deg_roll~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'convert_to_quaternion_datatype-request)))
  "Returns full string definition for message of type 'convert_to_quaternion_datatype-request"
  (cl:format cl:nil "float64 deg_yaw~%float64 deg_pitch~%float64 deg_roll~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <convert_to_quaternion_datatype-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <convert_to_quaternion_datatype-request>))
  "Converts a ROS message object to a list"
  (cl:list 'convert_to_quaternion_datatype-request
    (cl:cons ':deg_yaw (deg_yaw msg))
    (cl:cons ':deg_pitch (deg_pitch msg))
    (cl:cons ':deg_roll (deg_roll msg))
))
;//! \htmlinclude convert_to_quaternion_datatype-response.msg.html

(cl:defclass <convert_to_quaternion_datatype-response> (roslisp-msg-protocol:ros-message)
  ((qx
    :reader qx
    :initarg :qx
    :type cl:float
    :initform 0.0)
   (qy
    :reader qy
    :initarg :qy
    :type cl:float
    :initform 0.0)
   (qz
    :reader qz
    :initarg :qz
    :type cl:float
    :initform 0.0)
   (qw
    :reader qw
    :initarg :qw
    :type cl:float
    :initform 0.0))
)

(cl:defclass convert_to_quaternion_datatype-response (<convert_to_quaternion_datatype-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <convert_to_quaternion_datatype-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'convert_to_quaternion_datatype-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imu_driver-srv:<convert_to_quaternion_datatype-response> is deprecated: use imu_driver-srv:convert_to_quaternion_datatype-response instead.")))

(cl:ensure-generic-function 'qx-val :lambda-list '(m))
(cl:defmethod qx-val ((m <convert_to_quaternion_datatype-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_driver-srv:qx-val is deprecated.  Use imu_driver-srv:qx instead.")
  (qx m))

(cl:ensure-generic-function 'qy-val :lambda-list '(m))
(cl:defmethod qy-val ((m <convert_to_quaternion_datatype-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_driver-srv:qy-val is deprecated.  Use imu_driver-srv:qy instead.")
  (qy m))

(cl:ensure-generic-function 'qz-val :lambda-list '(m))
(cl:defmethod qz-val ((m <convert_to_quaternion_datatype-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_driver-srv:qz-val is deprecated.  Use imu_driver-srv:qz instead.")
  (qz m))

(cl:ensure-generic-function 'qw-val :lambda-list '(m))
(cl:defmethod qw-val ((m <convert_to_quaternion_datatype-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_driver-srv:qw-val is deprecated.  Use imu_driver-srv:qw instead.")
  (qw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <convert_to_quaternion_datatype-response>) ostream)
  "Serializes a message object of type '<convert_to_quaternion_datatype-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'qx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'qy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'qz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'qw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <convert_to_quaternion_datatype-response>) istream)
  "Deserializes a message object of type '<convert_to_quaternion_datatype-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'qx) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'qy) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'qz) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'qw) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<convert_to_quaternion_datatype-response>)))
  "Returns string type for a service object of type '<convert_to_quaternion_datatype-response>"
  "imu_driver/convert_to_quaternion_datatypeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'convert_to_quaternion_datatype-response)))
  "Returns string type for a service object of type 'convert_to_quaternion_datatype-response"
  "imu_driver/convert_to_quaternion_datatypeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<convert_to_quaternion_datatype-response>)))
  "Returns md5sum for a message object of type '<convert_to_quaternion_datatype-response>"
  "b6b76783e497fcb836668982f5fd5ffd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'convert_to_quaternion_datatype-response)))
  "Returns md5sum for a message object of type 'convert_to_quaternion_datatype-response"
  "b6b76783e497fcb836668982f5fd5ffd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<convert_to_quaternion_datatype-response>)))
  "Returns full string definition for message of type '<convert_to_quaternion_datatype-response>"
  (cl:format cl:nil "float64 qx~%float64 qy~%float64 qz~%float64 qw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'convert_to_quaternion_datatype-response)))
  "Returns full string definition for message of type 'convert_to_quaternion_datatype-response"
  (cl:format cl:nil "float64 qx~%float64 qy~%float64 qz~%float64 qw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <convert_to_quaternion_datatype-response>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <convert_to_quaternion_datatype-response>))
  "Converts a ROS message object to a list"
  (cl:list 'convert_to_quaternion_datatype-response
    (cl:cons ':qx (qx msg))
    (cl:cons ':qy (qy msg))
    (cl:cons ':qz (qz msg))
    (cl:cons ':qw (qw msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'convert_to_quaternion_datatype)))
  'convert_to_quaternion_datatype-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'convert_to_quaternion_datatype)))
  'convert_to_quaternion_datatype-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'convert_to_quaternion_datatype)))
  "Returns string type for a service object of type '<convert_to_quaternion_datatype>"
  "imu_driver/convert_to_quaternion_datatype")