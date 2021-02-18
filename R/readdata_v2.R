csv_reader <- function(config, path){
  
  pathDatos <- paste0(path, "/data/", config$input$csv)
  
  tryCatch(expr = {
    
    datos <- data.table::fread(pathDatos, sep = config$input$sep, encoding = 'UTF-8',
                              data.table = FALSE)
    
  }, error = function(e){
    
    logerror("Datos no encontrados en su ruta. Verifica el archivo datos",
             logger = 'log')
    stop()
  })
  if (nrow(datos) == 0 | ncol(datos) == 0){
    
    logerror("Config no encontrado en su ruta. Verifica que se llama config.xml",
             logger = 'log')
    stop()
    
  }
  
  return(datos)
  
}


