;; Auto-generated. Do not edit!


(when (boundp 'imu_driver::convert_to_quaternion_datatype)
  (if (not (find-package "IMU_DRIVER"))
    (make-package "IMU_DRIVER"))
  (shadow 'convert_to_quaternion_datatype (find-package "IMU_DRIVER")))
(unless (find-package "IMU_DRIVER::CONVERT_TO_QUATERNION_DATATYPE")
  (make-package "IMU_DRIVER::CONVERT_TO_QUATERNION_DATATYPE"))
(unless (find-package "IMU_DRIVER::CONVERT_TO_QUATERNION_DATATYPEREQUEST")
  (make-package "IMU_DRIVER::CONVERT_TO_QUATERNION_DATATYPEREQUEST"))
(unless (find-package "IMU_DRIVER::CONVERT_TO_QUATERNION_DATATYPERESPONSE")
  (make-package "IMU_DRIVER::CONVERT_TO_QUATERNION_DATATYPERESPONSE"))

(in-package "ROS")





(defclass imu_driver::convert_to_quaternion_datatypeRequest
  :super ros::object
  :slots (_deg_yaw _deg_pitch _deg_roll ))

(defmethod imu_driver::convert_to_quaternion_datatypeRequest
  (:init
   (&key
    ((:deg_yaw __deg_yaw) 0.0)
    ((:deg_pitch __deg_pitch) 0.0)
    ((:deg_roll __deg_roll) 0.0)
    )
   (send-super :init)
   (setq _deg_yaw (float __deg_yaw))
   (setq _deg_pitch (float __deg_pitch))
   (setq _deg_roll (float __deg_roll))
   self)
  (:deg_yaw
   (&optional __deg_yaw)
   (if __deg_yaw (setq _deg_yaw __deg_yaw)) _deg_yaw)
  (:deg_pitch
   (&optional __deg_pitch)
   (if __deg_pitch (setq _deg_pitch __deg_pitch)) _deg_pitch)
  (:deg_roll
   (&optional __deg_roll)
   (if __deg_roll (setq _deg_roll __deg_roll)) _deg_roll)
  (:serialization-length
   ()
   (+
    ;; float64 _deg_yaw
    8
    ;; float64 _deg_pitch
    8
    ;; float64 _deg_roll
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _deg_yaw
       (sys::poke _deg_yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _deg_pitch
       (sys::poke _deg_pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _deg_roll
       (sys::poke _deg_roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _deg_yaw
     (setq _deg_yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _deg_pitch
     (setq _deg_pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _deg_roll
     (setq _deg_roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass imu_driver::convert_to_quaternion_datatypeResponse
  :super ros::object
  :slots (_qx _qy _qz _qw ))

(defmethod imu_driver::convert_to_quaternion_datatypeResponse
  (:init
   (&key
    ((:qx __qx) 0.0)
    ((:qy __qy) 0.0)
    ((:qz __qz) 0.0)
    ((:qw __qw) 0.0)
    )
   (send-super :init)
   (setq _qx (float __qx))
   (setq _qy (float __qy))
   (setq _qz (float __qz))
   (setq _qw (float __qw))
   self)
  (:qx
   (&optional __qx)
   (if __qx (setq _qx __qx)) _qx)
  (:qy
   (&optional __qy)
   (if __qy (setq _qy __qy)) _qy)
  (:qz
   (&optional __qz)
   (if __qz (setq _qz __qz)) _qz)
  (:qw
   (&optional __qw)
   (if __qw (setq _qw __qw)) _qw)
  (:serialization-length
   ()
   (+
    ;; float64 _qx
    8
    ;; float64 _qy
    8
    ;; float64 _qz
    8
    ;; float64 _qw
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _qx
       (sys::poke _qx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _qy
       (sys::poke _qy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _qz
       (sys::poke _qz (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _qw
       (sys::poke _qw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _qx
     (setq _qx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _qy
     (setq _qy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _qz
     (setq _qz (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _qw
     (setq _qw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass imu_driver::convert_to_quaternion_datatype
  :super ros::object
  :slots ())

(setf (get imu_driver::convert_to_quaternion_datatype :md5sum-) "b6b76783e497fcb836668982f5fd5ffd")
(setf (get imu_driver::convert_to_quaternion_datatype :datatype-) "imu_driver/convert_to_quaternion_datatype")
(setf (get imu_driver::convert_to_quaternion_datatype :request) imu_driver::convert_to_quaternion_datatypeRequest)
(setf (get imu_driver::convert_to_quaternion_datatype :response) imu_driver::convert_to_quaternion_datatypeResponse)

(defmethod imu_driver::convert_to_quaternion_datatypeRequest
  (:response () (instance imu_driver::convert_to_quaternion_datatypeResponse :init)))

(setf (get imu_driver::convert_to_quaternion_datatypeRequest :md5sum-) "b6b76783e497fcb836668982f5fd5ffd")
(setf (get imu_driver::convert_to_quaternion_datatypeRequest :datatype-) "imu_driver/convert_to_quaternion_datatypeRequest")
(setf (get imu_driver::convert_to_quaternion_datatypeRequest :definition-)
      "float64 deg_yaw
float64 deg_pitch
float64 deg_roll
---
float64 qx
float64 qy
float64 qz
float64 qw
")

(setf (get imu_driver::convert_to_quaternion_datatypeResponse :md5sum-) "b6b76783e497fcb836668982f5fd5ffd")
(setf (get imu_driver::convert_to_quaternion_datatypeResponse :datatype-) "imu_driver/convert_to_quaternion_datatypeResponse")
(setf (get imu_driver::convert_to_quaternion_datatypeResponse :definition-)
      "float64 deg_yaw
float64 deg_pitch
float64 deg_roll
---
float64 qx
float64 qy
float64 qz
float64 qw
")



(provide :imu_driver/convert_to_quaternion_datatype "b6b76783e497fcb836668982f5fd5ffd")


