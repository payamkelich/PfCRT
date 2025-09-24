proc calculate_system_info {sel_string} {

    set sel [atomselect top $sel_string]
    

    set chargeList [$sel get charge]
    set total_charge 0.0
    foreach ch $chargeList {
        set total_charge [expr {$total_charge + $ch}]
    }
    puts "Total charge for selection ($sel_string): $total_charge"
    

    set mass_center [measure center $sel]
    puts "Mass center for selection ($sel_string): $mass_center"
    

    set minmaxVals [measure minmax $sel]
    set lower [lindex $minmaxVals 0]
    set upper [lindex $minmaxVals 1]
    

    set x_size [expr {[lindex $upper 0] - [lindex $lower 0]}]
    set y_size [expr {[lindex $upper 1] - [lindex $lower 1]}]
    set z_size [expr {[lindex $upper 2] - [lindex $lower 2]}]
    puts "Box sizes for selection ($sel_string): X: $x_size, Y: $y_size, Z: $z_size"
    

    set margin 15.0
    set sxm [expr {[lindex $lower 0] - $margin}]
    set sxp [expr {[lindex $upper 0] + $margin}]
    set sym [expr {[lindex $lower 1] - $margin}]
    set syp [expr {[lindex $upper 1] + $margin}]
    set szm [expr {[lindex $lower 2] - $margin}]
    set szp [expr {[lindex $upper 2] + $margin}]
    puts "Solvation cell sizes for selection ($sel_string):"
    puts "   X: [$sxm, $sxp]"
    puts "   Y: [$sym, $syp]"
    puts "   Z: [$szm, $szp]"
}



mol new ionized.psf
mol addfile ionized.pdb

calculate_system_info "all"
calculate_system_info "segname MEMB"

exit

