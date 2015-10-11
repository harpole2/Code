energy_profile <- function(directory, Temp =300) {

#Simulation Directory
setwd(directory)

#Get average ion density across all simulations in the folder
sims = list.files(pattern = "*density.vi")
check=read.table(sims[1])
size = nrow(check)
#density data
densityK = data.frame(matrix(nrow=size, ncol=length(sims)))
densityCl = data.frame(matrix(nrow=size, ncol=length(sims)))

#energy data
energyK = data.frame(matrix(nrow=size, ncol=2))
energyCl = data.frame(matrix(nrow=size, ncol=2))

for (i in 1:length(sims)){
    x = assign(sims[i], read.table(sims[i]))
    #cation column
    densityK[i] = x$V3
    #anion column
    densityCl[i] = x$V4
}

for (i in 1:size){
    densityK[i, length(sims)+1] = mean(as.numeric(densityK[i,1:length(sims)]))
    densityCl[i, length(sims)+1] = mean(as.numeric(densityCl[i,1:length(sims)]))
    
    #standard deviation for error analysis
    densityK[i, length(sims)+2] = sd(as.numeric(densityK[i,1:length(sims)]))
    densityCl[i, length(sims)+2] = sd(as.numeric(densityCl[i,1:length(sims)]))
}

#convert ion densities to energies

#define constants
#Temp = 300 #kelvin
bulk = 0.0000903 #ion density for 150 mM
con = -0.0019872041 # R in units Kcal/(mol*T)

energyK[1] = Temp*con*log(densityK[length(sims)+1]/bulk)
energyCl[1] = Temp*con*log(densityCl[length(sims)+1]/bulk)


#error analysis using propagation of error

for (i in 1:size){
    energyK[i, 2] = (-con*Temp/densityK[i, length(sims)+1])*densityK[i, length(sims)+2]/sqrt(length(sims))
    energyCl[i, 2] = (-con*Temp/densityCl[i, length(sims)+1])*densityCl[i, length(sims)+2]/sqrt(length(sims))
}


#Combine Cation, Anion, and errors with column headings
energies = data.frame(Axis=check[,1], Cation_energy=energyK[,1], Cation_error=energyK[,2], Anion_energy=energyCl[,1], Anion_error=energyCl[,2])

write.csv(energies, file = "Cation_Anion_Free_Energy_and_errors.csv")

#Plot data

library(ggplot2)

ggplot(energies, aes(Axis)) + 
    geom_line(aes(y = Cation_energy), colour="red") +
    geom_line(aes(y = Anion_energy), colour="blue") +
    xlab("Axis of Permeation") +
    ylab("Free Energy (Kcal/mol)") +
    ggtitle("Free Energy Profile for Cation and Anion")


    

}    
