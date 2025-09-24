package require psfgen

readpsf  comb.psf
readpsf memb.psf

coordpdb combaligned.pdb
coordpdb memb.pdb

writepsf membprolig.psf
writepdb membprolig.pdb
exit
