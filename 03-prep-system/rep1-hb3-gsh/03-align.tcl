

mol load pdb comb.pdb
mol load pdb promemb.pdb



set sel1 [atomselect 0 "protein and name CA and noh and not segname GSH"]
set sel2 [atomselect 1 "protein and name CA and noh"]
set sel3 [atomselect 0 "all"]


set trans_matrix [measure fit $sel1 $sel2]
$sel3 move $trans_matrix



$sel3 writepdb combaligned.pdb

exit

