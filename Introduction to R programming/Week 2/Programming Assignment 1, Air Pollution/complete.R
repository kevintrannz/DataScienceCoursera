complete <- function(directory, id= 1:332) {
    files <- list.files("Introduction to R programming/Week 2/Programming Assignment 1, Air Pollution/specdata/", full.names = TRUE);
    completeCases <- data.frame();
    
    for(index in id) {
        data <- read.csv(files[index], comment.char = "");
        c <- complete.cases(data);
        NaNN <- data[c, ];
        completeCases <- rbind(completeCases, c(index, nrow(NaNN)));
    }
    
    names(completeCases) <- c("ID", "Nobs");
    completeCases;
}