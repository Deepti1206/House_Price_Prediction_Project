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
- [Business Understanding](#business-understanding)
- [Background](#background)
- [Dataset Overview](#dataset-overview)
- [Methodology](#methodology)
- [Data Cleaning](#data-cleaning)
- [Feature Engineering](#feature-engineering)
- [Training Model](#training-model)
- [Prediction and Model Comparison](#prediction-and-model-comparison)
- [Conclusion](#conclusion)
- [References](#references)
- [File Directory](#file_directory)

## Project Objective

- The objective of this project is to predict the **final price** of the house using **machine learning models** based on relevant features.

## Business Understanding

1. In the dynamic real estate market, the significance of **accurate house price predictions** is increasing significantly, as they have the potential to empower homeowners, buyers, and real estate professionals by providing valuable insights into property values and facilitating informed decision-making.

2. As a result, the **real estate industry faces the crucial task of determining the appropriate pricing for houses** before listing them on the market. This is achieved through a comprehensive analysis of various property attributes such as location, size, amenities, condition, market trends, and more.

## Background

- This project is entirely based on the **House Prices - Advanced Regression Techniques** Kaggle Competition. With a dataset comprising **81 variables** and **1,460 observations**, it covers nearly every aspect of residential homes in Ames, Iowa. 
- You can access the dataset by following this link: [House Prices - Advanced Regression Techniques Dataset](https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/data)

## Dataset Overview

- There are two dataset given, test data and train data. Usually, a model is trained on train data and then is tested on test data (hence the names). 
- The dataset consists of 81 variables and 1,460 observations describing various parameters of residential homes in Ames, Iowa. There are 43 variables that has character or text data type and 38 variiables that has interger or numeric data type.
- The target variable that I want to predict is the Sales Price.

## Methodology
This project followed these steps:
1. **Data Quality and Cleaning:** Exploratory data analysis was conducted to check data quality and data cleaning was performed.
2. **Feature Engineering:** Feature engineering to enhance our model's performance.
3. **Training Model:** 4 machine learning models were used.
4. **Prediction and Model Comparison:** Compared model performances using metrics like MSE, MAE, and RMSE.

## Data Cleaning
Missing values were handles in two ways, first, by **dropping** the variables having more than 40% missing data and, second by **imputing** the missing data with the measures like mean, median or mode. There were 19 variables having missing values, out of which 5 columns that have more than 40% missing values were dropped. The other variables were imputed. The variables that had skewness in their distribution were imputed with median. The categorical variables were imputed with mode. There were some variables whose values were associated with other variables and who had only two categories that were highly skewed. Such variables were dropped.

<img src="https://github.com/Deepti1206/House_Price_Prediction_Project/raw/main/Visuals/Screenshot%202023-10-05%20at%2011.29.37%20PM.png" width="600" height="400">

## Feature Engineering
Feature engineering is done to improve the data quality and model performance. Variables were assessed differently depending on their data type. Following steps were performed for feature engineering:
- It was observed that the variable **YrSold** has no effect on Sales Price and hence it was dropped.
- Ordinal values were assinged to certain categorical variables to reduce dimensionality.

## Training Model

Before training model, it is important to check the linearity assumption by plotting a histogram of our target variable sale price. The left graph given below is the distribution of the **Sales Price** and we can see that the sale price distribution is rightly skewed which means that the assumption of linearity may not be true here. In order to mitigate this, I took the natural log of the sale price and check the distribution. On the right it be can seen that the log distribution looks normally distributed, hence I shall be training this model using the Log of the target variable. 

<img src="https://github.com/Deepti1206/House_Price_Prediction_Project/blob/main/Visuals/000004.png" width="600" height="400">

I employed Multiple Linear Regression (with Cross Validation), Ridge Linear Regression (with Cross Validation), Lasso Linear Regression (with Cross Validation), and Random Forest regression models.

1. Multiple Linear Regression (with Cross Validation)

In multiple linear regression, the output of the data is interpreted using the diagnostics plot:
-Residual v/s fitted graph doesn't show any pattern in the graph, which means that there is no non-linear relationship between the predictor and outcome variables 
- Normal Q-Q:The residuals are normally distributed. The points forming but there are few outliers at the lower side
- Scale-Location: This graphs checks the assumption of homoscedasticity and as seen the residuals are scattered randomly which satisfies assumption
- Residual vs Leverage: This graphs help us to identify the influential outliers that might affect the analysis and here outside Cook's distance (red dotted) we find two outliers.

[`MLR_Output`](https://github.com/Deepti1206/House_Price_Prediction_Project/blob/main/MLR_Output_Summary.pdf)

<img src="https://github.com/Deepti1206/House_Price_Prediction_Project/blob/main/Visuals/Screenshot%202023-10-05%20at%2010.58.55%20PM.png" width="900" height="80">
   
2. Ridge Linear Regression (with Cross Validation)

In Ridge linear regression, it penalize using Lamda on the co-efficient, if lamda is increasing, the co-efficients tends towards zero. We find the best lamda, which gives us the important variables for our model. So here, the best lamda is 0.25 and it provides the top 30 important variables as Condition2PosN, Condition2PosA, FunctionalSev, FunctionalMaj2, RoofMatWdshngl, ExtFirstBrkComm and so on.

<img src="https://github.com/Deepti1206/House_Price_Prediction_Project/blob/main/Visuals/Screenshot%202023-10-05%20at%2011.01.26%20PM.png" width="600" height="400">

3. Lasso Linear Regression (with Cross Validation)

In lasso regression, the lamda shrinks coefficient completely to zero and removes the unnecessary predictors. So here, the best lamda is very small 0.05 and it provides the top 30 important variables as . The topmost variables are OverallQual, GarageCars, KitchenQual, MSZoningRM and BsmtQual

<img src="https://github.com/Deepti1206/House_Price_Prediction_Project/blob/main/Visuals/Screenshot%202023-10-05%20at%2011.16.13%20PM.png" width="600" height="400">

4. Random Forest regression

In random forest, Mean of squared residuals: 0.01841201 means the prediction error. 88.45% variance is explained by the variables. In the first plot, the higher the increase in MSE, the important is the variable. we see that GrLivArea, Neighborhood, TotalBsmiSF and so on are most important. In second, node purity is depended on the Gini Index and here the important variables are Overall Qual, Neighborhood, GrLivArea etc.

<img src="https://github.com/Deepti1206/House_Price_Prediction_Project/blob/main/Visuals/Screenshot%202023-10-05%20at%2011.18.49%20PM.png" width="600" height="300">

## Prediction and Model Comparison
We applied the trained models to the test dataset and evaluated their performance using RMSE. The model who has the lowest RMSE is the best from the other in predicting the target variable. In this terms, Lasso regression yielded the lowest RMSE, making it the best choice for predicting house prices.

<img src="https://github.com/Deepti1206/House_Price_Prediction_Project/blob/main/Visuals/Screenshot%202023-10-05%20at%2011.53.35%20PM.png" width="600" height="150">

## Conclusion
As per the analysis on the test data, it is seen that Root Mean Square error of Lasso regression is lowest and hence we select the **Lasso Regression** the best fit for our prediction of sale price.The topmost variables are **OverallQual, GarageCars, KitchenQual, MSZoningRM and BsmtQual.**

## References

- Kaggle House Price Prediction Competition: [Link](https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/overview)
- R Documentation: [Link](https://www.rdocumentation.org/)
- Output Summary: [GitHub Repository](https://github.com/Deepti1206/House_Price_Prediction_Project)

## File Directory

- Data
- Codes

