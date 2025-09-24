package require psfgen

readpsf  gssg.psf
readpsf ini_0.psf

coordpdb ini_0.pdb
coordpdb gssg.pdb

writepsf comb.psf
writepdb comb.pdb
exit
