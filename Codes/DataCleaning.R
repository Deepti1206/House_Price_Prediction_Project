### This script is for the Data Cleaning and Feature engineering. 

#Libraries
library(dplyr)
library(psych)
library(Hmisc)
library(ggplot2)
library(mice)
library(VIM)
library(missForest)
library(comprehenr)
#############################################################################

## Function 1 : Find out Columns to drop based on missing values percentage 
missing_values <- function(df, threshold , reverse = TRUE) {
  if (reverse == TRUE) {
    miss.data <- data.frame(colSums(is.na(df))/nrow(df) )
    miss.data <- cbind(Col_name = rownames(miss.data), miss.data)
    rownames(miss.data) <- 1:nrow(miss.data)
    colnames(miss.data) <- c( 'Col_name' , 'Missing_Perc')
    miss.data  <- miss.data[miss.data$Missing_Perc >= threshold , ]
    miss.data  <- miss.data[order(- miss.data$Missing_Perc) , ]
    return (miss.data$Col_name)
  } else if (reverse == FALSE) {
    miss.data <- data.frame(colSums(is.na(df))/nrow(df) )
    miss.data <- cbind(Col_name = rownames(miss.data), miss.data)
    rownames(miss.data) <- 1:nrow(miss.data)
    colnames(miss.data) <- c( 'Col_name' , 'Missing_Perc')
    miss.data  <- miss.data[miss.data$Missing_Perc != 0  , ]
    miss.data  <- miss.data[miss.data$Missing_Perc <  threshold , ]
    miss.data  <- miss.data[order(- miss.data$Missing_Perc) , ]
    return (miss.data$Col_name)
  }
}

#############################################################################
## Function 2.0: Finding function to get the mode
getmode <- function(col_vector) {
  uniqv <- unique(col_vector)
  uniqv[which.max(tabulate(match(col_vector, uniqv)))]
}

#############################################################################
## Function 2.1: Imputation Process 
impute_data <- function(df) {
  ## Creating a Negate function
  `%notin%` <- Negate(`%in%`)
  
  
  df[ , 'GarageType'][is.na(df[ , 'GarageType'])] <-"No_Grg"
  df[ , 'GarageFinish'][is.na(df[ , 'GarageFinish'])] <-"No_Grg"
  df[ , 'GarageQual'][is.na(df[ , 'GarageQual'])] <-"No_Grg"
  df[ , 'GarageCond'][is.na(df[ , 'GarageCond'])] <-"No_Grg"
  df[ , 'BsmtExposure'][is.na(df[ , 'BsmtExposure'])] <-"No_Bsmt"
  df[ , 'BsmtFinType1'][is.na(df[ , 'BsmtFinType1'])] <-"No_Bsmt"
  df[ , 'BsmtFinType2'][is.na(df[ , 'BsmtFinType2'])] <-"No_Bsmt"
  df[ , 'BsmtQual'][is.na(df[ , 'BsmtQual'])] <-"No_Bsmt"
  df[ , 'BsmtCond'][is.na(df[ , 'BsmtCond'])] <-"No_Bsmt"
  
  
  ## Updating rest of the columns with Median and Mode based on the datatype
  manual_cols <-  c( 'GarageType','GarageFinish','GarageQual' 
                     , 'GarageCond', 'BsmtExposure' , 'BsmtFinType1' 
                     , 'BsmtFinType2', 'BsmtQual', 'BsmtCond' )
  total_cols <- colnames(df)
  impute_col <- missing_values(df , threshold = 0.4, reverse = FALSE)
  impute_col <- to_vec(for (x in impute_col) if(x %notin% manual_cols ) x)
  no_impute_col <- to_vec(for (x in total_cols) if(x %notin% impute_col ) x)
  
  dff_noImpute <- df[,(names(df) %in% no_impute_col)]
  
  ## Selecting only data which needs imputation
  dff <- df[,(names(df) %in% impute_col)]
  dff_num <- dff %>%select_if(is.numeric)
  dff_char <- dff %>%select_if(is.character)
  
  ## Imputing Numerical Values 
  for(i in 1:ncol(dff_num)) {
    dff_num[ , i][is.na(dff_num[ , i])] <- median(dff_num[ , i], na.rm = TRUE)
  }
  
  ## Imputing Categorical Values 
  for(i in 1:ncol(dff_char)) {
    dff_char[ , i][is.na(dff_char[ , i])] <- getmode(dff_char[ , i])
  }
  
  ## Concating the dataframes
  df_final <- cbind(dff_noImpute , dff_char , dff_num  )
  
  return (df_final)
  
}

## Function 3 : Function to Clean end to end data

data_cleaning <- function(df , thres) {
  # First step is to find missing values in the DF and call those 
  #  column names to drop. 
  
  col_name_drop <- missing_values(df , threshold = thres, reverse = TRUE)
  df <- df[,!(names(df) %in% col_name_drop)]
  df <- impute_data(df) 
  
  return (df)
}


################################################################################
## Function 4 : Feature Engineering 

feature_eng <- function(df) {
  
  ## Dropping columns which holds constant values 
  df <- subset(df, select = -c(Street , Utilities , Id , YrSold , MoSold) )
  
  ## Converting Quality related Columns from Cat to Num
  df$BsmtCond <- c(Po = 1 ,  Fa = 2  , No_Bsmt = 3 , TA = 4 , Gd =5 )[df$BsmtCond]
  df$BsmtExposure <- c( No_Bsmt = 0 , No = 1 , Mn = 2, Av = 3 , Gd =4 )[df$BsmtExposure]
  df$BsmtQual <- c(No_Bsmt = 0  , Po = 0 , Fa = 1 ,  TA = 2  , Gd = 3 , Ex = 4  )[df$BsmtQual]
  
  df$KitchenQual <- c(Fa = 1 ,  TA = 2  , Gd = 3 , Ex = 4  )[df$KitchenQual]
  
  df$ExterCond <- c(Po = 1 ,  Fa = 1  , Gd = 2 , TA = 2 , Ex = 2 )[df$ExterCond]
  df$ExterQual <- c(Fa = 1 ,  TA = 2  , Gd = 3 , Ex = 4  )[df$ExterQual]
  
  df$GarageQual <- c(No_Grg = 0 , Po = 1 ,  Fa = 2  , TA = 3 , Gd=4 , Ex = 4  )[df$GarageQual]
  df$GarageCond <- c(No_Grg = 0 , Po = 1 ,  Fa = 1  , Gd=2 , Ex = 2 , TA=2 )[df$GarageCond]
  df$GarageFinish <- c(No_Grg = 0 , Unf = 1 ,  RFn = 2  , Fin = 3   )[df$GarageFinish]
  
  df$HeatingQC <- c(Po = 0 ,  Fa = 1  , TA = 1  , Gd = 1 , Ex = 2 )[df$HeatingQC]
  df$Electrical <- c(SBrkr = 'SBrkr' , FuseF = 'Fuse', FuseA = 'Fuse' , FuseP = 'Fuse' 
                     , Mix = 'Mix')[df$Electrical]
  
  df[sapply(df, is.character)] <- lapply(df[sapply(df, is.character)],  as.factor)
  
  return (df)
  
}

################################################################################
## Function 5 : Data Prep for Test data 


TestDataPrep <- function(df){
  
  ## Step : Drop columns which is not needed
  
  df <- impute_data(df) 
  
  df <- subset(df, select = -c(Alley, Fence , FireplaceQu , Id
                               , MiscFeature , PoolQC,  Street , Utilities 
                               , MoSold , YrSold) )
  df[ , 'GarageType'][is.na(df[ , 'GarageType'])] <-"No_Grg"
  df[ , 'GarageFinish'][is.na(df[ , 'GarageFinish'])] <-"No_Grg"
  df[ , 'GarageQual'][is.na(df[ , 'GarageQual'])] <-"No_Grg"
  df[ , 'GarageCond'][is.na(df[ , 'GarageCond'])] <-"No_Grg"
  df[ , 'BsmtExposure'][is.na(df[ , 'BsmtExposure'])] <-"No_Bsmt"
  df[ , 'BsmtFinType1'][is.na(df[ , 'BsmtFinType1'])] <-"No_Bsmt"
  df[ , 'BsmtFinType2'][is.na(df[ , 'BsmtFinType2'])] <-"No_Bsmt"
  df[ , 'BsmtQual'][is.na(df[ , 'BsmtQual'])] <-"No_Bsmt"
  df[ , 'BsmtCond'][is.na(df[ , 'BsmtCond'])] <-"No_Bsmt"
  
  ## Converting Quality related Columns from Cat to Num
  df$BsmtCond <- c(Po = 1 ,  Fa = 2  , No_Bsmt = 3 , TA = 4 , Gd =5 )[df$BsmtCond]
  df$BsmtExposure <- c( No_Bsmt = 0 , No = 1 , Mn = 2, Av = 3 , Gd =4 )[df$BsmtExposure]
  df$BsmtQual <- c(No_Bsmt = 0  , Po = 0 , Fa = 1 ,  TA = 2  , Gd = 3 , Ex = 4  )[df$BsmtQual]
  
  df$KitchenQual <- c(Fa = 1 ,  TA = 2  , Gd = 3 , Ex = 4  )[df$KitchenQual]
  
  df$ExterCond <- c(Po = 1 ,  Fa = 1  , Gd = 2 , TA = 2 , Ex = 2 )[df$ExterCond]
  df$ExterQual <- c(Fa = 1 ,  TA = 2  , Gd = 3 , Ex = 4  )[df$ExterQual]
  
  df$GarageQual <- c(No_Grg = 0 , Po = 1 ,  Fa = 2  , TA = 3 , Gd=4 , Ex = 4  )[df$GarageQual]
  df$GarageCond <- c(No_Grg = 0 , Po = 1 ,  Fa = 1  ,No_Grg = 1 , Gd=2 , Ex = 2 , TA=2 )[df$GarageCond]
  df$GarageFinish <- c(No_Grg = 0 , Unf = 1 ,  RFn = 2  , Fin = 3   )[df$GarageFinish]
  
  df$HeatingQC <- c(Po = 0 ,  Fa = 1  , TA = 1  , Gd = 1 , Ex = 2 )[df$HeatingQC]
  df$Electrical <- c(SBrkr = 'SBrkr' , FuseF = 'Fuse', FuseA = 'Fuse' , FuseP = 'Fuse' 
                     , Mix = 'Mix')[df$Electrical]
  
 
  df[sapply(df, is.character)] <- lapply(df[sapply(df, is.character)],  as.factor)

  return (df)
  
}

ridge_plot <- plot(ridge)
