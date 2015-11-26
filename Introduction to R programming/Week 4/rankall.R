rankall <- function(outcome, num = "best") {
    ## Read outcome data
    x <- read.csv("outcome-of-care-measures.csv", header=TRUE)
    ## Check outcome is valid
    if(!(outcome %in% checkOutcome)) stop("invalid outcome")
    
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    
    
    ##zelfde functie als rankhospital maar dan PER state
}
