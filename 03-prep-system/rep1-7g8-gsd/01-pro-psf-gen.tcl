package require psfgen	
psfcontext reset 
topology ../toppar/top_all36_prot.rtf	
topology ../toppar/top_all36_cgenff.rtf
topology ../toppar/toppar_water_ions_cufix.str 

pdbalias residue HIS HSE	 
pdbalias atom ILE CD1 CD

segment PRA1 {
	pdb forcharmgui7g8.pdb
	mutate 97  HSP  
	mutate 123 HSP  
	mutate 180  HSP  
	mutate 273  HSP  
	first ACE
	last CT3
}
#############################################################################
patch DISU PRA1:289 PRA1:312
patch DISU PRA1:301 PRA1:309
patch ASPP PRA1:329
patch GLUP PRA1:95
patch GLUP PRA1:198
#############################################################################
coordpdb forcharmgui7g8.pdb PRA1

guesscoord
regenerate angles dihedrals
#############################################################################
writepdb ini_0.pdb	 
writepsf ini_0.psf
#############################################################################

exit

#ASP 329    7.08
#GLU  95    5.59
#GLU 198    6.01
#HIS  97   10.21
#HIS 123    6.13
#HIS 180    5.97
#HIS 273    6.09
