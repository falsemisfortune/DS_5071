# Data Preprocessing

## Overview
This project analyzes bird species observations in Washington State, specifically focusing on two locations:  
- **Mount Rainier (Route 61)** – A mountainous habitat  
- **Bay View (Route 66)** – A waterfront habitat  

The analysis incorporates bird species data, weather conditions, and observation trends over the years to examine how bird populations, particularly **Sooty Grouse** and **Wilson's Warbler**, correlate with environmental factors.

---

## Data Sources
The project utilizes four datasets:  
1. **Routes.csv** – Contains route information, including location identifiers.  
2. **SpeciesList.csv** – Lists bird species and their corresponding identifiers.  
3. **Washing.csv** – Contains bird observation data for different routes.  
4. **Weather.csv** – Includes weather conditions recorded at observation sites.  

---

## Key Analysis Steps
1. **Data Filtering**  
   - Extract Washington State data (`StateNum == 89`).  
   - Focus on **Mount Rainier (Route 61)** and **Bay View (Route 66)** for species observations.  

2. **Data Merging**  
   - Join **species data** with **observations** based on species identifiers (`AOU`).  
   - Merge **weather data** with observations to associate species counts with temperature trends.  

3. **Species-Specific Analysis**  
   - Extract records for **Sooty Grouse** and **Wilson’s Warbler** at Mount Rainier.  
   - Compute the **average temperature** for each observation.  

4. **Visualization**  
   - **Bar Plots:** Show total observed counts for each species over the years.  
   - **Line Plots:** Display average temperature trends over the years.  
