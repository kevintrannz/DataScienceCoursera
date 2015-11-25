corr <- function(directory, threshold = 0) {
    files <- list.files(directory, full.names = TRUE)
    ret <- vector(mode = "numeric", length = 0)
    
    for (i in 1:length(files)) {
        read <- read.csv(files[i])
        csum <- sum((!is.na(read$sulfate)) & (!is.na(read$nitrate)))
        if (csum > threshold) {
            tmp <- read[which(!is.na(read$sulfate)), ]
            subRead <- tmp[which(!is.na(tmp$nitrate)), ]
            ret <- c(ret, cor(subRead$sulfate, subRead$nitrate))
        }
    }
    ret
}                                                                  