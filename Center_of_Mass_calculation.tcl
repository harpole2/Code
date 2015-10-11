proc atomCOMDistance {args} {  
  
    if {[llength $args] != 4} {
        puts "Outputs the distance between single atom and center of mass of a collection of atoms."
        puts "Usage: atomCOMDistance output_prefix sim_mol_id selection1 selection2"
        error ""
    }
    
    # Parse the arguments.
    set outputPrefix [lindex $args 0]
    set simMolID [lindex $args 1]
    set selection1 [lindex $args 2]
    set selection2 [lindex $args 3]

    #Open the file for writing out the RMSD of the backbone.
    set file [open "$outputPrefix-atomCOMDistance.dat" w]
    
    #RMSD calculation loop
    set nf [molinfo $simMolID get numframes]
    set sel1 [atomselect $simMolID $selection1]
    set sel2 [atomselect $simMolID $selection2]
    for {set i 0 } {$i < $nf } { incr i } {
        $sel1 frame $i
	$sel2 frame $i
	set com2 [measure center $sel2 weight mass]
	set vec1 [list [$sel1 get x] [$sel1 get y] [$sel1 get z]]
	set vec2 [list [lindex $com2 0] [lindex $com2 1] [lindex $com2 2]]
        puts $file "[veclength [vecsub $vec1 $vec2]]"
        #$sel delete
        #unset sel
	#$alignSel delete
	#unset alignSel
    }
    $sel1 delete
    unset sel1
    $sel2 delete
    unset sel2
    #$com2 delete
    #unset com2	
    close $file

    return
}

proc atomZCOMDistance {args} {  
  
    if {[llength $args] != 4} {
        puts "Outputs the distance along the x-axis between an atom and the Center of Mass of a set of atoms."
        puts "Usage: atomZCOMDistance output_prefix sim_mol_id selection1 selection2"
        error ""
    }
    
    # Parse the arguments.
    set outputPrefix [lindex $args 0]
    set simMolID [lindex $args 1]
    set selection1 [lindex $args 2]
    set selection2 [lindex $args 3]

    #Open the file for writing out the RMSD of the backbone.
    set file [open "$outputPrefix-ZONLYatomZCOMDistance.dat" w]
    
    #RMSD calculation loop
    set nf [molinfo $simMolID get numframes]
    set sel1 [atomselect $simMolID $selection1]
    set sel2 [atomselect $simMolID $selection2]
    for {set i 0 } {$i < $nf } { incr i } {
        $sel1 frame $i
	$sel2 frame $i
	set com2 [measure center $sel2 weight mass]
	set vec1 [list [$sel1 get x] [$sel1 get y] [$sel1 get z]]
	set vec2 [list 0 0 [lindex $com2 2]]
        puts $file "[veclength [vecsub $vec1 $vec2]]"
        #$sel delete
        #unset sel
	#$alignSel delete
	#unset alignSel
    }
    $sel1 delete
    unset sel1
    $sel2 delete
    unset sel2
    #$com2 delete
    #unset com2	
    close $file

    return
}


