import matplotlib.pyplot as plt
import pandas as pd
import math
import statistics

# Read the data from a LibreOffice spreadsheet
df = pd.read_csv('occluded_stationary.csv')

# Subtract the first value from each column to scale
df['UTM_northing'] = df['UTM_northing'] 
df['UTM_easting'] = df['UTM_easting'] 
df['Altitude'] = df['Altitude']
df['Time'] = df['Time'] 

# Set the known latitude and longitude
known_lat = 42.3081779479981
known_lon = -71.1059036254883
error = []
for i in range(542):
    latm = df["Latitude"]
    lonm = df["Longitude"]
    earth_radius = 6371000 # meter
    lat = math.radians(known_lat - latm[i])
    lon = math.radians(known_lon - lonm[i])
    a = math.sin(lat/2) **2 + math.cos(math.radians(known_lat)) * math.cos(math.radians(latm[i])) * math.sin(lon/2) **2
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a))
    error.append(earth_radius * c)

# calculate mean and median of error
standard_dev = statistics.stdev(error)
mean = statistics.mean(error)
median = statistics.median(error)
print("The mean of the numbers is:", mean)
print("The median of the numbers is:", median)
print("The standard deviations of the numbers is:", standard_dev)


# Create a scatterplot of the Northing vs. Easting data
plt.scatter(df['UTM_easting'], df['UTM_northing'])
plt.xlabel('Easting in meter')
plt.ylabel('Northing in meter')
plt.title('Scatterplot of occluded stationary Northing vs. Easting')
plt.grid(True, linewidth=0.5, alpha=0.5)
plt.show()

# Create a scatterplot of the Altitude vs Time data
plt.scatter(df['Time'], df['Altitude'])
plt.xlabel('Time in second')
plt.ylabel('Altitude in meter')
plt.title('Scatterplot of occluded stationary Altitude vs Time')
plt.grid(True, linewidth=0.5, alpha=0.5)
plt.show()

# Plot a histogram of the error
plt.hist(error, bins=15)
plt.xlabel("Error in meter")
plt.ylabel("Frequency ")
plt.title("Histogram Error of Occluded Stationary Data")
plt.grid(True, linewidth=0.5, alpha=0.5)
plt.show()