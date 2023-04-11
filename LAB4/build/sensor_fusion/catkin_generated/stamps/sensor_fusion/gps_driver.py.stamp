#!/usr/bin/env python3

import utm      # for utm package
import serial   # for reading from serial port
import rospy
from sensor_fusion.msg import gps_msg

def gpsdata_sender():
    
    pub = rospy.Publisher('/gps', gps_msg, queue_size=10)
    rospy.init_node('gpsdata_sender')
    rate = rospy.Rate(10)
    serial_port = rospy.get_param('/gps_port', '/dev/ttyUSB0')
    ser=serial.Serial(serial_port,4800)
    msg=gps_msg()

    while not rospy.is_shutdown():   # to keep running continuously
        
        # read data from serial port
        raw_data = (ser.readline()).decode('utf-8')
        #print(raw_data)

        # compare if data has GPGGA format
        if "GPGGA" in raw_data:
            
            # segregate data at commas into a list
            seg_data = raw_data.split(",")
            #print(seg_data)

            # store required values collected into corresponding variables
            UTC = float(seg_data[1])

            UTC_nanoseconds = (UTC % 1) * 10000000000       # to get in nanoseconds
            seconds = int(UTC) % 100                    # hours from UTC and convert to int
            minutes = int(UTC / 100) % 100              # minutes conversion
            hours = int(UTC / 10000)

            UTC_seconds = int((hours*3600) + (minutes*60) + seconds)     #convert UTC time to seconds completely for message timestamp

            Latitude = int((float(seg_data[2]) / 100)) + ((float(seg_data[2]) % 100) / 60)         # to convert to degrees from minutes for Latitude
            Longitude = int((float(seg_data[4]) / 100)) + ((float(seg_data[4]) % 100) / 60)         # to convert to degrees from minutes for Longitude
            
            if seg_data[3] == "N":                      # to check if N or S to assign the sign later
                Latitude = Latitude * 1
            else:
                Latitude = Latitude * (-1)
            
            if seg_data[5] == "E":                      # to check if E or W to assign the sign later
                Longitude = Longitude * 1
            else:
                Longitude = Longitude * (-1)
            
            Quality = int(seg_data[6])
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
            msg.Header.stamp.nsecs = UTC_nanoseconds
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

            print(msg)

            pub.publish(msg)

if __name__ == '__main__':
    try:
        gpsdata_sender()
    except rospy.ROSInterruptException:
        pass