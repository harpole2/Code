pore_dimensions <- function(directory, pore_move, inputfile="center_of_mass.dat", 
                                 outputfile="movement.dat") {
    #set directory
    setwd(directory)
    
    #get subunit center of mass file
    com <- read.table(inputfile)
    data <- matrix(nrow=5,ncol=3)
    #compute the center of mass change needed
    for (i in 1:nrow(com)){
      A <- com[i,1]
      B <- com[i,2]
      C <- com[i,3]
      
      h <- sqrt(A^2+B^2)
      
      f <- function(x) (A+x)^2+(B+(B*x/A))^2 - (h+ pore_move)^2
      x <- uniroot(f, lower=-2, upper=2)$root
      y <- (B*x)/A
      data[i,1] <- x
      data[i,2] <- y
      data[i,3] <- 0
      
    } 
    write.csv(data, outputfile)
}