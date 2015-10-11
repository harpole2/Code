calc_conductance <- function(directory, filename, outputname) {
    #set directory and read file
    setwd(directory)
    table <- read.csv(filename)
    
    #calculate means and standard Error of each column
   
     means <- colMeans(table)
     se <- function(x){
        sd(table[,x])/sqrt(length(table[,x]))
         }
    
    error <- sapply(1:length(table[1,]), se)
    
    #add mean and error to data frame
    table <- rbind(table, means)
    table <- rbind(table, error)
    
    # set conductance calculations
    volts = c(0, -0.05, -0.1, -0.15, -0.2)
    volts_noZ = c(-0.05, -0.1, -0.15, -0.2)
    
    total = table[nrow(table)-1, 1:5]
    total_noZ = table[nrow(table)-1, 2:5]
    total <- as.numeric(total)
    total_noZ <- as.numeric(total_noZ)
    
    cat_current = table[nrow(table)-1, 8:12]
    cat_current_noZ = table[nrow(table)-1, 9:12]
    cat_current = as.numeric(cat_current)
    cat_current_noZ = as.numeric(cat_current_noZ)
    
    ani_current = table[nrow(table)-1, 15:19]
    ani_current_noZ = table[nrow(table)-1, 16:19]
    ani_current = as.numeric(ani_current)
    ani_current_noZ = as.numeric(ani_current_noZ)
    
    #calculate conductances in picoSiemens
    total_cond <- lm(total ~ volts)
    total_cond_noZ <- lm(total_noZ ~ volts_noZ)
    
    cat_cond <- lm(cat_current ~ volts)
    cat_cond_noZ <- lm(cat_current_noZ ~ volts_noZ)
    
    ani_cond <- lm(ani_current ~ volts)
    ani_cond_noZ <- lm(ani_current_noZ ~ volts_noZ)
    
    total_num <- coef(total_cond)[2]
    total_num_noZ <- coef(total_cond_noZ)[2]
    
    cat_num <- coef(cat_cond)[2]
    cat_num_noZ <- coef(cat_cond_noZ)[2]
    
    ani_num <- coef(ani_cond)[2]
    ani_num_noZ <- coef(ani_cond_noZ)[2]
    
    #calculate recification
    total_yint <- coef(total_cond)[1]
    total_yint_noZ <- coef(total_cond_noZ)[1]
    
    cat_yint <- coef(cat_cond)[1]
    cat_yint_noZ <- coef(cat_cond_noZ)[1]
    
    ani_yint <- coef(ani_cond)[1]
    ani_yint_noZ <- coef(ani_cond_noZ)[1]
    
    total_rec <- -total_yint/total_num
    total_rec_noZ <- -total_yint_noZ/total_num_noZ
    
    cat_rec <- -cat_yint/cat_num
    cat_rec_noZ <- -cat_yint_noZ/cat_num_noZ
    
    ani_rec <- -ani_yint/ani_num
    ani_rec_noZ <- -ani_yint_noZ/ani_num_noZ
   
    #get goodness of fit
    total_rsq <- summary(total_cond)$r.squared
    total_rsq_noZ <- summary(total_cond_noZ)$r.squared
    
    cat_rsq <- summary(cat_cond)$r.squared
    cat_rsq_noZ <- summary(cat_cond_noZ)$r.squared
    
    ani_rsq <- summary(ani_cond)$r.squared
    ani_rsq_noZ <- summary(ani_cond_noZ)$r.squared
    
    # Fraction of Current carried by Cation or Anion
    cat_frac <- cat_num/total_num
    cat_frac_noZ <- cat_num_noZ/total_num_noZ
    
    ani_frac <- ani_num/total_num
    ani_frac_noZ <- ani_num_noZ/total_num_noZ
    
    #Cation to Anion ratio
    CA_rat <- cat_num/ani_num
    CA_rat_noZ <- cat_num_noZ/ani_num_noZ
    
    #create summary data frame
    data_withZero = c(Total_Conductance = total_num, Total_rectification = total_rec,
                     Total_Rsquared= total_rsq, Cation_Conductance = cat_num,
                     Cation_rectification = cat_rec,
                     Cation_Rsquared = cat_rsq,
                     Cation_Fraction = cat_frac,
                     Anion_Conductance = ani_num,
                     Anion_rectification =ani_rec,
                     Anion_Rsquared = ani_rsq,
                     Anion_Fraction = ani_frac,
                     Cation_Anion_Ration = CA_rat)
    
    data_withoutZero = c(Total_Conductance = total_num_noZ, Total_rectification = total_rec_noZ,
                      Total_Rsquared= total_rsq_noZ, Cation_Conductance = cat_num_noZ,
                      Cation_rectification = cat_rec_noZ,
                      Cation_Rsquared = cat_rsq_noZ,
                      Cation_Fraction = cat_frac_noZ,
                      Anion_Conductance = ani_num_noZ,
                      Anion_rectification =ani_rec_noZ,
                      Anion_Rsquared = ani_rsq_noZ,
                      Anion_Fraction = ani_frac_noZ,
                      Cation_Anion_Ration = CA_rat_noZ)
    
    summa <- data.frame(data_withZero, data_withoutZero)
    
    #write summary and new IV csv files
    
    write.csv(summa, outputname)
    
    name <- paste("MeansAndErrors", filename, sep="")
    write.csv(table, name)
}
