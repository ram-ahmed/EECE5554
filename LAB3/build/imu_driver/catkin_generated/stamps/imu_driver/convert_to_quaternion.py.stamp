#!/usr/bin/env python3

from __future__ import print_function

import sys
import rospy
from imu_driver.srv import convert_to_quaternion_datatype,convert_to_quaternion_datatypeResponse
import numpy as np
from math import pi

def handler(req):

    #first convert degrees to radians
    yaw_rad = float(req.deg_yaw)*pi/180
    pitch_rad = float(req.deg_pitch)*pi/180
    roll_rad = float(req.deg_roll)*pi/180

    #store cos and sine values for ease of use later
    cy = np.cos(yaw_rad/2)
    cp = np.cos(pitch_rad/2)
    cr = np.cos(roll_rad/2)
    sy = np.sin(yaw_rad/2)
    sp = np.sin(pitch_rad/2)
    sr = np.sin(roll_rad/2)
    
    #then use quaternion conversion
    qw = (cr * cp * cy) + (sr * sp * sy)
    qx = (sr * cp * cy) - (cr * sp * sy)
    qy = (cr * sp * cy) + (sr * cp * sy)
    qz = (cr * cp * sy) - (sr * sp * cy)

    return convert_to_quaternion_datatypeResponse(qw, qx, qy, qz)


def convert_to_quaternion():
    
    # declare this as server node
    rospy.init_node('convert_to_quaternion')

    # declare a service for conversion to quaternion
    s=rospy.Service('convert_to_quaternion',convert_to_quaternion_datatype,handler)

    # let node keep running
    rospy.spin()

if __name__ == "__main__":

    # call the defined function
    convert_to_quaternion()