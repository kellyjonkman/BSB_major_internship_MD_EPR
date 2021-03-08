#!/bin/bash

#SBATCH -N 1
#SBATCH -t 119:00:00
#SBATCH -e K11V_hex.err
#SBATCH -o K11V_hex.out

module load 2020 GROMACS

# Go to working directory 
cd /home/kjonkman/K11V_hexamer/withHs

# Convert PDB file into format readable by GROMACS
gmx pdb2gmx -f K11V_hex.pdb -o K11V_hex.gro -ff gromos54a7_atb -ter -missing <<EOF
2
1
1
1
1
1
1
1
1
1
1
1
1
EOF

#creating a box
gmx editconf -f K11V_hex.gro -o K11V_hex_box.gro -c -d 1.0 -bt cubic

gmx grompp -f minim.mdp -c K11V_hex_box.gro -p topol.top -o em_vac.tpr -maxwarn 3
gmx mdrun -deffnm em_vac -v

#solvate
gmx solvate -cp em_vac.gro -o K11V_hex_solv.gro -p topol.top

#adding ions
gmx grompp -f ions.mdp -c K11V_hex_solv.gro -p topol.top -o ions.tpr -maxwarn 3
gmx genion -s ions.tpr -o K11V_hex_solv_ions.gro -p topol.top -pname NA -nname CL -neutral <<EOF
13
EOF

# Energy minimisation
gmx grompp -f minim.mdp -c K11V_hex_solv_ions.gro -p topol.top -o em.tpr -maxwarn 3
gmx mdrun -deffnm em -v
gmx energy -f em.edr -o potential.xvg<<EOF
10
EOF

# NVT equilibration
gmx grompp -f nvt.mdp -c em.gro -r em.gro -p topol.top -o nvt.tpr -maxwarn 3
gmx mdrun -deffnm nvt

gmx energy -f nvt.edr -o temperature.xvg<<EOF
16
EOF

#NPT equilibration
gmx grompp -f npt.mdp -c nvt.gro -r nvt.gro -t nvt.cpt -p topol.top -o npt.tpr -maxwarn 3
gmx mdrun -deffnm npt

gmx energy -f npt.edr -o pressure.xvg<<EOF
18
EOF

gmx energy -f npt.edr -o density.xvg<<EOF
24
EOF

# Run the simulation
gmx grompp -f md.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_1.tpr -maxwarn 3
gmx mdrun -deffnm md_0_1

# Post processing
gmx trjconv -s md_0_1.tpr -f md_0_1.xtc -o md_0_1_noPBC2.xtc -pbc whole<<EOF
0
EOF

gmx trjconv -s md_0_1.tpr -f md_0_1_noPBC2.xtc -o md_0_1_noPBC3.xtc -pbc cluster -center yes<<EOF
1
1
0
EOF

# Visualization
#RMSD
gmx rms -s md_0_1.tpr -f md_0_1_noPBC3.xtc -o rmsd.xvg -tu ns<<EOF
4
4
EOF


#Distance
gmx distance -n index.ndx -f md_0_1_noPBC3.xtc -s md_0_1.tpr -oav distaveall.xvg -oall distall.xvg -select 'com of group CA_A plus com of group CA_D plus com of group CA_B plus com of group CA_F plus com of group CA_C plus com of group CA_E'

#Save separate frames every 1ns
gmx trjconv -s md_0_1.tpr -f md_0_1_noPBC3.xtc -dt 1000 -o frames/frame.pdb -sep<<EOF
1
EOF

#Potential energy from RMSD and distance
gmx sham -f rmsd.xvg -b 30 -dist energy/ener_rmsd.xvg -histo energy/hist_rmsd.xvg -lp energy/prob_rmsd.xpm -ls energy/gibbs_rmsd.xpm -bin energy/bindex_rmsd.ndx
gmx sham -f distaveall.xvg -b 30000 -dist energy/ener_dist.xvg -histo energy/hist_dist.xvg -lp energy/prob_dist.xpm -ls energy/gibbs_dist.xpm -bin energy/bindex_dist.ndx
