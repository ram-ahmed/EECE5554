import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.spatial.transform import Rotation as R

#Load the data
data = pd.read_csv('stationary_data.csv')

Time = data.iloc[:, 0].values

qx = data.iloc[:, 9].values
qy = data.iloc[:, 10].values
qz = data.iloc[:, 11].values
qw = data.iloc[:, 12].values

#Angular velocities
gyro_x = data.iloc[:, 14].values
gyro_y = data.iloc[:, 15].values
gyro_z = data.iloc[:, 16].values

plt.plot(Time, gyro_x, 'r', Time, gyro_y, 'g', Time, gyro_z, 'b')
plt.xlabel('Time in second')
plt.ylabel('Angular_velocity in (rad/sec)')
plt.title('Plot of gyro x, y, z vs Time')
plt.legend(['gyro_x', 'gyro_y', 'gyro_z'])
plt.show()
mean_gyro_x = np.mean(gyro_x)
median_gyro_x = np.median(gyro_x)
mean_gyro_y= np.mean(gyro_y)
median_gyro_y = np.median(gyro_y)
mean_gyro_z = np.mean(gyro_z)
median_gyro_z = np.median(gyro_z)


#Linear accelerations

acc_x = data.iloc[:, 18].values
acc_y = data.iloc[:, 19].values
acc_z = data.iloc[:, 20].values

plt.plot(Time, acc_x, 'r', Time, acc_y, 'g', Time, acc_z, 'b')
plt.xlabel('Time in second')
plt.ylabel('Linear_acceleration in (m/s^2)')
plt.title('Plot of Acceleration x, y, z vs Time')
plt.legend(['acc_x', 'acc_y', 'acc_z'])
plt.show()

#histogram plot os acc_x
plt.figure()
plt.hist(acc_x)
plt.xlabel('Acceleration(x) in (m/s^2)')
plt.ylabel('Frequency in Hz')
plt.title('Histogram plot of VectorNav Linear_acceleration(x)')
plt.show()

mean_acc_x = np.mean(acc_x)
median_acc_x = np.median(acc_x)
std_dev_acc_x = np.std(acc_x)
print(mean_acc_x)
print(median_acc_x)
print(std_dev_acc_x)
mean_acc_y = np.mean(acc_y)
median_acc_y = np.median(acc_y)
mean_acc_z = np.mean(acc_z)
median_acc_z = np.median(acc_z)

#Euler angles

qt = np.column_stack((qw, qx, qy, qz))
r = R.from_quat(qt)
eulXYZ = r.as_euler('XYZ')
eulXYZ = np.rad2deg(eulXYZ)

plt.plot(Time, eulXYZ[:, 0], 'r', Time, eulXYZ[:, 1], 'g', Time, eulXYZ[:, 2], 'b')
plt.xlabel('Time in second')
plt.ylabel('Angle in degree')
plt.title('Plot of angle x, y, z vs Time')
plt.legend(['Roll_x', 'Pitch_y', 'Yaw_z'])
plt.show()

mean_angle_x = np.mean(eulXYZ[:, 0])
median_angle_x = np.median(eulXYZ[:, 0])
mean_angle_y = np.mean(eulXYZ[:, 1])
median_angle_y = np.median(eulXYZ[:, 1])
mean_angle_z = np.mean(eulXYZ[:, 2])
median_angle_z = np.median(eulXYZ[:, 2])

