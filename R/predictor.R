# Este archivo va a recibir el modelo guardado de modelgenerator para aplicarlo sobre los datos a predeciry ...
# devolver un dataframe con las predicciones.

createOutput <-  function(output, config, path){
  
  nameOutput <- paste0(path, "/output/Russia2004.csv")
  
  tryCatch(expr = {
    
    write.csv(output, file = nameOutput, 
              row.names = FALSE)
    
  }, error = function(e){
    
    logerror("Saving failed!", logger = 'log')
    stop()
  })
  
}