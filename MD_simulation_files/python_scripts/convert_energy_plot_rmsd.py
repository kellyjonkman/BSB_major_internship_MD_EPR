import json
from statistics import mean
######## SAVE VALUE PER SNAPSHOT

filename = 'rmsd.xvg'

file = open(filename,'rt')
data = file.readlines()

dict = {}

information = []

for line in data:
    listt = line.split()
    if line[0] == '#' or line[0] == '@':
        information.append(line)
        pass
    else:
        #ns
        number = listt[0].split('.')
        new_number = int(str(number[0])+str(number[1][0:2]))
        #ps
        #number = listt[0].split('.')
        #if len(number[0]) < 2:
        #    pass
        #else:
        #new_number = int(str(number[0][0:-1]))
        if new_number > 3000:
            dict[int(new_number-3000+1)] = listt[1]
file.close()

with open('rmsd_dictionary.txt', 'w') as file:
    file.write(json.dumps(dict))

####### SAVE SNAPSHOTS PER BIN

filename2 = 'bindex_rmsd.ndx'

file = open(filename2,'rt')
data = file.readlines()

matrix = []
bin_values = []

bin_nr = 0

for line in data:
    if '[' in line:
        matrix.append(bin_values)
        bin_values = []
        bin_nr += 1
    else:
        bin_values.append(float(line.strip()))
matrix.append(bin_values)
matrix = matrix[1:]
file.close()


####### CONNECT BINS TO VALUES OF SNAPSHOTS
new_matrix = []
values = []
for bin in matrix:
    for item in bin:
        if int(item) in dict.keys():
            values.append(float(dict[int(item)]))
    new_matrix.append(values)
    values = []
# print(new_matrix)

######### CALCULATE AVERAGE OF EVERY BIN

bin_averages = []

i = 0
#print(new_matrix)
for bin in new_matrix:
    if bin != []:
        average = mean(bin)
        maximum = max(bin)
        minimum = min(bin)
        bin_averages.append(average)
    print('for bin ' + str(i) + ' average = ' + str(average) + ' maximum = ' + str(maximum) + ' minimum = ' + str(minimum) + '\n')
    i += 1
    

###### COLLECT ENERGY DATA
filename3 = 'ener_rmsd.xvg'

file = open(filename3,'rt')
data = file.readlines()

energy_data = []


for line in data:
    energy = line.split()[1]
    energy_data.append(energy)
file.close()

########## WRITE NEW FILE

file = open('new_ener_rmsd.xvg','wt')
for line in information:
    file.write(line)
for i in list(range(31)):
    file.write(str(bin_averages[i]) + '\t' + str(energy_data[i]) + '\n')
    # print(line)
    # file.write(line+'\n')
file.close()

import os

os.system("python PlotXVG.py new_ener_rmsd.xvg -o new_ener_rmsd.png")
