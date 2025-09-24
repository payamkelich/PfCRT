#!/bin/bash
vmd -dispdev text -e  01-pro-psf-gen.tcl
vmd -dispdev text -e  02-combine-pro-lig.tcl
vmd -dispdev text -e  03-align.tcl
vmd -dispdev text -e  04-extract-membrane.tcl
vmd -dispdev text -e  05-combine-pro-memb.tcl
vmd -dispdev text -e  06-solvent-ionized.tcl


