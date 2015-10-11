hydration_profile_K <- function(directory, outputname, hydrad = 3.555) {
    #string library
    library(stringr)
    
    #Simulation Directory
    setwd(directory)
    
    #Set up data file
    
    K_files <- list.files(pattern = "gofr*")
    data <- data.frame(matrix(nrow=length(K_files), ncol=4))
    colnames(data) <- c("window", "HydrationRadiusK", "GofR", "CoordinationNumber" )
    
    # Find the G of R and Coordination number for the hydrated Radius
    for (i in 1:length(K_files)){
        table = assign(K_files[i], read.table(K_files[i]))
        radius <- which(table$V1 == hydrad)
	data[i, 2] <- hydrad
        data[i, 3] <- table[radius, 3]
        data[i, 4] <- table[radius, 4]
        
        stastp <- str_locate_all(pattern = "_", K_files[i])
        stastp <- unlist(stastp)
        wind <- substr(K_files[i], stastp[1]+1, stastp[2]-1)
        wind <- gsub("p", ".", wind)
        wind <- gsub("m","-", wind)
        wind <- as.numeric(wind)
        data[i, 1] <- wind
    }
    data <- data[order(data$window),]
    plot(data$window, data$CoordinationNumber)
    write.csv(data, outputname)
    
}

hydration_profile_Cl <- function(directory, outputname, hydrad = 3.755) {
    #string library
    library(stringr)
    
    #Simulation Directory
    setwd(directory)
    
    #Set up data file
    
    Cl_files <- list.files(pattern = "gofr*")
    data <- data.frame(matrix(nrow=length(Cl_files), ncol=4))
    colnames(data) <- c("window", "HydradtionRadiusCl", "GofR", "CoordinationNumber" )
    
    # Find the G of R and Coordination number for the hydrated Radius
    for (i in 1:length(Cl_files)){
        table = assign(Cl_files[i], read.table(Cl_files[i]))
        radius <- which(table$V1 == hydrad)
	data[i, 2] <- hydrad
        data[i, 3] <- table[radius, 2]
        data[i, 4] <- table[radius, 3]
        
        stastp <- str_locate_all(pattern = "_", Cl_files[i])
        stastp <- unlist(stastp)
        wind <- substr(Cl_files[i], stastp[1]+1, stastp[2]-1)
        wind <- gsub("p", ".", wind)
        wind <- gsub("m","-", wind)
        wind <- as.numeric(wind)
        data[i, 1] <- wind
    }
    data <- data[order(data$window),]
    plot(data$window, data$CoordinationNumber)
    write.csv(data, outputname)
}
