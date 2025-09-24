#!/bin/bash

vmd -dispdev text -e 00-extract.tcl -args $1 

vmd -dispdev text -e  gen-gsh-M.tcl 
vmd -dispdev text -e  gen-gsh-N.tcl 

vmd -dispdev text -e 01-change-segname.tcl -args gsh-N N
vmd -dispdev text -e 01-change-segname.tcl -args gsh-M M

vmd -dispdev text -e  gen-gssg.tcl

vmd -dispdev text -e 02-change-segname.tcl
