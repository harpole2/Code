umbrella_statistics <- function(directory, outputname = "umbrella_stats.csv") {
    #string library
    library(stringr)
    
    #Simulation Directory
    setwd(directory)
    
    # load data and setup output file
    runs = list.files(pattern = "*all.colvars.traj")
    data <- data.frame(matrix(nrow=length(runs), ncol=3))
    colnames(data) <- c("window", "Mean", "Sigma")
    
    
    #fit data to histogram and extract mean and Standard Deviation
    for (i in 1:length(runs)){
        table = assign(runs[i], read.table(runs[i]))
        
        data[i, 2] <- mean(table$V2)
        data[i, 3] <- sd(table$V2)
        
        stastp <- str_locate_all(pattern = "_", runs[i])
        stastp <- unlist(stastp)
	len <- length(stastp)
        wind <- substr(runs[i], stastp[len-1]+1, stastp[len]-1)
        wind <- gsub("p", ".", wind)
        wind <- gsub("m","-", wind)
        wind <- as.numeric(wind)
        data[i, 1] <- wind
    }
    data <- data[order(data$window),]
    write.csv(data, outputname)
}    
