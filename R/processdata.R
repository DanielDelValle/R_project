process_data <- function(df){

  header.true <- function(df) {
    names(df) <- as.character(unlist(df[1,]))
    df[-1,]
    }

  df <- header.true(df)

  rownames(df) <- df[,1]

  df$country = NULL
  
  return(df)
  }