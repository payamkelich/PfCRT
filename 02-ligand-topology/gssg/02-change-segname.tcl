
set filepep [lindex $argv 0]
mol load psf gssg_tmp.psf pdb gssg_tmp.pdb

set all [atomselect top all]
set newseg [lindex $argv 1]

$all set segname GSD
$all writepdb gssg.pdb
$all writepsf gssg.psf

exit


