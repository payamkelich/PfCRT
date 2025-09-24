
set ligSegname [lindex $argv 0]          ;
set PSF "z-tot-equ-check.psf"
set DCD "z-tot-equ-check.dcd"
set CUT 4.0                              ;

mol new $PSF type psf  waitfor all
mol addfile $DCD type dcd first 0 last 20000 waitfor all
set nframes [molinfo top get numframes]
puts $nframes
set ligSelStr "segname $ligSegname"
set lig  [atomselect top $ligSelStr]
set prot [atomselect top "protein and backbone"]


set fp [open "z_result_tcl_COMz.csv" w]
puts $fp "frame,zCOM(Å)"
set comz {}
for {set f 0} {$f < $nframes} {incr f} {
    $lig frame $f
    set z [lindex [measure center $lig weight mass] 2]
    puts $fp "$f,$z"
    lappend comz [list $f $z]
}
close $fp


set z0 [lindex [lindex $comz 0] 1]
set fp [open "z_result_tcl_MSDz.csv" w]
puts $fp "frame,MSDz(Å²)"
foreach pair $comz {
    set f  [lindex $pair 0]
    set dz [expr {[lindex $pair 1] - $z0}]
    puts $fp "$f,[expr {$dz*$dz}]"
}
close $fp


set ref    [atomselect top "protein and backbone and not segname $ligSegname" frame 0]
set mobile [atomselect top "protein and backbone and not segname $ligSegname"]
set fp [open "z_result_tcl_prot_RMSD.csv" w]
puts $fp "frame,RMSD(Å)"
for {set f 0} {$f < $nframes} {incr f} {
    $mobile frame $f
    $mobile move [measure fit $mobile $ref]
    puts $fp "$f,[measure rmsd $mobile $ref]"
}
close $fp


atomselect top $ligSelStr
volmap density [atomselect top $ligSelStr] -res 1.0 -radscale 1.0 -weight mass -allframes -combine avg -o z_result_tcl_volmap_density.dx

exit

