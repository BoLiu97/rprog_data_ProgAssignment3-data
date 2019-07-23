rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  data1 = read.csv("outcome-of-care-measures.csv", colClasses = "character")
  state <- levels(factor(data1[, 7]))
  hospital <- vector(mode="character") 
    for(i in seq(state)){
      outcome1 = read.csv("outcome-of-care-measures.csv", colClasses = "character")
      ##check if state is a true arg
      if( !state[i] %in% outcome1$State) 
        stop(print("invalid state"))
      ## also can write as data <- subset(outcome1, State == state)
    data = outcome1[outcome1$State==state[i],]
    ##num_hos <- length(data)
    
  
    ## check outcome location and true arg
    if (outcome == "heart attack") {
      colnum <- 11}
    else if (outcome == "heart failure") {
      colnum <-17}
    else if(outcome=="pneumonia"){
      colnum <- 23}
    else{ 
      stop(print("invalid outcome"))}
    ## delete NA value
    data[,colnum] <- as.numeric(data[, colnum])
    NA_line <- is.na(data[,colnum])
    data_without_na <- data[!NA_line,]
  
    ##find the value 
    column_name <- names(data_without_na)[colnum]
    hos_name <- names(data_without_na)[2]
    index <- with(data_without_na, order(data_without_na[column_name], data_without_na[hos_name]))
    ordered_desired_data <- data_without_na[index, ]
    locateat<- num
    if(is.character(num)==TRUE ){
       ##col_for_tar <- as.numeric(data_without_na[,colnum])
        if (num == "best") {
          locateat <- 1}
        else if (num == "worst") {
        ##locateat <- which.min(col_for_sma)}
          locateat <- length(data_without_na[, column_name])
        }
      }
      hospital[i] <- ordered_desired_data[locateat, 2]
    }
  data.frame(hospital, state)
}