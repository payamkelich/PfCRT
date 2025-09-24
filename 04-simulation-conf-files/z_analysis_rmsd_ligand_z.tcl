
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


set z_ref [$ref get z]
set n_atoms [llength $z_ref]

set fp [open "z_rmsd_tcl_lig_z.csv" w]
puts $fp "frame,RMSD_z(Å)"

for {set f 0} {$f < $nframes} {incr f} {

    $mobile frame $f
    $mobile move [measure fit $mobile $ref]


    set z_mob [$mobile get z]


    set sum_sq 0.0
    for {set i 0} {$i < $n_atoms} {incr i} {
        set dz [expr {[lindex $z_mob $i] - [lindex $z_ref $i]}]
        set sum_sq [expr {$sum_sq + $dz*$dz}]
    }


    set rmsd_z [expr {sqrt($sum_sq / $n_atoms)}]
    puts $fp "$f,$rmsd_z"
}

close $fp
exit
