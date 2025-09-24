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


readpsf gsh-M-M.psf
readpsf gsh-N-N.psf

coordpdb gsh-M-M.pdb M
coordpdb gsh-N-N.pdb N

patch DISU  M:2 N:5

guesscoord
writepdb gssg_tmp.pdb
writepsf gssg_tmp.psf

exit
