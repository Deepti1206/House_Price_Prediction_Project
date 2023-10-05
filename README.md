# House Price Prediction Project
</div>

<h3 align="center" style="font-size: 35px; color: #800080; font-family: Georgia;">
    <span style="color: #008080;"> Author:</span> 
    <span style="color: black;">Deepti Vijay Khandagale</span>
</h3>
<p align="center">
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

- The primary aim of this project is to **train a Machine Learning Model** capable of predicting the **House Sale Price** based on relevant features.

## Project Overview

- This project is entirely based on the **House Prices - Advanced Regression Techniques** Kaggle Competition.

- With a dataset comprising **79 explanatory variables**, covering nearly every aspect of residential homes in Ames, Iowa.

- You can access the dataset by following this link: [House Prices - Advanced Regression Techniques Dataset](https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/data)

## Business Understanding

1. In the dynamic real estate market, the significance of **accurate house price predictions** is increasing significantly, as they have the potential to empower homeowners, buyers, and real estate professionals by providing valuable insights into property values and facilitating informed decision-making.

2. As a result, the **real estate industry faces the crucial task of determining the appropriate pricing for houses** before listing them on the market. This is achieved through a comprehensive analysis of various property attributes such as location, size, amenities, condition, market trends, and more.

3. If you want to know more business uses of this project you can go through this project and discover its importance in real-world scenarios.

## Background

## Dataset Overview
The dataset consists of 81 variables and 1,460 observations describing various parameters of residential homes in Ames, Iowa. We aim to fit a linear model to predict the final house price using the training dataset.

## Methodology
Our project followed these steps:
1. **Data Quality and Cleaning:** We conducted exploratory data analysis to check data quality and performed data cleaning.
2. **Feature Engineering:** We worked on feature engineering to enhance our model's performance.
3. **Training Model:** We trained various linear regression models and conducted model diagnostics.
4. **Prediction and Model Comparison:** We compared model performances using metrics like MSE, MAE, and RMSE.

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

