reversal_potential <- function(directory, filename, outputname) {
    #set directory and read file
    setwd(directory)
    table <- read.csv(filename, header = FALSE)
    
    #get column means
    means <- colMeans(table[-1,]) #exclude voltage line
    table <- rbind(table, means)

    #get potentials
    volts <- table[1,]
    volts <- as.numeric(volts)
    
    #get means at each potential
    size <- nrow(table)
    means <- table[size,]
    means <- as.numeric(means)
    
    #find line
    line <- lm(means ~ volts)
    
    #get goodness of fit
    rev_good <- summary(line)$r.squared
    
    #calculate reversal potential
    slpe <- coef(line)[2]
    yint <- coef(line)[1]
    reversal <- -yint/slpe
    

    plot(volts,means)
    abline(line)
    
    #convert to millivolts
    reversal_millivolts <- reversal*1000
    
    data = c(Reversal_Potential_milliVolts = reversal_millivolts, Rsquared = rev_good)
    
    all <- data.frame(data)
    
    #write output
    write.csv(all, outputname)
    newname <- paste("Means", filename, sep="")
    write.csv(table, newname)
}