package require psfgen	
psfcontext reset 
topology ../toppar/top_all36_prot.rtf	
topology ../toppar/top_all36_cgenff.rtf
topology ../toppar/toppar_water_ions_cufix.str 

pdbalias residue HIS HSE	 
pdbalias atom ILE CD1 CD

segment PRA1 {
	pdb forcharmguihb3.pdb
	mutate 180 HSP  
	mutate 273 HSP  
	first ACE
	last CT3
}
#############################################################################
patch DISU PRA1:289 PRA1:312
patch DISU PRA1:301 PRA1:309
patch ASPP PRA1:329
patch GLUP PRA1:95
patch GLUP PRA1:198
patch GLUP PRA1:232
#############################################################################
coordpdb forcharmguihb3.pdb PRA1

guesscoord
regenerate angles dihedrals
#############################################################################
writepdb ini_0.pdb	 
writepsf ini_0.psf
#############################################################################

exit


#ASP 329 5.98
#GLU  95 7.33           
#GLU 198 6.10          
#GLU 232 6.10  
#HIS 180 6.03
#HIS 273 6.81    
