
set ligSegname [lindex $argv 0]          
set PSF "z-tot-equ-check.psf"
set DCD "z-tot-equ-check.dcd"
set CUT 4.0                              


mol new $PSF type psf  waitfor all
mol addfile $DCD type dcd first 0 last 20000 waitfor all
set nframes [molinfo top get numframes]
puts $nframes
set ligSelStr "segname $ligSegname"
set lig  [atomselect top $ligSelStr]
set prot [atomselect top "protein and backbone"]



set ref    [atomselect top "segname $ligSegname" frame 0]
set mobile [atomselect top "segname $ligSegname"]
set fp [open "z_result_tcl_lig_RMSD.csv" w]
puts $fp "frame,RMSD(Å)"
for {set f 0} {$f < $nframes} {incr f} {
    $mobile frame $f
    $mobile move [measure fit $mobile $ref]
    puts $fp "$f,[measure rmsd $mobile $ref]"
}
close $fp


exit

