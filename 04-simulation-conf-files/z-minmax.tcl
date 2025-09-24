mol new     ionized.psf
mol addfile ionized.pdb

set sel [atomselect top "all"]

set clst [$sel get charge]

set chtot 0.0
foreach ch $clst {
  set chtot [expr $chtot+$ch]
}

puts  "the charge is: $chtot"



set a [atomselect 0 "segname MEMB"]
set all [atomselect 0 all]
set masscenterall [measure center $all]
set masscentermemb [measure center $a]
set c [ measure minmax $a ]
puts "masscenter is $masscenterall"

foreach { c1 c2 } $c { break }
set c11 $c1
set c22 $c2

foreach { x0 y0 z0 } $c11 { break }
set cx0 $x0
set cy0 $y0
set cz0 $z0

foreach { x1 y1 z1 } $c22 { break }
set cx1 $x1
set cy1 $y1
set cz1 $z1

set xx [ expr ($x1-$x0) ]
set yy [ expr ($y1-$y0) ]
set zz [ expr ($z1-$z0) ]

puts "Cell sizes $xx $yy $zz"

set sxm [ expr ($x0-15.0) ]
set sxp [ expr ($x1+15.0) ]
set sym [ expr ($y0-15.0) ]
set syp [ expr ($y1+15.0) ]
set szm [ expr ($z0-15.0) ]
set szp [ expr ($z1+15.0) ]
puts "Solvate cell sizes X $sxm, $sxp, Y $sym, $syp, Z, $szm, $szp"

exit
