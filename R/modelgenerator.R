# Aqui vamos a recibir el dataframe limpio que devuelve procesdata para aplicarle el modelo
#aplicandole los splits, regresiones, etc.
# Esta funcion tiene que devolver un modelo.

to_ML <- function(df_1, config){
  
  browser()
  
  library(caret)
  library(logging)
  
  df_orig <- data.frame(df_1[1])
  predict_y <- data.frame(df_1[2])
  # Separacion del train y test
  validation_index <- createDataPartition(df_orig[, ncol(df_orig)], p=0.80, list=FALSE)
  test_df <- df_orig[-validation_index,]
  train_df <- df_orig[validation_index,]
  
  # Simple linear regression model (lm means linear model)
  # EL PROBLEMA ESTÁ EN ESTA LÍNEA, PERO NO CONSIGO SABER CUAL ES, HE DEJADO UN RECORTE DEL ERROR EN DISCORD
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
