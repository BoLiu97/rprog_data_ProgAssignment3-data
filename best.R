best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  outcome1 = read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data = outcome1[outcome1$State==state,]
  length= nrow(data)
  if (outcome == "heart attack") colnum <- 11
  else if (outcome == "heart failure") colnum <-17
  else colnum <- 23
  fd =data[,c(2,col)]
  colnames(fd) = c("hospital", "outcome")
  oi = as.numeric(fd[, eval(2)]) 
  min1 = min(oi,na.rm = TRUE)
  result  = fd[, "hospital"][which(oi == min_val)]
  output  <- result[order(result)]  
  output
}