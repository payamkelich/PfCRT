
proc extract_segment {selExpr segName outFile} {
    set sel [atomselect top $selExpr]
    $sel set segname $segName
    $sel writepdb $outFile
    $sel delete
}

set infile [lindex $argv 0]


mol new $infile type pdb waitfor all


extract_segment "resname GLU and resid 1"                                          A gsh-a.pdb
extract_segment "(resname CYS and resid 2) or (resname GLY and resid 3)"           B gsh-b.pdb
extract_segment "resname GLU and resid 4"                                          C gsh-c.pdb
extract_segment "(resname CYS and resid 5) or (resname GLY and resid 6)"           D gsh-d.pdb

exit
