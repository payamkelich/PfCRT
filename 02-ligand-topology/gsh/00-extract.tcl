
# Usage (from the command line):
#   vmd -dispdev text -e 00-extract.tcl -args input.pdb


set infile [lindex $argv 0]


mol new $infile type pdb waitfor all


set selA [atomselect top "resname GLU"]

$selA set segname A

$selA writepdb gsh-a.pdb
$selA delete


set selB [atomselect top "resname CYS or resname GLY"]
$selB set segname B
$selB writepdb gsh-b.pdb
$selB delete


exit

