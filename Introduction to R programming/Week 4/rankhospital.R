rankhospital <- function(state, outcome, num = "best") {
    
    ## Read the outcome data
    dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Check that state and outcome are valid
    if (!state %in% unique(dat[, 7])) {
        stop("invalid state")
    }
    switch(outcome, `heart attack` = {
        col = 11
    }, `heart failure` = {
        col = 17
    }, pneumonia = {
        col = 23
    }, stop("invalid outcome"))
    dat[, col] = as.numeric(dat[, col])
    df = dat[dat[, 7] == state, c(2, col)]
    df = na.omit(df)
    nhospital = nrow(df)
    switch(num, best = {
        num = 1
    }, worst = {
        num = nhospital
    })
    if (num > nhospital) {
        return(NA)
    }
    ## Return hospital name in that state with the given rank 30-day death rate
    
    o = order(df[, 2], df[, 1])
    df[o, ][num, 1]
}


rankhospitalOwn <- function(state, outcome, num = "best") {
    ## Read outcome data
    x <- read.csv("outcome-of-care-measures.csv", header=TRUE)
    
    ## Check that state and outcome are valid
    checkState <- unique(x$State)
    checkOutcome <- c("heart attack", "heart failure", "pneumonia")
    
    if(!(state %in% checkState)) stop("invalid state")
    else if(!(outcome %in% checkOutcome)) stop("invalid outcome")
    
    if(outcome == "heart attack") {
        number <- 11
    }
    else if (outcome == "heart failure") {
        number <- 17
        
    }
    else if (outcome == "pneumonia") {
        number <- 23
    }
    
    ##filter out NA
    Y <- complete.cases(x[, number])
    x <- x[Y, ]
    
    ##Check if value is "worst"
    if (num == "worst") {
        num <- nrow(x)
    }
    else if(num == "best") {
        num <- 1
    }
    else if(num > nrow(x)) {
        return(NA)
    }
    
    ## Get unique values from list & get position 'num'
    ## get UNIQUE values, sort from LOW to HIGH, get position from 'num'.
    pos <- sort(unique(x[, number]), decreasing=FALSE)
    
    ##Return all x values that are equal to 'pos'
    result <- which(x[, number] %in% pos[num])
    
    ##return object
    as.character(x[result, 2])
}