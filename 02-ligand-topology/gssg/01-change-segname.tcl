
set filepep [lindex $argv 0]
mol load psf $filepep.psf pdb $filepep.pdb

set all [atomselect top all]
set newseg [lindex $argv 1]

$all set segname $newseg
$all writepdb gsh-$newseg-$newseg.pdb
$all writepsf gsh-$newseg-$newseg.psf

exit
