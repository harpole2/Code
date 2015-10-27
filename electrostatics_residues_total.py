#!/usr/bin/python

"""
Use a fasta formated sequence file as an input
"""

from __future__ import division
import numpy
import sys


def get_electrostatics():

#Find the File
  try:
    f = file(sys.argv[1])
  except IOError:                     
    print "The file does not exist"

#make dictionary
  species_database = []
  seq_dict = {}

#read file    
  for line in f:
    if line.startswith('>'):
      name = line[1:].rstrip('\n')
      name = name.replace('_', ' ')
      name = name.replace('-','')
      species_database.append(name)
      seq_dict[name] = ''
    else:
      seq_dict[name] += line.rstrip('\n').rstrip('*')

#Print number of sequences in file            
  print "%d sequences found" % len(species_database)


#list for each seqeuence to use for totals
  totalAcid_percent =list()
  totalBase_percent =list()

  totalAcid=list()
  totalBase=list()

#find electrostatic amino acids
  for species, primary in seq_dict.iteritems():
   print ">",species
 
   AA_number = len(primary)

   ASP = primary.count('d') + primary.count('D')
   print "number of Asp residues: %d" % ASP

   GLU = primary.count('e') + primary.count('E')
   print "number of GLU residues: %d" % GLU

   Acidic = ASP + GLU
 

   LYS = primary.count('k') + primary.count('K')
   print "number of LYS residues: %d" % LYS

   ARG = primary.count('r') + primary.count('R')
   print "number of ARG residues: %d" % ARG

   Basic = LYS + ARG

   ratio = Acidic/Basic

   Acd_percent = Acidic/AA_number

   Bsc_percent = Basic/AA_number
 
   totalBase_percent.append(Bsc_percent)
   totalAcid_percent.append(Acd_percent)

   totalAcid.append(Acidic)
   totalBase.append(Basic)

   print "number of Acidic residues:", Acidic
   print "number of Basic residues:", Basic
   print "Ratio is", ratio
   print "Percentage of Acidic residues whole seqeuence:", Acd_percent
   print "Percentage of Basic residues whole seqeuence:", Bsc_percent

  print "Mean number of Acidic residues is:", numpy.mean(totalAcid)
  print "Mean number of Basic residues is:", numpy.mean(totalBase)
  print "Mean percentage of Acidic residues is:", numpy.mean(totalAcid_percent)
  print "Mean percentage of Basic residues is:", numpy.mean(totalBase_percent)

 
get_electrostatics()
