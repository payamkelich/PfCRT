package require psfgen
resetpsf

topology top_all36_prot.rtf

topology patch.inp


pdbalias residue HOH TIP3
pdbalias residue HIS HSE
pdbalias atom ILE CD1 CD
pdbalias atom TIP3 O OH2
pdbalias atom LEU CD1 CD2
pdbalias atom LEU CD2 CD1


segment C {
first NTER
last CTER
pdb gsh-c.pdb
}
segment D {
first none
last CTER
pdb gsh-d.pdb
}




patch LNGE  C:4 D:5

coordpdb gsh-c.pdb C
coordpdb gsh-d.pdb D

guesscoord
regenerate angles dihedrals
writepdb gsh-N.pdb
writepsf gsh-N.psf
exit
