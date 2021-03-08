#!/bin/bash

#SBATCH -N 1
#SBATCH -t 00:15:00
#SBATCH -e rotcor.err
#SBATCH -o rotcor.out

module load 2020 GROMACS

cd /home/kjonkman/T0EZ_monomer/withHs

gmx rotacf -f md_0_1_noPBC3.xtc -P 2 -b 30000 -e 250000 -n index2.ndx -s md_0_1.tpr -o rotcor/nitroxide.xvg <<EOF
0
EOF

gmx rotacf -f md_0_1_noPBC3.xtc -P 2 -b 30000 -e 250000 -n index2.ndx -s md_0_1.tpr -o rotcor/CA1.xvg <<EOF
1
EOF

gmx rotacf -f md_0_1_noPBC3.xtc -P 2 -b 30000 -e 250000 -n index2.ndx -s md_0_1.tpr -o rotcor/CA2.xvg <<EOF
2
EOF

gmx rotacf -f md_0_1_noPBC3.xtc -P 2 -b 30000 -e 250000 -n index2.ndx -s md_0_1.tpr -o rotcor/CA3.xvg <<EOF
3
EOF

gmx rotacf -f md_0_1_noPBC3.xtc -P 2 -b 30000 -e 250000 -n index2.ndx -s md_0_1.tpr -o rotcor/CA4.xvg <<EOF
4
EOF

gmx rotacf -f md_0_1_noPBC3.xtc -P 2 -b 30000 -e 250000 -n index2.ndx -s md_0_1.tpr -o rotcor/CA5.xvg <<EOF
5
EOF

gmx rotacf -f md_0_1_noPBC3.xtc -P 2 -b 30000 -e 250000 -n index2.ndx -s md_0_1.tpr -o rotcor/CA6.xvg <<EOF
6
EOF

gmx rotacf -f md_0_1_noPBC3.xtc -P 2 -b 30000 -e 250000 -n index2.ndx -s md_0_1.tpr -o rotcor/CA7.xvg <<EOF
7
EOF

gmx rotacf -f md_0_1_noPBC3.xtc -P 2 -b 30000 -e 250000 -n index2.ndx -s md_0_1.tpr -o rotcor/CA8.xvg <<EOF
8
EOF

gmx rotacf -f md_0_1_noPBC3.xtc -P 2 -b 30000 -e 250000 -n index2.ndx -s md_0_1.tpr -o rotcor/CA9.xvg <<EOF
9
EOF

gmx rotacf -f md_0_1_noPBC3.xtc -P 2 -b 30000 -e 250000 -n index2.ndx -s md_0_1.tpr -o rotcor/CA10.xvg <<EOF
10
EOF

gmx rotacf -f md_0_1_noPBC3.xtc -P 2 -b 30000 -e 250000 -n index2.ndx -s md_0_1.tpr -o rotcor/CA11.xvg <<EOF
11
EOF

gmx rotacf -f md_0_1_noPBC3.xtc -P 2 -b 30000 -e 250000 -n index2.ndx -s md_0_1.tpr -o rotcor/CA12.xvg <<EOF
12
EOF

gmx rotacf -f md_0_1_noPBC3.xtc -P 2 -b 30000 -e 250000 -n index2.ndx -s md_0_1.tpr -o rotcor/CA13.xvg <<EOF
13
EOF
