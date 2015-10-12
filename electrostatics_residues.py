#!/usr/bin/python

from __future__ import division

#Find the File
try:
  f = file("ebi_Glycine_alpha1.fasta")
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

 print "number of Acidic residues:", Acidic
 print "number of Basic residues:", Basic
 print "Ratio is", ratio
 print "Percentage of Acidic residues whole seqeuence:", Acd_percent
 print "Percentage of Basic residues whole seqeuence:", Bsc_percent 
