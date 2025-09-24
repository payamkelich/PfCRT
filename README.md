# MD Simulation Workflow

This repository contains the complete workflow for setting up, running, and analyzing molecular dynamics (MD) simulations. The process is organized into five main stages, from initial docking to final data analysis and figure generation.

---

### **Software Requirements**
* **Simulation Engine:** NAMD3
* **Analysis & Visualization:** VMD 1.9.4
* **Plotting:** Python with Jupyter Notebooks

---

## **Workflow Steps**

### **1. Molecular Docking (`01-docking`)**
The first step is to perform molecular docking to predict the binding poses of the ligands.
* **Receptor files:** `7g8.pdbqt`, `hb3.pdbqt`
* **Ligand files:** `gsd.pdbqt` (GSSG), `gsh.pdbqt` (GSH)
* The specific commands used for docking are detailed in `docking_command.txt`.

### **2. Ligand Topology Generation (`02-ligand-topology`)**
After docking, the top five binding poses are extracted, and their corresponding CHARMM topology and parameter files are generated.
* This directory contains TCL and shell scripts to automate the generation of PDB and PSF files for both the **GSH** and **GSSG** ligands.
* The `00-extract.tcl` script is used to convert the top poses from the docking output into PDB format.
* The `make_psf.sh` script orchestrates the generation of the final topology files.

### **3. System Preparation (`03-prep-system`)**
This stage involves building the complete, simulation-ready system. The protein-ligand complex is embedded in a lipid membrane, solvated with water, and neutralized with ions.
* Example build scripts are provided for different replicates (e.g., `rep1-7g8-gsd`, `rep1-hb3-gsh`).
* Within each example folder, a series of numbered TCL scripts (`01-pro-psf-gen.tcl`, `02-combine-pro-lig.tcl`, etc.) are executed sequentially to build the system. The `z-all-tcl.sh` script can be used to run all steps automatically.
* All necessary CHARMM force field files (`.prm`, `.rtf`) are located in the `toppar/` directory.

### **4. MD Simulation and Analysis (`04-simulation-conf-files`)**
This directory contains all the necessary configuration files for running the equilibration and production MD simulations with NAMD.
* **Equilibration:** A series of configuration files (`equ.0.conf` through `equ.7.conf`) are used for a stepwise relaxation of the system.
* **Production:** The `col.conf` file is used for the final production run.
* **Analysis:** Post-simulation analysis is performed using the various VMD TCL scripts provided (e.g., `z_analysis_rmsd.tcl`, `z_analysis_contact.tcl`).

### **5. Figure Generation (`05-jupyter-notebooks-for-figures`)**
The final step is to process the analysis output and generate plots for publication.
* `z-main-manuscript.ipynb`: Jupyter Notebook for creating the primary figures used in the main manuscript.
* `z-plots-SI.ipynb`: Jupyter Notebook for creating supplementary information figures.
