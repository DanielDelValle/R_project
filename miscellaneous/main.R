
path <- getwd()

Directorio <- getwd()

setwd(Directorio)

carpetaScripts <- paste0(Directorio, "R/")

# la siguiente línea hace que se ejecuten todas las funciones dentro de la carpeta R

lapply(paste0("R/", list.files(path = "R/", recursive = TRUE)), source)

skeleton(path)