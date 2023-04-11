#!/usr/bin/env python3

import utm      # for utm package
import serial   # for reading from serial port
import rospy
from imu_driver.msg import Vectornav
from imu_driver.srv import convert_to_quaternion_datatype,convert_to_quaternion_datatypeResponse
#from __future__ import print_function

def handler(deg_yaw, deg_pitch, deg_roll):
    return convert_to_quaternion_datatypeResponse(deg_yaw,deg_pitch,deg_roll)

def imudata_sender():
    
    # declare a publisher
    pub = rospy.Publisher('/imu', Vectornav, queue_size=10)

    # initialize the node
    rospy.init_node('imudata_sender')
    rate = rospy.Rate(40)

    # get parameters declared in launch file
    serial_port = rospy.get_param('/port', '/dev/ttyUSB0')
    #serial_baud = rospy.get_param('/baud', 115200)

    # defining the serial port variables
    ser=serial.Serial(serial_port,115200)

    # defining a message variable
    msg=Vectornav()

    # getting system time for message and declaring the required variables
    now = rospy.get_rostime()
    sys_secs = now.secs
    sys_nsecs = now.nsecs

    # defining string for setting frequency and receiving data
    hertz = "$VNWRG,07,40*XX"
    data_output = "$VNWRG,06,14*XX"

    # writing string to register in byte format
    ser.write(hertz.encode('utf-8'))
    ser.write(data_output.encode('utf-8'))

    while not rospy.is_shutdown():   # to keep running continuously
        
        # read data from serial port and convert to string
        raw_data = (ser.readline()).decode('utf-8')
        #print(raw_data)

        # compare if data has VNYMR format
        if "VNYMR" in raw_data:
            
            # segregate data at commas into a list
            seg_data = raw_data.split(",")
            #print(seg_data)

            # store required values collected into corresponding variables
            deg_yaw = float(seg_data[1])
            deg_pitch = float(seg_data[2])
            deg_roll = float(seg_data[3])

            mag_x = float(seg_data[4])
            mag_y = float(seg_data[5])
            mag_z = float(seg_data[6])

            acc_x = float(seg_data[7])
            acc_y = float(seg_data[8])
            acc_z = float(seg_data[9])

            ang_x = float(seg_data[10])
            ang_y = float(seg_data[11])
            ang_z = float((seg_data[12].split('*'))[0])

            # call the quaternion conversion service
            rospy.wait_for_service('convert_to_quaternion')

            try:

                # declare variable for function for conversion through service
                conversion = rospy.ServiceProxy('convert_to_quaternion', convert_to_quaternion_datatype)

                # call for conversion function through service and store in a variable
                response = conversion(deg_yaw, deg_pitch, deg_roll)
            except rospy.ServiceException as e:

                # print exception error if failed to call service
                print("Service call failed: %s " %e)
                        
            # Now store required variables to message file
            msg.header.stamp.secs = sys_secs
            msg.header.stamp.nsecs = sys_nsecs
            msg.header.frame_id = "imu1_frame"
            
            msg.imu.orientation.w = float(response.qw)
            msg.imu.orientation.x = float(response.qx)
            msg.imu.orientation.y = float(response.qy)
            msg.imu.orientation.z = float(response.qz)

            msg.imu.angular_velocity.x = ang_x
            msg.imu.angular_velocity.y = ang_y
            msg.imu.angular_velocity.z = ang_z

            msg.imu.linear_acceleration.x = acc_x
            msg.imu.linear_acceleration.y = acc_y
            msg.imu.linear_acceleration.z = acc_z

            msg.mag_field.magnetic_field.x = mag_x
            msg.mag_field.magnetic_field.y = mag_y
            msg.mag_field.magnetic_field.z = mag_z

            msg.raw_data = raw_data
            
            print(msg)

            pub.publish(msg)

if __name__ == '__main__':
    try:
        imudata_sender()
    except rospy.ROSInterruptException:
        pass