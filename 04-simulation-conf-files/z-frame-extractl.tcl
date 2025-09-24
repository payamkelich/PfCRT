
mol new z-tot-equ-check.psf type psf waitfor all


mol addfile z-tot-equ-check.dcd type dcd waitfor all


set frames {0 4999 9999 14999 19999}


foreach f $frames {
    puts "Extracting frame $f ..."

    animate goto $f


    set sel [atomselect top "not segname MEMB"]


    set outfile [format "z-frame-%d.pdb" $f]


    $sel writepdb $outfile
    $sel writepsf z-frame-all.psf

    $sel delete
}


exit

