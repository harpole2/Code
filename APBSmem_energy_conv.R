APBSmem_energy_conv <- function(directory, outputname = "Total_Step_energies_withKcal.out") {
    #for fixed width file and ploting
    library(gdata)
    library(ggplot2)
    
    #Simulation Directory
    setwd(directory)
    
    #load data
    data <- read.table("Total_Step_Energies.out")
    
    #convert and label
    data[,3]<- data[,2]*300*0.0019872041
    names(data) <- c("distance", "Energy_kt", "Energy_KcalPerMol")
    write.fwf(data, file=outputname)
    g <- ggplot(data, aes(distance, Energy_KcalPerMol)) +
        geom_line() +
        scale_y_continuous(breaks = round(seq(min(data$Energy_KcalPerMol), max(data$Energy_KcalPerMol), by = 0.5),1)) +
        theme_bw() +
        labs(y = expression("Energy(Kcal/mol"), title=expression("Ion Solvation Energy")) +
        theme(panel.grid.minor = element_blank(), panel.grid.major=element_blank())
    
    g
    png(filename="./Energy_plot.png")
    print(g)
    
    dev.off()
}