best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  outcome1 = read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ##check if state is a true arg
  if( !state %in% outcome1$State) 
    stop(print("invalid state"))
  ## also can write as data <- subset(outcome1, State == state)
  data = outcome1[outcome1$State==state,]

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
  disease_col <- as.numeric(data[, colnum])
  NA_line <- is.na(disease_col)
  data_without_na <- data[!NA_line,]
  
  ##find the smallest value 
  col_for_sma <- as.numeric(data_without_na[,colnum])
  locateat <- which.min(col_for_sma)
  hos_smal <- data_without_na[locateat,2]
  
  ##using sort function here if hospital is more than 1
  if(length(hos_smal)>1){
    sort(hos_smal)
    return(hos_smal[1])}
  
  hos_smal
}