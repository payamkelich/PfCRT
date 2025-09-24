set ligSegname [lindex $argv 0]       

mol new z-tot-equ-check.psf
mol addfile z-tot-equ-check.dcd first 0 last 20000 waitfor all


set lig [atomselect top "segname $ligSegname and noh"]
set rec [atomselect top "protein and not segname $ligSegname and noh"]

set nframes [molinfo top get numframes]

set resids [lsort -unique -integer [$rec get resid]]

array set count {}
array set name {}
foreach r $resids {
    set count($r) 0
    set sel0 [atomselect top "protein and resid $r" frame 0]
    set name($r) [lindex [$sel0 get resname] 0]
    $sel0 delete
}

for {set frame 0} {$frame < $nframes} {incr frame} {
    $lig frame $frame; $lig update
    $rec frame $frame; $rec update

    set contacts [measure contacts 4.0 $rec $lig]
    set idxs     [lindex $contacts 0]
    if {[llength $idxs] > 0} {
        set sel [atomselect top "index [join $idxs { }]" frame $frame]
        foreach r [lsort -unique -integer [$sel get resid]] {
            incr count($r)
        }
        $sel delete
    }
}

set fp [open "z_result_tcl_protein_contacts.csv" w]
puts $fp "resid,resname,frames_in_contact"
foreach r $resids {
    puts $fp "$r,$name($r),$count($r)"
}
close $fp

exit
