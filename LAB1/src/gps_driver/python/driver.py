#!/usr/bin/env python3

import utm      # for utm package
import serial   # for reading from serial port
import rospy
from gps_driver.msg import gps_msg

def gpsdata_sender():
    
    pub = rospy.Publisher('/gps', gps_msg, queue_size=10)
    rospy.init_node('gpsdata_sender')
    rate = rospy.Rate(10)
    serial_port = rospy.get_param('/port', '/dev/ttyUSB0')
    ser=serial.Serial(serial_port,4800)
    msg=gps_msg()

    while not rospy.is_shutdown():   # to keep running continuously
        
        # read data from serial port
        raw_data = (ser.readline()).decode('utf-8')
        print(raw_data)

        # compare if data has GPGGA format
        if "GPGGA" in raw_data:
            
            # segregate data at commas into a list
            seg_data = raw_data.split(",")
            print(seg_data)

            # store required values collected into corresponding variables
            UTC = float(seg_data[1])

            seconds = int(UTC) % 100                    # hours from UTC and convert to int
            minutes = int(UTC / 100) % 100              # minutes conversion
            hours = int(UTC / 10000)

            UTC_seconds = int((hours*3600) + (minutes*60) + seconds)     #convert UTC time to seconds completely for message timestamp
            
            if seg_data[3] == "N":                      # to check if N or S to assign the sign later
                Latitude = float(seg_data[2]) / 100     # to convert to degrees from minutes
            else:
                Latitude = (float(seg_data[2]) / 100) * (-1)     # to convert to degrees from minutes
            
            if seg_data[5] == "E":                      # to check if E or W to assign the sign later
                Longitude = float(seg_data[4]) / 100    # to convert to degrees from minutes
            else:
                Longitude = (float(seg_data[4]) / 100) * (-1)   # to convert to degrees from minutes
            
            HDOP = float(seg_data[8])
            Altitude = float(seg_data[9])

            # convert Latitude and Longitude to UTM_easting, UTM_northing, Zone, and Letter with UTM package
            utm_calculations = utm.from_latlon(Latitude, Longitude)

            # store utm calculated values to corresponding variables
            UTM_easting = utm_calculations[0]
            UTM_northing = utm_calculations[1]
            Zone = utm_calculations[2]
            Letter = utm_calculations[3]

            # Now store required variables to message file
            msg.Header.stamp.secs = UTC_seconds
            msg.Header.frame_id = "GPS1_Frame"
            msg.Latitude = Latitude
            msg.Longitude = Longitude
            msg.Altitude = Altitude
            msg.HDOP = HDOP
            msg.UTM_easting = UTM_easting
            msg.UTM_northing = UTM_northing
            msg.UTC = UTC
            msg.Zone = Zone
            msg.Letter = Letter

            pub.publish(msg)

if __name__ == '__main__':
    try:
        gpsdata_sender()
    except rospy.ROSInterruptException:
        pass
