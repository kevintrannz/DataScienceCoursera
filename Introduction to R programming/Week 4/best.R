best <- function(state, outcome) {
    ## Read outcome data
    x <- read.csv("outcome-of-care-measures.csv", header=TRUE, stringsAsFactors=F, na.strings="Not Available")
    
    ## Check that state and outcome are valid
    checkState <- unique(x$State)
    checkOutcome <- c("heart attack", "heart failure", "pneumonia")
    
    if(!(state %in% checkState)) {
        stop("invalid state")
    }
    else if(!(outcome %in% checkOutcome)) {
        stop("invalid outcome")
    }
    
    ## Return hospital name in that state with lowest 30-day death
    if(outcome == "heart attack") {
        number <- 11
    }
    else if (outcome == "heart failure") {
        number <- 17
        
    }
    else if (outcome == "pneumonia") {
        number <- 23
    }
    
    ##get relevant information
    X <- subset(x, x$State== state)
    
    
    y <- as.numeric(as.character(X[,number]))
    z <- min(y, na.rm=TRUE)
    
    subsetx <- subset(X, as.numeric(X[,number])==z)
    answer <- subsetx[2]
    
    ## rate
    FA <- answer[with(answer, order(Hospital.Name)), ]
    FA[1]
}