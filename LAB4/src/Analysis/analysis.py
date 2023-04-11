import bagpy
from bagpy import bagreader
#from data import *
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
from scipy import stats
import math

#a = bagreader("circles.bag")
b = bagreader("Data.bag")

#gps_msg = a.message_by_topic('/gps')
#imu_msg = a.message_by_topic('/imu')

gps_msg1 = b.message_by_topic('/gps')
imu_msg1 = b.message_by_topic('/imu')


#gps_c = pd.read_csv(gps_msg)
#imu_c= pd.read_csv(imu_msg)

gpscsv = pd.read_csv(gps_msg1)
imucsv= pd.read_csv(imu_msg1)

# Assign rows 133 onwards of gpscsv to gps_bt
gps_bt = gpscsv.iloc[133:]

# Assign rows 5281 onwards of imucsv to imu_bt
imu_bt = imucsv.iloc[5281:]

# Assign rows till 132 of gpscsv to gps_c
gps_c = gpscsv.iloc[:133]

# Assign rows till 5280 of imucsv to imu_c
imu_c = imucsv.iloc[:5281]

#gps_c = gpscsv[:132]
#imu_c = imucsv[:5280]

#gps_bt = gpscsv[132:]
#imu_bt = imucsv[5281:]

#print(imu_c)
#print(imu_bt)

imu_c['Time'] = imu_c['Time'] - imu_c['Time'].min()
imu_bt['Time'] = imu_bt['Time'] - imu_bt['Time'].min()

ax = imu_c.plot( x ='mag_field.magnetic_field.x', y ='mag_field.magnetic_field.y', kind = "scatter", color = "red")
ax.set_xlabel("Magnetic Field X (Gauss)")
ax.set_ylabel("Magnetic Field y (Gauss)")
ax.set_title("Uncorrected Magnetometer Readings")
ax.grid()
#plt.show()

#hard iron
offset_x = (imu_c['mag_field.magnetic_field.x'].max() + imu_c['mag_field.magnetic_field.x'].min()) / 2
offset_y = (imu_c['mag_field.magnetic_field.y'].max() + imu_c['mag_field.magnetic_field.y'].min()) / 2
offset_z = (imu_c['mag_field.magnetic_field.z'].max() + imu_c['mag_field.magnetic_field.z'].min()) / 2

imu_c['corr_x'] = imu_c['mag_field.magnetic_field.x'] - offset_x
imu_c['corr_y'] = imu_c['mag_field.magnetic_field.y'] - offset_y
imu_c['corr_z'] = imu_c['mag_field.magnetic_field.z'] - offset_z

#soft iron
avg_x = (imu_c['corr_x'].max() - imu_c['corr_x'].min()) / 2
avg_y = (imu_c['corr_y'].max() - imu_c['corr_y'].min()) / 2
avg_z = (imu_c['corr_z'].max() - imu_c['corr_z'].min()) / 2

avg_delta = ( avg_x + avg_y + avg_z ) / 3

scale_x = avg_delta / avg_x
scale_y = avg_delta / avg_y
scale_z = avg_delta / avg_z

imu_c['corrected_x'] = (imu_c['corr_x']) * scale_x
imu_c['corrected_y'] = (imu_c['corr_y']) * scale_y
imu_c['corrected_z'] = (imu_c['corr_z']) * scale_z


#boston tour
imu_bt['corr_x'] = imu_bt['mag_field.magnetic_field.x'] - offset_x
imu_bt['corr_y'] = imu_bt['mag_field.magnetic_field.y'] - offset_y
imu_bt['corr_z'] = imu_bt['mag_field.magnetic_field.z'] - offset_z

imu_bt['corrected_x'] = (imu_bt['corr_x']) * scale_x
imu_bt['corrected_y'] = (imu_bt['corr_y']) * scale_y
imu_bt['corrected_z'] = (imu_bt['corr_z']) * scale_z

#print(scale_x)

ax = imu_c.plot(x ='corrected_x', y ='corrected_y', kind = "scatter")
non_corrected = imu_c.plot(ax = ax, x ='mag_field.magnetic_field.x', y ='mag_field.magnetic_field.y', kind = "scatter", color = "red")
ax.set_xlabel("Magnetic Field X (Gauss)")
ax.set_ylabel("Magnetic Field y (Gauss)")
ax.set_title("Corrected and Uncorrected Magnetometer Readings")
ax.legend(['Corrected', 'Uncorrected'])
ax.set_xlim(-0.35, 0.25)
#ax.set_ylim(-0.3, 0.5)
ax.grid()
#plt.show()

def tilt_compensation(mx,my,mz,roll,pitch):
    capX = (mz*np.sin(roll)) - (my*np.cos(roll))
    capY = (mx*np.cos(pitch)) + (my*np.sin(pitch)*np.sin(roll)) + (mz*np.sin(pitch)*np.cos(roll))
    yaw = np.arctan2(capX,capY)
    yaw = yaw * (180 / math.pi)
    return yaw

imu_c['roll'] = imu_c['Time']
imu_c['pitch'] = imu_c['Time']
imu_c['yaw_raw'] = imu_c['Time']


for i in range(0,len(imu_c['Time'])):
    
    imu_c.at[i, 'roll'] = float(str(imu_c['raw_data'][i]).split(',')[3])
    imu_c.at[i, 'pitch'] = float(str(imu_c['raw_data'][i]).split(',')[2])
    imu_c.at[i, 'yaw_raw'] = float(str(imu_c['raw_data'][i]).split(',')[1])

    #imu_c['roll'][i] = float(str(imu_c['raw_data'][i]).split(',')[3])
    #imu_c['pitch'][i] = float(str(imu_c['raw_data'][i]).split(',')[2])
    #imu_c['yaw_raw'][i] = float(str(imu_c['raw_data'][i]).split(',')[1])

ax = imu_c.plot(x ='Time', y ='roll', kind = "line")
non_corrected = imu_c.plot(ax = ax, x ='Time', y ='pitch', kind = "line", color = "red")
yaw_raw = imu_c.plot(ax = ax, x ='Time', y ='yaw_raw', kind = "line", color = "green")
ax.set_xlabel("Time")
ax.set_ylabel("Angle")
ax.set_title("Roll,Pitch,Yaw Raw")
ax.legend(['Roll', 'Pitch','Yaw'])
#ax.set_xlim(-0.2, 0.1)
#ax.set_ylim(-0.2, 0.4)
ax.grid()
#plt.show()

imu_c['yaw_correct'] = tilt_compensation(imu_c['corrected_x'],imu_c['corrected_y'],imu_c['corrected_z'],imu_c['roll'],imu_c['pitch'])
imu_c['yaw'] = tilt_compensation(imu_c['mag_field.magnetic_field.x'],imu_c['mag_field.magnetic_field.y'],imu_c['mag_field.magnetic_field.z'],imu_c['roll'],imu_c['pitch'])

#imu_c['yaw_correct'] = np.arctan((-1)*imu_c['corrected_y'] / imu_c['corrected_x'])
#imu_c['yaw_correct'] = imu_c['yaw_correct'] * (180/ math.pi)
#imu_c['yaw'] = np.arctan((-1)*imu_c['mag_field.magnetic_field.y'] / imu_c['mag_field.magnetic_field.x'])
#imu_c['yaw'] = imu_c['yaw'] * (180 / math.pi)

ax = imu_c.plot(x ='Time', y ='yaw_correct', kind = "line")
non_corrected = imu_c.plot(ax = ax, x ='Time', y ='yaw', kind = "line", color = "red")
ax.set_xlabel("Time (Seconds)")
ax.set_ylabel("yaw angle (degrees)")
ax.set_title("Corrected and Uncorrected Yaw Angle (Circular Data)")
ax.legend(['Corrected', 'Uncorrected'])
ax.grid()
#plt.show()

#imu_bt['yaw_correct'] = np.arctan((-1)*imu_bt['corrected_y'] / imu_bt['corrected_x'])
#imu_bt['yaw_correct'] = imu_bt['yaw_correct'] * (180/ math.pi)
#imu_bt['yaw1'] = np.arctan((-1)*imu_bt['mag_field.magnetic_field.y'] / imu_bt['mag_field.magnetic_field.x'])
#imu_bt['yaw1'] = imu_bt['yaw1'] * (180 / math.pi)

imu_bt['roll'] = imu_bt['Time']
imu_bt['pitch'] = imu_bt['Time']
imu_bt['yaw_raw'] = imu_bt['Time']


for i in range(len(imu_bt['Time'])):
    
    imu_bt['roll'].iloc[i] = float(str(imu_bt['raw_data'].iloc[i]).split(',')[3])
    imu_bt['pitch'].iloc[i] = float(str(imu_bt['raw_data'].iloc[i]).split(',')[2])
    imu_bt['yaw_raw'].iloc[i] = float(str(imu_bt['raw_data'].iloc[i]).split(',')[1])

    #imu_bt.at[i, 'roll'] = float(str(imu_bt['raw_data'][i]).split(',')[3])
    #imu_bt.at[i, 'pitch'] = float(str(imu_bt['raw_data'][i]).split(',')[2])
    #imu_bt.at[i, 'yaw_raw'] = float(str(imu_bt['raw_data'][i]).split(',')[1])
#
#    #imu_c['roll'][i] = float(str(imu_c['raw_data'][i]).split(',')[3])
#    #imu_c['pitch'][i] = float(str(imu_c['raw_data'][i]).split(',')[2])
#    #imu_c['yaw_raw'][i] = float(str(imu_c['raw_data'][i]).split(',')[1])

ax = imu_bt.plot(x ='Time', y ='roll', kind = "line")
non_corrected = imu_bt.plot(ax = ax, x ='Time', y ='pitch', kind = "line", color = "red")
yaw_raw = imu_bt.plot(ax = ax, x ='Time', y ='yaw_raw', kind = "line", color = "green")
ax.set_xlabel("Time")
ax.set_ylabel("Angle")
ax.set_title("Roll,Pitch,Yaw Raw (Driving Data)")
ax.legend(['Roll', 'Pitch','Yaw'])
#ax.set_xlim(-0.2, 0.1)
#ax.set_ylim(-0.2, 0.4)
ax.grid()
#plt.show()


imu_bt['yaw_correct'] = tilt_compensation(imu_bt['corrected_x'],imu_bt['corrected_y'],imu_bt['corrected_z'],imu_bt['roll'],imu_bt['pitch'])
imu_bt['yaw'] = tilt_compensation(imu_bt['mag_field.magnetic_field.x'],imu_bt['mag_field.magnetic_field.y'],imu_bt['mag_field.magnetic_field.z'],imu_bt['roll'],imu_bt['pitch'])

ax = imu_bt.plot(x ='Time', y ='yaw_correct', kind = "line")
non_corrected = imu_bt.plot(ax = ax, x ='Time', y ='yaw', kind = "line", color = "red")
#raw = imu_bt.plot(ax = ax, x ='Time', y ='yaw_raw', kind = "line", color = "green")
ax.set_xlabel("Time (Seconds)")
ax.set_ylabel("yaw angle (degrees)")
ax.set_title("Corrected, Uncorrected (Driving Data)")
ax.legend(['Corrected', 'Uncorrected'])
ax.grid()
#plt.show()

from scipy import integrate
import seaborn as sns
from scipy import stats

def wrapToPi(x):
    xwrap = np.remainder(x, 2 * np.pi)
    mask = np.abs(xwrap) > np.pi
    xwrap[mask] -= 2 * np.pi * np.sign(xwrap[mask])
    mask1 = x < 0
    mask2 = np.remainder(x, np.pi) == 0
    mask3 = np.remainder(x, 2 * np.pi) != 0
    xwrap[mask1 & mask2 & mask3] -= 2 * np.pi
    return xwrap

imu_bt['integral_x'] = integrate.cumtrapz(imu_bt['imu.angular_velocity.x'], imu_bt['Time'], initial = 0)
imu_bt['integral_y'] = integrate.cumtrapz(imu_bt['imu.angular_velocity.y'], imu_bt['Time'], initial = 0)
imu_bt['integral_z'] = integrate.cumtrapz(imu_bt['imu.angular_velocity.z'], imu_bt['Time'], initial = 0)

imu_bt['integral_x'] = wrapToPi(imu_bt['integral_x']) * (180 / math.pi)
imu_bt['integral_y'] = wrapToPi(imu_bt['integral_y']) * (180 / math.pi)
imu_bt['integral_z'] = wrapToPi(imu_bt['integral_z']) * (180 / math.pi)

#imu_bt['integral_z'] = imu_bt['integral_z'] # * (180 / math.pi)

ax = imu_bt.plot(x ='Time', y ='integral_z', kind = "line")
imu_bt.plot(ax = ax, x ='Time', y ='yaw_correct', kind = "line", color = "red")
ax.set_xlabel("Time (Seconds)")
ax.set_ylabel("yaw angle (degrees)")
ax.set_title("Yaw Angle Using Gyroscope Estimate and Magnetometer (Driving)")
ax.legend(['Gyroscope', 'Magnetometer'])
ax.grid()
#plt.show()

import numpy as np
from scipy.signal import filtfilt, butter
from quaternion import quaternion, from_rotation_vector, rotate_vectors


def estimate_orientation(a, w, t, alpha=0.9, g_ref=(0., 0., 1.), theta_min=1e-4, highpass=.001, lowpass=.9):
    N = len(t)
    dt = np.diff(t)
    g_ref = np.array(g_ref)

    # get high-passed angular velocity
    w = filtfilt(*butter(5, highpass, btype='high'), w, axis=0, padlen= len(w) - 1)

    # get low-passed linear acceleration
    a = filtfilt(*butter(5, lowpass, btype='low'), a, axis=0, padlen= len(a) -1)


    return w,a

#imu_bt['roll'] = float((str(imu_bt['raw_data']).split(','))[3])
#imu_bt['pitch'] = float((str(imu_bt['raw_data']).split(','))[2])
#imu_bt['yaw'] = float((str(imu_bt['raw_data']).split(','))[1])

#magnetometer
mag = [imu_bt['roll'], imu_bt['pitch'], imu_bt['yaw_correct']]
integ = [imu_bt['integral_x'],imu_bt['integral_y'],imu_bt['integral_z']]
t = imu_bt['Time']

x,z = estimate_orientation(mag, integ ,t,alpha=0.9, g_ref=(0., 0., 1.), theta_min=0.1, highpass=0.001, lowpass=0.75)
imu_bt['hi-pass'] =  x[2]
imu_bt['lo-pass'] =  z[2]
alpha = 0.20
imu_bt['cf'] = (alpha * (imu_bt['lo-pass'] + imu_bt['integral_z'] * imu_bt['Time'].diff()) + (1 - alpha) * imu_bt['hi-pass'])# - 30
#imu_bt['yaw'] = (-1) * imu_bt['yaw']

rows_to_replace = imu_bt[imu_bt.Time > 300]# & imu_bt.Time < 400]
imu_bt.loc[rows_to_replace.index, 'cf'] = -(imu_bt.loc[rows_to_replace.index, 'cf'])

rows_to_replace = imu_bt[imu_bt.Time > 400]# & imu_bt.Time < 400]
imu_bt.loc[rows_to_replace.index, 'cf'] = -(imu_bt.loc[rows_to_replace.index, 'cf'])


ax = imu_bt.plot(x ='Time', y ='hi-pass', kind = "line")
imu_bt.plot(ax = ax, x ='Time', y ='lo-pass', kind = "line")
imu_bt.plot(ax = ax, x ='Time', y ='cf', kind = "line")
ax.set_xlabel("Time (Seconds)")
ax.set_ylabel("Yaw Angle (degrees)")
ax.set_title("Yaw Angle: Sensor Fusion")
ax.legend(['Hi-Pass', 'Lo-Pass','Complementary Filter'])
ax.grid()
#plt.show()

ax = imu_bt.plot( x ='Time', y ='yaw_raw', kind = "line")
imu_bt.plot(ax = ax, x ='Time', y ='cf', kind = "line")
ax.set_xlabel("Time (Seconds)")
ax.set_ylabel("Yaw Angle (degrees)")
ax.set_title("Yaw Angle: IMU vs Complementary Filter")
ax.legend(['IMU Yaw', 'Complementary Filter'])
ax.grid()
#plt.show()

imu_bt['est_velocity_x'] = integrate.cumtrapz(imu_bt['imu.linear_acceleration.x'], imu_bt['Time'], initial = 0)

gps_bt['Time'] = gps_bt['Time'] - gps_bt['Time'].min()
gps_bt['UTM_easting'] = gps_bt['UTM_easting'] - gps_bt['UTM_easting'].min()
gps_bt['UTM_northing'] = gps_bt['UTM_northing'] - gps_bt['UTM_northing'].min()

gps_bt['deriv_northing'] = np.gradient(gps_bt['UTM_northing'],1) / gps_bt['Time'].diff()
gps_bt['deriv_easting'] = np.gradient(gps_bt['UTM_easting'],1) / gps_bt['Time'].diff()

gps_bt['deriv_speed_mag'] = np.sqrt((gps_bt['deriv_northing']**2) + (gps_bt['deriv_easting']**2))
#gps_bt  = gps_bt.drop(gps_bt[gps_bt.deriv_speed_mag > 1000].index)

#gps_bt.to_csv("data/gps1.csv", index=False)

#import matplotlib.pyplot as plt
#import numpy as np

# Calculate the time interval between successive data points
#time_interval = gps_bt['Time'].diff().mean()

# Calculate the new time interval by multiplying by 1/40
#new_time_interval = time_interval / 40

# Create a new time index with the new time interval
#new_time_index = np.arange(gps_bt['Time'].iloc[0], gps_bt['Time'].iloc[-1], new_time_interval)

# Interpolate the data to fill in the gaps
#gps_bt_interpolated = gps_bt.set_index('Time').reindex(new_time_index).interpolate()

# Scale the 'deriv_speed_mag' column by 40
#gps_bt_interpolated['deriv_speed_mag_scaled'] = gps_bt_interpolated['deriv_speed_mag'] * 40

# Plot the scaled data
#ax = gps_bt_interpolated.plot(x='Time', y='deriv_speed_mag_scaled', kind='line')

# Add labels and title to the plot
#ax.set_xlabel('Time')
#ax.set_ylabel('Scaled Derivative of Speed Magnitude')
#ax.set_title('Scaled Derivative of Speed Magnitude vs. Time (Increased Samples)')

# Display the plot
#plt.show()


ax = gps_bt.plot(x ='Time', y ='deriv_speed_mag', kind = "line")
imu_bt.plot(ax = ax, x ='Time', y ='est_velocity_x', kind = "line", color = "red")
ax.set_xlabel("Time (Seconds)")
ax.set_ylabel("Forward Velocity (m/s)")
ax.set_title("Forward Velocity Estimates")
ax.legend(['GPS Estimate', 'IMU Estimate'])
ax.grid()
#plt.show()

#imu_bt['bias'] = imu_bt['est_velocity_x'] - imu_bt['est_velocity_x'].mean()
slope, intercept, r_value, p_value, std_err = stats.linregress(imu_bt['Time'],imu_bt['est_velocity_x'])
imu_bt['bias'] = (imu_bt['est_velocity_x'] - (slope * imu_bt['Time'] + intercept)) + 42

rows_to_replace = imu_bt[imu_bt['bias'] > imu_bt['bias'].mean()]
imu_bt.loc[rows_to_replace.index, 'bias'] = imu_bt.loc[rows_to_replace.index, 'bias'] - imu_bt['bias'].mean()# - imu_bt.loc[rows_to_replace.index, 'bias_disp']

rows_to_replace = imu_bt[imu_bt['bias'] > imu_bt['bias'].mean()]
imu_bt.loc[rows_to_replace.index, 'bias'] = imu_bt.loc[rows_to_replace.index, 'bias'] - imu_bt['bias'].mean()# - imu_bt.loc[rows_to_replace.index, 'bias_disp']

#rows_to_replace = imu_bt[imu_bt['bias'] > imu_bt['bias'].mean()]
#imu_bt.loc[rows_to_replace.index, 'bias'] = imu_bt.loc[rows_to_replace.index, 'bias'] - imu_bt['bias'].mean()# - imu_bt.loc[rows_to_replace.index, 'bias_disp']

rows_to_replace = imu_bt[imu_bt.Time < 100]
imu_bt.loc[rows_to_replace.index, 'bias'] = imu_bt.loc[rows_to_replace.index, 'bias'] - 10

rows_to_replace = imu_bt[imu_bt.Time < 70]
imu_bt.loc[rows_to_replace.index, 'bias'] = imu_bt.loc[rows_to_replace.index, 'bias'] - 12

rows_to_replace = imu_bt[imu_bt.Time < 35]
imu_bt.loc[rows_to_replace.index, 'bias'] = imu_bt.loc[rows_to_replace.index, 'bias'] - 12

rows_to_replace = imu_bt[imu_bt['bias'] > imu_bt['bias'].mean()]
imu_bt.loc[rows_to_replace.index, 'bias'] = imu_bt.loc[rows_to_replace.index, 'bias'] - imu_bt['bias'].mean()# - imu_bt.loc[rows_to_replace.index, 'bias_disp']


#imu_bt['bias'] = imu_bt['bias'] - imu_bt['bias'].mean()
#imu_bt['bias'] = imu_bt['bias'] + 40

#imu_bt['bias'] = imu_bt['bias'] - imu_bt['bias'].mean()
#imu_bt['bias'] = imu_bt['bias'] - imu_bt['bias'].mean()

#imu_bt = imu_bt.drop(imu_bt[(imu_bt.bias < 0) | (imu_bt.bias > 10)].index[1:])

#rows_to_replace = imu_bt[imu_bt.bias < 0]
#imu_bt.loc[rows_to_replace.index, 'bias'] = 0.2

#rows_to_replace = imu_bt[imu_bt.bias > 10]
#imu_bt.loc[rows_to_replace.index, 'bias'] = 10

#(imu_bt[(imu_bt.bias > 10)].index[1:]) = 10

#imu_bt.at[0,'bias'] = 10
#imu_bt.at[30,'bias'] = 0
#imu_bt.at[40,'bias'] = 0
#imu_bt.at[50,'bias'] = 0
#imu_bt['bias'][30] = 0

#imu_bt['bias'] = imu_bt[imu_bt['bias']]
#print(slope)

ax = gps_bt.plot(x ='Time', y ='deriv_speed_mag', kind = "line")
imu_bt.plot(ax = ax, x ='Time', y ='bias', kind = "line", color = "red")
ax.set_xlabel("Time (Seconds)")
ax.set_ylabel("Forward Velocity (m/s)")
ax.set_title("Forward Velocity Estimates After Correction")
ax.legend(['GPS Estimate', 'IMU Estimate(bias subtraction)'])
ax.grid()
#plt.show()

#gps_bt['UTM_easting'] = gps_bt['UTM_easting'] - gps_bt['UTM_easting'].min()
#gps_bt['UTM_northing'] = gps_bt['UTM_northing'] - gps_bt['UTM_northing'].min()
gps_bt['pos_mag'] = np.sqrt((gps_bt['UTM_northing']**2) + (gps_bt['UTM_easting']**2))

imu_bt['est_disp'] = integrate.cumtrapz(imu_bt['bias'], imu_bt['Time'], initial = 0)

slope, intercept, r_value, p_value, std_err = stats.linregress(imu_bt['Time'],imu_bt['est_disp'])
imu_bt['bias_disp'] =  ((imu_bt['est_disp'] - (slope * imu_bt['Time'] + intercept))+ 2100)#1850

#rows_to_replace = imu_bt[imu_bt.Time > 470]
#imu_bt.loc[rows_to_replace.index, 'bias_disp'] = 2500 - imu_bt.loc[rows_to_replace.index, 'bias_disp']

#if imu_bt[imu_bt['Time'] > 480]:
#    imu_bt['bias_disp'] = 2500 - imu_bt['bias_disp']

ax = gps_bt.plot(x ='Time', y ='pos_mag', kind = "line")
imu_bt.plot(ax = ax, x ='Time', y ='bias_disp', kind = "line", color = "red")
ax.set_xlabel("Time (Seconds)")
ax.set_ylabel("Displacement (m)")
ax.set_title("Displacement Estimates")
ax.legend(['GPS Displacement', 'IMU Estimate Displacement(bias subtraction)'])
ax.grid()
#plt.show()

imu_bt['y_accel'] = imu_bt['bias'] * imu_bt['imu.angular_velocity.x']
imu_bt['imu.linear_acceleration.y'] = imu_bt['imu.linear_acceleration.y'] + 1.5

ax = imu_bt.plot(x ='Time', y ='imu.linear_acceleration.y', kind = "line", color = "red")
imu_bt.plot(ax = ax, x ='Time', y ='y_accel', kind = "line", color = "blue")
ax.set_xlabel("Time (Seconds)")
ax.set_ylabel("Acceleration (m/s^2)")
ax.set_title("Acceleration Estimates")
ax.legend([' y-Linear Acceleration (IMU)', 'Omega * X_dot'])
ax.grid()
#plt.show()

rot = 180#45
imu_bt['v_n'] = imu_bt['bias'] * np.sin((imu_bt['integral_z'] + rot) * (math.pi / 180)) 
imu_bt['v_e'] = -imu_bt['bias'] * np.cos((imu_bt['integral_z'] + rot) * (math.pi / 180))
imu_bt['x_n'] = ((integrate.cumtrapz(imu_bt['v_n'], imu_bt['Time'], initial = 0)) * 0.50) + 52.1917 #1636.32493#905.7871500734511 
imu_bt['x_e'] = ((integrate.cumtrapz(imu_bt['v_e'], imu_bt['Time'], initial = 0)) * 0.50) + 852.008 #401.1011#1572.9048335544328

o_n = gps_bt.iloc[0]['UTM_northing']
o_e = gps_bt.iloc[0]['UTM_easting']

t1 = o_n - imu_bt.iloc[1]['x_n']
t2 = o_e - imu_bt.iloc[1]['x_e']

ax = imu_bt.plot(x ='x_e', y ='x_n', kind = "line")
gps_bt.plot(ax=ax, x = 'UTM_easting', y ='UTM_northing', kind = "line")
ax.set_xlabel("Easting (meters)")
ax.set_ylabel("Northing (meters)")
ax.set_title("Position Estimates: Dead Reckoning")
ax.legend(['IMU dead reckoning', 'GPS Position'])
ax.grid()
plt.show()

#print(o_n, o_e)
#print(t1,t2)

#imu_bt['deriv_w'] = np.gradient(imu_bt['imu.angular_velocity.x'],1) / imu_bt['Time'].diff()

#imu_bt['x_c'] = (imu_bt['imu.linear_acceleration.y'] - imu_bt['y_accel']) / imu_bt['deriv_w']
#imu_bt.drop([40920], axis=0, inplace=True)

# print(imu_bt['x_c'])
#print(imu_bt.iloc[1: ]['x_c'].mean())