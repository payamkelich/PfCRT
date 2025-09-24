if {1} {

package require solvate
solvate membprolig.psf membprolig.pdb -o solvated -s WF -x 0 -y 0 -z 19 +x 0 +y 0 +z 19 -b 2 -stop ../toppar/toppar_water_ions_cufix.str 

file delete solvated.log

mol delete all

mol load psf solvated.psf pdb solvated.pdb
set LIPIDZ [atomselect top "segname MEMB and (name P O3)"]
set LIPID [atomselect top "segname MEMB"]

set vZ [measure minmax $LIPIDZ ]
set v [measure minmax $LIPID ]

set MAX_Z [lindex $vZ {1 2}]
set MIN_Z [lindex $vZ {0 2}]
set MAX_X [lindex $v {1 0}]
set MIN_X [lindex $v {0 0}]
set MAX_Y [lindex $v {1 1}]
set MIN_Y [lindex $v {0 1}]

set seltext1 "(same residue as water and (z < $MAX_Z and z > $MIN_Z and x < $MAX_X and x > $MIN_X and y < $MAX_Y and y > $MIN_Y) and not (segname WDO))"
set seltext2 "(same residue as (water and (not segname WDO) and (within 1 of not water)))"
set watSel [atomselect top "not ($seltext1) and not ($seltext2)"]


$watSel writepdb solvated2.pdb
$watSel writepsf solvated2.psf
}
package require autoionize
autoionize -psf solvated2.psf -pdb solvated2.pdb -neutralize -o ionized_ini
autoionize -psf ionized_ini.psf -pdb ionized_ini.pdb -sc 0.150 -o ionized

exit
