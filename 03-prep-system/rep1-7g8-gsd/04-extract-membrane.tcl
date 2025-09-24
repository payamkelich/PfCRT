package require psfgen
mol load psf promemb.psf pdb promemb.pdb


set sel [atomselect top "segname MEMB"]

$sel writepsf memb.psf
$sel writepdb memb.pdb

exit

