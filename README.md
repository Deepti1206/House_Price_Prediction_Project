# House Price Prediction Project
</div>

<h3 align="right-aligned" style="font-size: 35px; color: #800080; font-family: Georgia;">
    <span style="color: #008080;"> Author:</span> 
    <span style="color: black;">Deepti Vijay Khandagale</span>
</h3>
<p align="right-aligned">
  <img src="https://github.com/Deepti1206/House_Price_Prediction_Project/blob/main/Visuals/1400935880311.jpeg" width="600" height="400">
</p>

## Table of Contents
- [Project Objective](#project-objective)
- [Background](#background)
- [Dataset Overview](#dataset-overview)
- [Methodology](#methodology)
- [Data Cleaning](#data-cleaning)
- [Feature Engineering](#feature-engineering)
- [Training Model](#training-model)
- [Prediction and Model Comparison](#prediction-and-model-comparison)
- [Conclusion](#conclusion)
- [References](#references)

## Project Objective

- The objective of this project is to predict the **final price** of the house using **machine learning models** based on relevant features.

## Background

- This project is entirely based on the **House Prices - Advanced Regression Techniques** Kaggle Competition.

- With a dataset comprising **81 variables** and **1,460 observations**, covering nearly every aspect of residential homes in Ames, Iowa.

- You can access the dataset by following this link: [House Prices - Advanced Regression Techniques Dataset](https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/data)

## Business Understanding

1. In the dynamic real estate market, the significance of **accurate house price predictions** is increasing significantly, as they have the potential to empower homeowners, buyers, and real estate professionals by providing valuable insights into property values and facilitating informed decision-making.

2. As a result, the **real estate industry faces the crucial task of determining the appropriate pricing for houses** before listing them on the market. This is achieved through a comprehensive analysis of various property attributes such as location, size, amenities, condition, market trends, and more.

## Background

## Dataset Overview
The dataset consists of 81 variables and 1,460 observations describing various parameters of residential homes in Ames, Iowa. datatype-------

## Methodology
This project followed these steps:
1. **Data Quality and Cleaning:** Exploratory data analysis was conducted to check data quality and data cleaning was performed.
2. **Feature Engineering:** Feature engineering to enhance our model's performance.
3. **Training Model:** 4 machine learning models were used.
4. **Prediction and Model Comparison:** Compared model performances using metrics like MSE, MAE, and RMSE.

## Data Cleaning
We handled missing values and imputed data accordingly. Columns with more than 40% missing data were dropped. Numerical values were replaced with medians, and categorical values were replaced with modes.

## Feature Engineering
We categorized and engineered features based on their types, including year of construction, basement, garage, exterior, construction, appliance, miscellaneous, and sale price. We assigned ordinal values to certain categorical variables to reduce dimensionality.

## Training Model
We employed multiple linear regression, ridge regression, lasso regression, and random forest regression models. Model parameters were tuned using cross-validation.

## Prediction and Model Comparison
We applied the trained models to the test dataset and evaluated their performance using RMSE. Lasso regression yielded the lowest RMSE, making it our choice for predicting house prices.

## Conclusion
Based on our analysis, Lasso Regression is the preferred model for predicting house prices. The topmost variables affecting price include OverallQual, GarageCars, KitchenQual, MSZoningRM, and BsmtQual.

## References
- Kaggle House Price Prediction Competition: [Link](https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/overview)
- James, G., Witten, D., Hastie, T., & Tibshirani, R. (2013). "An Introduction to Statistical Learning: With Applications in R."
- R Documentation: [Link](https://www.rdocumentation.org/)
- Output Summary: [GitHub Repository](https://github.com/Deepti1206/House_Price_Prediction_Project)

