#!/bin/bash

vmd -dispdev text -e 00-extract.tcl -args $1 
vmd -dispdev text -e gen-gsh.tcl

vmd -dispdev text -e 02-change-segname.tcl
