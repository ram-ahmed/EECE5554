import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import math
import statistics as st

def distance(lat1, lon1, lat2, lon2):
    # convert decimal degrees to radians 
    lat1, lon1, lat2, lon2 = map(math.radians, [lat1, lon1, lat2, lon2])

    # haversine formula 
    dlat = lat2 - lat1 
    dlon = lon2 - lon1 
    a = math.sin(dlat/2)**2 + math.cos(lat1) * math.cos(lat2) * math.sin(dlon/2)**2
    c = 2 * math.asin(math.sqrt(a)) 
    r = 6371 # Radius of earth in kilometers.
    return c * r


# Load the data from a LibreOffice spreadsheet into a pandas DataFrame
df = pd.read_csv('Straight_Line_Walking.csv')

# Subtract the first value from each column to scale the data with your stationary data sets
easting = df['UTM_easting'] = df['UTM_easting'] - df['UTM_easting'][0]
northing = df['UTM_northing'] = df['UTM_northing'] - df['UTM_northing'][0]
altitude = df['Altitude']
time = df['Time']
latitude = df['Latitude']
longitude = df['Longitude']

# Plotting the scatterplot of northing vs easting data
plt.scatter(easting, northing)
plt.xlabel('Easting in metres')
plt.ylabel('Northing in metres')
plt.title('Scatterplot of walking straight line Northing vs Easting Data')
plt.show()

# Plotting the scatterplot of Altitude vs Time data
plt.scatter(time, altitude)
plt.xlabel('Time in secs')
plt.ylabel('Altitude in metres')
plt.title('Scatterplot of walking straight line Altitude vs Time Data')
plt.show()

# Error calculations
k_lat_start = 42.202202
k_lat_end = 42.203218

k_lon_start = -71.052027
k_lon_end = -71.050547

k_lats = []
k_lons = []

lat_interval = (k_lat_end - k_lat_start) / 273
lon_interval = (k_lon_end - k_lon_start) / 273

for i in range(0,273):
    k_lats.append(k_lat_start + (i * lat_interval))
    k_lons.append(k_lon_start + (i * lon_interval))

error = []
for i in range(0,273):
    error.append(distance(latitude[i], longitude[i], k_lats[i], k_lons[i]))

# Error histogram plot
plt.hist(error, bins=20)
plt.xlabel('Error in kms')
plt.ylabel('Frequency (No. of instances')
plt.title('Error of Walking Straight line data. Frequency vs Error data')
plt.show()

# Error vs Time plot
plt.scatter(time,error)
plt.xlabel('Time in secs')
plt.ylabel('Error in kms')
plt.title('Error vs Time plot for walking straight line data')
plt.show()
plt.figure().set_figheight(0.015)
plt.show()

mean = st.mean(error)
median = st.median(error)
print(mean)
print(median)