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


segment A {
first NTER
last CTER
pdb gsh-a.pdb
}
segment B {
first none
last CTER
pdb gsh-b.pdb
}


patch LNGE  A:1 B:2

coordpdb gsh-a.pdb A
coordpdb gsh-b.pdb B

guesscoord
regenerate angles dihedrals
writepdb gsh_tmp.pdb
writepsf gsh_tmp.psf
exit
