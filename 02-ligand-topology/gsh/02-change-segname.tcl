
set filepep [lindex $argv 0]
mol load psf gsh_tmp.psf pdb gsh_tmp.pdb

set all [atomselect top all]
set newseg [lindex $argv 1]

$all set segname GSH
$all writepdb gsh.pdb
$all writepsf gsh.psf

exit


