import matplotlib.pyplot as plt
import pandas as pd


# Read the data from a LibreOffice spreadsheet
df = pd.read_csv('occluded_walking.csv')

# Subtract the first value from each column to scale
df['UTM_northing'] = df['UTM_northing'] 
df['UTM_easting'] = df['UTM_easting'] 
df['Altitude'] = df['Altitude']
df['Time'] = df['Time'] 

# Create a scatterplot of the Northing vs. Easting data
plt.scatter(df['UTM_easting'], df['UTM_northing'])
plt.xlabel('Easting in meter')
plt.ylabel('Northing in meter')
plt.title('Scatterplot of occluded walking Northing vs. Easting')
plt.grid(True, linewidth=0.5, alpha=0.5)
plt.show()

# Create a scatterplot of the Altitude vs Time data
plt.scatter(df['Time'], df['Altitude'])
plt.xlabel('Time in second')
plt.ylabel('Altitude in meter')
plt.title('Scatterplot of occluded walking Altitude vs Time')
plt.grid(True, linewidth=0.5, alpha=0.5)
plt.show()

