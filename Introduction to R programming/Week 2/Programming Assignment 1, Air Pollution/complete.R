complete <- function(directory, id= 1:332) {
    files <- list.files(directory, full.names = TRUE);
    completeCases <- data.frame();
    
    for(index in id) {
        data <- read.csv(files[index], comment.char = "");
        c <- complete.cases(data);
        NaNN <- data[c, ];
        completeCases <- rbind(completeCases, c(index, nrow(NaNN)));
    }
    
    names(completeCases) <- c("ID", "nobs");
    completeCases;
}