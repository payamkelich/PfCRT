mol new ionized.pdb
set all [atomselect top all]
$all set beta 0
$all set occupancy 0

set m [atomselect top "segname MEMB"]
set commem [measure center $m weight mass]
foreach {_, _, zmc3} $commem {break}

puts "mass center of memb is: $zmc3"

set sel2_l [atomselect top "segname MEMB and name P and z<$zmc3"]
set sel2_u [atomselect top "segname MEMB and name P and z>$zmc3"]
set sel3_l [atomselect top "segname MEMB and resname CHL1 and name O3 and z<$zmc3"]
set sel3_u [atomselect top "segname MEMB and resname CHL1 and name O3 and z>$zmc3"]


set masslowermemb [measure center $sel2_l ]
set massuppermemb [measure center $sel2_u ]
set masslowerchl1 [measure center $sel3_l ]
set massupperchl1 [measure center $sel3_u ] 

puts "memb low: $masslowermemb memb up: $massuppermemb chl1 low: $masslowerchl1 chl1 up: $massupperchl1"



set mysel [atomselect top "(helix and backbone) or (segname GSD)"]
$mysel set beta 1

$all writepdb restraints.pdb

$all set beta 0
$all set occupancy 0
$sel2_l set beta 1
$all writepdb PO_head_lower.pdb

$all set beta 0
$all set occupancy 0
$sel3_l set beta 1
$all writepdb CH_head_lower.pdb

$all set beta 0
$all set occupancy 0
$sel2_u set beta 1
$all writepdb PO_head_upper.pdb

$all set beta 0
$all set occupancy 0
$sel3_u set beta 1
$all writepdb CH_head_upper.pdb

exit
