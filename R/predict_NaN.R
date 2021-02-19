skeleton <- function (path){
  tryCatch(expr = {
    
    library(logging)
    
    addHandler(writeToFile, logger = 'log', file = paste0(path, "/log/logfile.log"))
    loginfo("Inicio programa", logger = 'log')
    
    #Lectura del config
    loginfo("Leyendo config", logger = 'log')
    config <- leerConfig(path)
    loginfo("Config leido", logger = 'log')
    
    #Lectura de datos
    loginfo("Leyendo datos", logger = 'log')
    datos <- csv_reader(config, path)
    loginfo("Datos leidos", logger = 'log')
    
    #Procesamiento de datos
    loginfo("Procesando datos", logger = 'log')
    df_1 <- process_data(datos)
    loginfo("Datos procesados", logger = 'log')
    
    #Carga de modelo de ML
    loginfo("Cargando modelo de ML", logger = 'log')
    output <- to_ML(df_1, config)
    #output <- df_1
    loginfo("Modelo de ML generado", logger = 'log')
    
    #Generar output
    loginfo("Generar output", logger = 'log')
    createOutput(output, config, path)
    loginfo("Output generado", logger = 'log')
    
  }, error = function(e){
    
    logerror("ERROR, ERROR, ERROR", logger = 'log')
    stop()
    
  }, finally = {
    
    loginfo("Fin de la ejecucion.", logger = 'log')
    removeHandler(writeToFile, logger = 'log')
    
  })
}

