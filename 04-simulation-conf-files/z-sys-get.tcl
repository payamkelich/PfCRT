set in1 [lindex $argv 0]

menu main on
mol load psf ionized.psf dcd equ.0.dcd

# Loop to add files eq-e4.dcd to eq-e32.dcd
for {set i 1} {$i <= $in1} {incr i} {
    mol addfile "equ.$i.dcd" type dcd waitfor all
}

set nf [molinfo top get numframes]
set p [atomselect top "not water and not ions"]

$p writepsf z-tot-equ-check.psf
$p writepdb z-tot-equ-check.pdb
animate write dcd z-tot-equ-check.dcd sel $p

exit

