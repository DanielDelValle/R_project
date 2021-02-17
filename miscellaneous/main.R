lapply(c("dummies", "logging", "xgboost", "XML"), require, character.only = T)

Directorio <- getwd()

setwd(Directorio)
carpetaScripts <- paste0(Directorio, "/R/")

#List files nos devuelve los archivos dentro del directorio.

lapply(paste0(list.files(Directorio, path = "/R", recursive = TRUE)), source)

#debug(clasificarContactosApp)

clasificarContactosApp(Directorio)

#undebug(clasificarContactosApp)