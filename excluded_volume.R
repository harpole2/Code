excluded_volume <- function(r_ref=1.25, r_p =3, 
                            r_i = seq(from = 0.05, to = r_p, by = 0.001)) {
# P_i/P_max <- phi_i*Fprime_i*(1+9*(alpha_i)^(5.5)*(1-(alpha_i)^5)^.02)
#Bassingthwaighte JB's 2006 Microcirculation equation 19
    
#TAKE STOKES RADIUS FOR IONIC RADIUS
#Default reference ion is potassium    




#r_i is test ion radius
#r_p is pore radius
#phi_i is ion partition coefficient (pi*(r_p-r_i)^2)/(pi*r_p)^2

alpha_i <- r_i/r_p

phi_i <- (1-alpha_i)^2 


#Fprime_i scales the diffusion coeffiencent inside pore = D_ipore/D_ibulk
Fprime_i <- (1-alpha_i^2)^1.5*phi_i/(1+0.2*alpha_i^2*(1-alpha_i^2)^16)

P_iToP_max <- phi_i*Fprime_i*(1+9*(alpha_i)^5.5*(1-(alpha_i)^5)^0.02) 

# Because we do not have r_p, compare ratio of 2 ions to solve for r_p
# use reference ion

alpha_ref <- r_ref/r_p

phi_ref <- (1-alpha_ref)^2

#Diffusion scaling for reference ion
Fprime_ref <- (1-alpha_ref^2)^1.5*phi_ref/(1+0.2*alpha_ref^2*(1-alpha_ref^2)^16)

P_refToP_max <- phi_ref*Fprime_ref*(1+9*(alpha_ref)^5.5*(1-(alpha_ref)^5)^0.02)

#combine the two equations

P_iToP_ref <- P_iToP_max/P_refToP_max

plot(r_i, P_iToP_ref)

}
