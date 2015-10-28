#!/opt/local/bin/python

"""
Create Density files For PMF generation from simulation files
Input simulation output names
This creates files that can be used in ion_density_energy_conversion_error_analysis.R
General Usage:
./get_densities_parse.py step5_gcmcbd*

"""

import sys

def get_densities():

#Find the Files
  i = 1
  while i < len(sys.argv):
    try:
      f = file(sys.argv[i])
    except IOError:                     
      print "The file does not exist"
    i += 1
 
# loop over all input files 
  i = 1
  while i < len(sys.argv):
# name output file
    name = sys.argv[i]
    num = name.find(".")
    name = name[:num] +"_density.vi"
    new = file(name, "w")
    parsing = False
    search = open(sys.argv[i])
# find and extract the density profile and write output
    for line in search:
      line = line.rstrip()
      if 'Average density profile' in line:
        parsing = True
      elif 'CMD> STOP' in line:
        parsing = False
      if parsing:
        if 'CMD>' not in line and 'Average density profile' not in line:
          new.write(line)
          new.write("\n")
    i +=1
	
 

get_densities()
