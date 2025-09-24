load ./qwrap/jhenin-qwrap-961567d/qwrap.so

package require qwrap


mol load psf ionized.psf dcd equ.7.dcd

qwrap sel "not protein" center protein

set nf [molinfo top get numframes]
set p [atomselect top "not water and not ions"]

$p writepsf z-tot-equ-check.psf
$p writepdb z-tot-equ-check.pdb
animate write dcd z-tot-equ-check.dcd sel $p

exit

