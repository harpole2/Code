proc water_whole_channel {args} {

	if {[llength $args] != 2} {
		puts "  Calulates number of water molecules across the entire channel"
        	puts "  Usage: water_whole_channel sim_mol_id output_prefix"
        	error ""
	}
	
	# Parse the arguments.
	set simMolID [lindex $args 0]
	set outputPrefix [lindex $args 1]

	# select water molecules
	
	set file [open "$outputPrefix-numberWatersWholeChannel.dat" w]

	# Selection loop
	set numFrames [molinfo $simMolID get numframes]
	for {set i 0 } {$i < $numFrames } { incr i } {
		set pore [atomselect $simMolID "protein and name CA and resid 37 40 44 47 51 54 58"]	
		$pore frame $i
		$pore update
		set pore_measure [measure minmax $pore]
		set pore_min [lindex $pore_measure 0]
		set pore_max [lindex $pore_measure 1]
		set minxp [lindex $pore_min 0]
		set maxxp [lindex $pore_max 0]
		set minyp [lindex $pore_min 1]
		set maxyp [lindex $pore_max 1]
		set minzp [lindex $pore_min 2]
		set maxzp [lindex $pore_max 2]
		set sel [atomselect $simMolID "name OH2 and z '$minzp' to '$maxzp'and x '$minxp' to '$maxxp' and y '$minyp' to '$maxyp'"]
		$sel frame $i
		$sel update
		set number [$sel num]
		#set molecule [expr $number/3.0]
		puts $file "$number"
	}
	$sel delete
	$pore delete

	close $file

	return
}

proc water_minus1_to_2 {args} {

	if {[llength $args] != 2} {
		puts "  Calulates number of water molecules across the entire channel"
        	puts "  Usage: water_whole_channel sim_mol_id output_prefix"
        	error ""
	}
	
	# Parse the arguments.
	set simMolID [lindex $args 0]
	set outputPrefix [lindex $args 1]

	# select water molecules
	
	set file [open "$outputPrefix-numberWaters_minus1_to_2.dat" w]

	# Selection loop
	set numFrames [molinfo $simMolID get numframes]
	for {set i 0 } {$i < $numFrames } { incr i } {
		set pore [atomselect $simMolID "protein and name CA and resid 37 40"]	
		$pore frame $i
		$pore update
		set pore_measure [measure minmax $pore]
		set pore_min [lindex $pore_measure 0]
		set pore_max [lindex $pore_measure 1]
		set minxp [lindex $pore_min 0]
		set maxxp [lindex $pore_max 0]
		set minyp [lindex $pore_min 1]
		set maxyp [lindex $pore_max 1]
		set minzp [lindex $pore_min 2]
		set maxzp [lindex $pore_max 2]
		set sel [atomselect $simMolID "name OH2 and z '$minzp' to '$maxzp'and x '$minxp' to '$maxxp' and y '$minyp' to '$maxyp'"]
		$sel frame $i
		$sel update
		set number [$sel num]
		#set molecule [expr $number/3.0]
		puts $file "$number"
	}
	$sel delete
	$pore delete

	close $file

	return
}

proc water_2_to_6 {args} {

	if {[llength $args] != 2} {
		puts "  Calulates number of water molecules across the entire channel"
        	puts "  Usage: water_whole_channel sim_mol_id output_prefix"
        	error ""
	}
	
	# Parse the arguments.
	set simMolID [lindex $args 0]
	set outputPrefix [lindex $args 1]

	# select water molecules
	
	set file [open "$outputPrefix-numberWaters_2_to_6.dat" w]

	# Selection loop
	set numFrames [molinfo $simMolID get numframes]
	for {set i 0 } {$i < $numFrames } { incr i } {
		set pore [atomselect $simMolID "protein and name CA and resid 40 44"]	
		$pore frame $i
		$pore update
		set pore_measure [measure minmax $pore]
		set pore_min [lindex $pore_measure 0]
		set pore_max [lindex $pore_measure 1]
		set minxp [lindex $pore_min 0]
		set maxxp [lindex $pore_max 0]
		set minyp [lindex $pore_min 1]
		set maxyp [lindex $pore_max 1]
		set minzp [lindex $pore_min 2]
		set maxzp [lindex $pore_max 2]
		set sel [atomselect $simMolID "name OH2 and z '$minzp' to '$maxzp'and x '$minxp' to '$maxxp' and y '$minyp' to '$maxyp'"]
		$sel frame $i
		$sel update
		set number [$sel num]
		#set molecule [expr $number/3.0]
		puts $file "$number"
	}
	$sel delete
	$pore delete

	close $file

	return
}

proc water_6_to_9 {args} {

	if {[llength $args] != 2} {
		puts "  Calulates number of water molecules across the entire channel"
        	puts "  Usage: water_whole_channel sim_mol_id output_prefix"
        	error ""
	}
	
	# Parse the arguments.
	set simMolID [lindex $args 0]
	set outputPrefix [lindex $args 1]

	# select water molecules
	
	set file [open "$outputPrefix-numberWaters_6_to_9.dat" w]

	# Selection loop
	set numFrames [molinfo $simMolID get numframes]
	for {set i 0 } {$i < $numFrames } { incr i } {
		set pore [atomselect $simMolID "protein and name CA and resid 44 47"]	
		$pore frame $i
		$pore update
		set pore_measure [measure minmax $pore]
		set pore_min [lindex $pore_measure 0]
		set pore_max [lindex $pore_measure 1]
		set minxp [lindex $pore_min 0]
		set maxxp [lindex $pore_max 0]
		set minyp [lindex $pore_min 1]
		set maxyp [lindex $pore_max 1]
		set minzp [lindex $pore_min 2]
		set maxzp [lindex $pore_max 2]
		set sel [atomselect $simMolID "name OH2 and z '$minzp' to '$maxzp'and x '$minxp' to '$maxxp' and y '$minyp' to '$maxyp'"]
		$sel frame $i
		$sel update
		set number [$sel num]
		#set molecule [expr $number/3.0]
		puts $file "$number"
	}
	$sel delete
	$pore delete

	close $file

	return
}

proc water_9_to_13 {args} {

	if {[llength $args] != 2} {
		puts "  Calulates number of water molecules across the entire channel"
        	puts "  Usage: water_whole_channel sim_mol_id output_prefix"
        	error ""
	}
	
	# Parse the arguments.
	set simMolID [lindex $args 0]
	set outputPrefix [lindex $args 1]

	# select water molecules
	
	set file [open "$outputPrefix-numberWaters_9_to_13.dat" w]

	# Selection loop
	set numFrames [molinfo $simMolID get numframes]
	for {set i 0 } {$i < $numFrames } { incr i } {
		set pore [atomselect $simMolID "protein and name CA and resid 47 51"]	
		$pore frame $i
		$pore update
		set pore_measure [measure minmax $pore]
		set pore_min [lindex $pore_measure 0]
		set pore_max [lindex $pore_measure 1]
		set minxp [lindex $pore_min 0]
		set maxxp [lindex $pore_max 0]
		set minyp [lindex $pore_min 1]
		set maxyp [lindex $pore_max 1]
		set minzp [lindex $pore_min 2]
		set maxzp [lindex $pore_max 2]
		set sel [atomselect $simMolID "name OH2 and z '$minzp' to '$maxzp'and x '$minxp' to '$maxxp' and y '$minyp' to '$maxyp'"]
		$sel frame $i
		$sel update
		set number [$sel num]
		#set molecule [expr $number/3.0]
		puts $file "$number"
	}
	$sel delete
	$pore delete

	close $file

	return
}

proc water_13_to_16 {args} {

	if {[llength $args] != 2} {
		puts "  Calulates number of water molecules across the entire channel"
        	puts "  Usage: water_whole_channel sim_mol_id output_prefix"
        	error ""
	}
	
	# Parse the arguments.
	set simMolID [lindex $args 0]
	set outputPrefix [lindex $args 1]

	# select water molecules
	
	set file [open "$outputPrefix-numberWaters_13_to_16.dat" w]

	# Selection loop
	set numFrames [molinfo $simMolID get numframes]
	for {set i 0 } {$i < $numFrames } { incr i } {
		set pore [atomselect $simMolID "protein and name CA and resid 51 54"]	
		$pore frame $i
		$pore update
		set pore_measure [measure minmax $pore]
		set pore_min [lindex $pore_measure 0]
		set pore_max [lindex $pore_measure 1]
		set minxp [lindex $pore_min 0]
		set maxxp [lindex $pore_max 0]
		set minyp [lindex $pore_min 1]
		set maxyp [lindex $pore_max 1]
		set minzp [lindex $pore_min 2]
		set maxzp [lindex $pore_max 2]
		set sel [atomselect $simMolID "name OH2 and z '$minzp' to '$maxzp'and x '$minxp' to '$maxxp' and y '$minyp' to '$maxyp'"]
		$sel frame $i
		$sel update
		set number [$sel num]
		#set molecule [expr $number/3.0]
		puts $file "$number"
	}
	$sel delete
	$pore delete

	close $file

	return
}

proc water_16_to_20 {args} {

	if {[llength $args] != 2} {
		puts "  Calulates number of water molecules across the entire channel"
        	puts "  Usage: water_whole_channel sim_mol_id output_prefix"
        	error ""
	}
	
	# Parse the arguments.
	set simMolID [lindex $args 0]
	set outputPrefix [lindex $args 1]

	# select water molecules
	
	set file [open "$outputPrefix-numberWaters_16_to_20.dat" w]

	# Selection loop
	set numFrames [molinfo $simMolID get numframes]
	for {set i 0 } {$i < $numFrames } { incr i } {
		set pore [atomselect $simMolID "protein and name CA and resid 54 58"]	
		$pore frame $i
		$pore update
		set pore_measure [measure minmax $pore]
		set pore_min [lindex $pore_measure 0]
		set pore_max [lindex $pore_measure 1]
		set minxp [lindex $pore_min 0]
		set maxxp [lindex $pore_max 0]
		set minyp [lindex $pore_min 1]
		set maxyp [lindex $pore_max 1]
		set minzp [lindex $pore_min 2]
		set maxzp [lindex $pore_max 2]
		set sel [atomselect $simMolID "name OH2 and z '$minzp' to '$maxzp'and x '$minxp' to '$maxxp' and y '$minyp' to '$maxyp'"]
		$sel frame $i
		$sel update
		set number [$sel num]
		#set molecule [expr $number/3.0]
		puts $file "$number"
	}
	$sel delete
	$pore delete

	close $file

	return
}

proc water_all {args} {

	if {[llength $args] != 2} {
		puts "  Calulates number of water molecules across the entire channel"
        	puts "  Usage: water_whole_channel sim_mol_id output_prefix"
        	error ""
	}
	
	# Parse the arguments.
	set simMolID [lindex $args 0]
	set outputPrefix [lindex $args 1]

	set file [open "$outputPrefix-numberWaters_minus1_to_2.dat" w]
	# Selection loop
	set numFrames [molinfo $simMolID get numframes]
	for {set i 0 } {$i < $numFrames } { incr i } {
		
		set pore [atomselect $simMolID "protein and name CA and resid 37 40"]	
		$pore frame $i
		$pore update
		set pore_measure [measure minmax $pore]
		set pore_min [lindex $pore_measure 0]
		set pore_max [lindex $pore_measure 1]
		set minxp [lindex $pore_min 0]
		set maxxp [lindex $pore_max 0]
		set minyp [lindex $pore_min 1]
		set maxyp [lindex $pore_max 1]
		set minzp [lindex $pore_min 2]
		set maxzp [lindex $pore_max 2]
		set sel [atomselect $simMolID "name OH2 and z '$minzp' to '$maxzp'and x '$minxp' to '$maxxp' and y '$minyp' to '$maxyp'"]
		$sel frame $i
		$sel update
		set number [$sel num]
		#set molecule [expr $number/3.0]
		puts $file "$number"
	}
	$sel delete
	$pore delete

	close $file

	set file1 [open "$outputPrefix-numberWaters_2_to_6.dat" w]


	# Selection loop
	for {set i 0 } {$i < $numFrames } { incr i } {
		set pore [atomselect $simMolID "protein and name CA and resid 40 44"]	
		$pore frame $i
		$pore update
		set pore_measure [measure minmax $pore]
		set pore_min [lindex $pore_measure 0]
		set pore_max [lindex $pore_measure 1]
		set minxp [lindex $pore_min 0]
		set maxxp [lindex $pore_max 0]
		set minyp [lindex $pore_min 1]
		set maxyp [lindex $pore_max 1]
		set minzp [lindex $pore_min 2]
		set maxzp [lindex $pore_max 2]
		set sel [atomselect $simMolID "name OH2 and z '$minzp' to '$maxzp'and x '$minxp' to '$maxxp' and y '$minyp' to '$maxyp'"]
		$sel frame $i
		$sel update
		set number [$sel num]
		#set molecule [expr $number/3.0]
		puts $file "$number"
	}
	$sel delete
	$pore delete

	close $file1

	set file2 [open "$outputPrefix-numberWaters_6_to_9.dat" w]

	# Selection loop
	for {set i 0 } {$i < $numFrames } { incr i } {
		set pore [atomselect $simMolID "protein and name CA and resid 44 47"]	
		$pore frame $i
		$pore update
		set pore_measure [measure minmax $pore]
		set pore_min [lindex $pore_measure 0]
		set pore_max [lindex $pore_measure 1]
		set minxp [lindex $pore_min 0]
		set maxxp [lindex $pore_max 0]
		set minyp [lindex $pore_min 1]
		set maxyp [lindex $pore_max 1]
		set minzp [lindex $pore_min 2]
		set maxzp [lindex $pore_max 2]
		set sel [atomselect $simMolID "name OH2 and z '$minzp' to '$maxzp'and x '$minxp' to '$maxxp' and y '$minyp' to '$maxyp'"]
		$sel frame $i
		$sel update
		set number [$sel num]
		#set molecule [expr $number/3.0]
		puts $file "$number"
	}
	$sel delete
	$pore delete

	close $file2

	set file3 [open "$outputPrefix-numberWaters_9_to_13.dat" w]

	# Selection loop
	for {set i 0 } {$i < $numFrames } { incr i } {
		set pore [atomselect $simMolID "protein and name CA and resid 47 51"]	
		$pore frame $i
		$pore update
		set pore_measure [measure minmax $pore]
		set pore_min [lindex $pore_measure 0]
		set pore_max [lindex $pore_measure 1]
		set minxp [lindex $pore_min 0]
		set maxxp [lindex $pore_max 0]
		set minyp [lindex $pore_min 1]
		set maxyp [lindex $pore_max 1]
		set minzp [lindex $pore_min 2]
		set maxzp [lindex $pore_max 2]
		set sel [atomselect $simMolID "name OH2 and z '$minzp' to '$maxzp'and x '$minxp' to '$maxxp' and y '$minyp' to '$maxyp'"]
		$sel frame $i
		$sel update
		set number [$sel num]
		#set molecule [expr $number/3.0]
		puts $file "$number"
	}
	$sel delete
	$pore delete

	close $file3

	set file4 [open "$outputPrefix-numberWaters_13_to_16.dat" w]

	# Selection loop
	set numFrames [molinfo $simMolID get numframes]
	for {set i 0 } {$i < $numFrames } { incr i } {
		set pore [atomselect $simMolID "protein and name CA and resid 51 54"]	
		$pore frame $i
		$pore update
		set pore_measure [measure minmax $pore]
		set pore_min [lindex $pore_measure 0]
		set pore_max [lindex $pore_measure 1]
		set minxp [lindex $pore_min 0]
		set maxxp [lindex $pore_max 0]
		set minyp [lindex $pore_min 1]
		set maxyp [lindex $pore_max 1]
		set minzp [lindex $pore_min 2]
		set maxzp [lindex $pore_max 2]
		set sel [atomselect $simMolID "name OH2 and z '$minzp' to '$maxzp'and x '$minxp' to '$maxxp' and y '$minyp' to '$maxyp'"]
		$sel frame $i
		$sel update
		set number [$sel num]
		#set molecule [expr $number/3.0]
		puts $file "$number"
	}
	$sel delete
	$pore delete

	close $file4

	set file5 [open "$outputPrefix-numberWaters_16_to_20.dat" w]

	# Selection loop
	for {set i 0 } {$i < $numFrames } { incr i } {
		set pore [atomselect $simMolID "protein and name CA and resid 54 58"]	
		$pore frame $i
		$pore update
		set pore_measure [measure minmax $pore]
		set pore_min [lindex $pore_measure 0]
		set pore_max [lindex $pore_measure 1]
		set minxp [lindex $pore_min 0]
		set maxxp [lindex $pore_max 0]
		set minyp [lindex $pore_min 1]
		set maxyp [lindex $pore_max 1]
		set minzp [lindex $pore_min 2]
		set maxzp [lindex $pore_max 2]
		set sel [atomselect $simMolID "name OH2 and z '$minzp' to '$maxzp'and x '$minxp' to '$maxxp' and y '$minyp' to '$maxyp'"]
		$sel frame $i
		$sel update
		set number [$sel num]
		#set molecule [expr $number/3.0]
		puts $file "$number"
	}
	$sel delete
	$pore delete

	close $file5

	return
}
