# Climate Change's Impact on the Sooty Grouse and Wilson's Warbler

## Overview
This project investigates the relationship between bird populations and climate change in Washington State, focusing on two species: **Sooty Grouse** and **Wilson's Warbler**. By analyzing long-term bird observation data alongside climate metrics, we aim to understand how environmental changes impact bird populations. Our findings aim to provide valuable insights for conservation and sustainability efforts.

## Data Sources
We utilize data from two primary sources:

### 1. **North American Breeding Bird Survey (BBS)**
A large-scale, long-term avian monitoring program that tracks the status and trends of North American bird populations. The following datasets are used:
- **Washing.csv**: Contains bird observation data, including route information and yearly species counts.
- **Species.csv**: Lists bird species and their corresponding identifiers.
- **Routes.csv**: Provides details about observation routes, including location data.
- **Weather.csv**: Contains recorded weather conditions during bird surveys.

### 2. **National Centers for Environmental Information (NOAA)**
NOAA provides comprehensive climate datasets. We use historical climate data from Washington State to analyze temperature and precipitation trends in key bird habitats:
- **Longmire_Rainier_Weather_Monthly.csv**: Contains climate data for Mount Rainier.
- **Ranger_Station_Rainier_Weather_Monthly.csv**: Includes monthly temperature and precipitation records.

## Data Preprocessing
### **Bird Population Data**
1. Extract data specific to Washington State.
2. Merge species, route, and observation datasets using species identifiers (`AOU`).
3. Filter data to focus on **Mount Rainier (Route 61)** and **Bay View (Route 66)**.
4. Select relevant columns (e.g., year, species name, total counts, temperature).

### **Climate Change Data**
1. Extract temperature and precipitation data from NOAA records.
2. Focus on key climate change indicators (e.g., average, minimum, and maximum temperature).
3. Merge climate data with bird population data based on location and year.

## Exploratory Data Analysis (EDA)
We analyze trends in bird populations and climate data using visualization techniques:
- **Bar Graphs**: Show total observed counts of Sooty Grouse and Wilson's Warbler over time.
- **Line Plots**: Illustrate temperature trends and their correlation with bird population changes.

## Modeling & Prediction
We employ statistical modeling techniques to quantify relationships between bird populations and climate change factors:

### **Simple Linear Regression**
- Predicts bird population counts using climate variables.
- Iteratively refines the model by removing non-significant predictors.
- Uses log transformations and interaction terms to improve predictive power.

### **Model Evaluation**
- Due to limited data points (1991–2021), we use **Leave-One-Out Cross-Validation (LOOCV)** to ensure model robustness.
- Improved models show significantly lower mean squared error, indicating better generalization.

### **Ridge & Lasso Regression**
- Implements shrinkage models to handle multicollinearity and improve prediction accuracy.

## Key Findings
- **Wilson’s Warbler:** Population trends suggest a direct correlation with temperature shifts.
- **Sooty Grouse:** Observations show a similar relationship, with declining counts during colder years.
- **Temperature & Bird Populations:** Warmer periods appear to support increased sightings of both species, though further analysis is required to establish causation.

## Technologies Used
- **Data Processing:** Python (Pandas, NumPy, Jupyter Notebooks)
- **Visualization:** Matplotlib, Seaborn
- **Statistical Modeling:** Scikit-learn, Statsmodels

## Future Work
- Incorporate additional climate variables (e.g., snowmelt, wind patterns) for deeper insights.
- Apply machine learning models to enhance predictive accuracy.
- Expand analysis to other bird species at risk due to climate change.


