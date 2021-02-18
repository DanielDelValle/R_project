# Aqui vamos a recibir el dataframe limpio que devuelve procesdata para aplicarle el modelo
#aplicandole los splits, regresiones, etc.
# Esta funcion tiene que devolver un modelo.

#' @title to_ML
#' @description This function is called by skeleton and it hooks the df onto 
#' a machine learning model
#' 
#' @param data DataFrame with reshape data from all datasets
#' @param config List of configuration parameters 
#'
#' @import caret  
#' @import logging
#' @import xgboost
to_ML <- function(df_1, config){
  
  library(caret)
  library(logging)
  
  df_orig <- data.frame(df_1[1])
  predict_y <- data.frame(df_1[2])
  # Separacion del train y test
  validation_index <- createDataPartition(df_orig[, ncol(df_orig)], p=0.80, list=FALSE)
  test_df <- df_orig[-validation_index,]
  train_df <- df_orig[validation_index,]
  
  
  # Simple linear regression model (lm means linear model)
  model_1 <- train( train_df[,3:(ncol(train_df)-1)], train_df[, ncol(train_df)], method = 'xgboost')
  
  loginfo("Resumen de modelo de ML", logger = 'log')
  
  predict_test <- predict(model_1, test_df[,3:(ncol(test_df)-1)])
  
  loginfo("Resumen de modelo de ML terminado", logger = 'log')
  
  RMSE <- sqrt(mean((predict_test - test_df[, ncol(train_df)])^2))
  
  resultado <- predict(model_1, predict_y) 
  predict_y[, ncol(predict_y)] <- resultado
  output <- predict_y
  return(output)
}