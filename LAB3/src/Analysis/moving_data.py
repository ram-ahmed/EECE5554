import pandas as pd
import matplotlib.pyplot as plt
   
data = pd.read_csv('moving_data.csv')
Time = data.iloc[:, 0].values
acc_x = data.iloc[:, 18].values
acc_y = data.iloc[:, 19].values
acc_z = data.iloc[:, 20].values

plt.figure()
plt.plot(Time, acc_x)
plt.xlabel('Time in second')
plt.ylabel('Linear_acceleration in (m/s^2)')
plt.title('Plot of VectorNav Linear_acceleration(x) vs Time')

plt.figure()
plt.plot(Time, acc_y)
plt.xlabel('Time in second')
plt.ylabel('Linear_acceleration in (m/s^2)')
plt.title('Plot of VectorNav Linear_acceleration(y) vs Time')

plt.figure()
plt.plot(Time, acc_z)
plt.xlabel('Time in second')
plt.ylabel('Linear_acceleration in (m/s^2)')
plt.title('Plot of VectorNav Linear_acceleration(z) vs Time')

plt.show()
