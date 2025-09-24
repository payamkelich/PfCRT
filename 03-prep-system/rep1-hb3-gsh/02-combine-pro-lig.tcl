package require psfgen

readpsf  gsh.psf
readpsf ini_0.psf

coordpdb ini_0.pdb
coordpdb gsh.pdb

writepsf comb.psf
writepdb comb.pdb
exit
