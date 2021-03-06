%% Load data
clear, clc, clf

[Field,Spec] = eprload('CP2_L_20210115_04'); %load the settings
Spec = Spec/max(Spec); % scale spectrum
Field = Field/10;
Field = Field + 0.025;



%% Defining the spin system

Sys1.S = 1/2;
Sys1.g = [2.00906 2.00687 2.0030];
Sys1.Nucs = '14N';
Sys1.A = [13 13 108];
Sys1.lwpp = 0.15; % mT
Sys1.tcorr = 0.065e-9; %sec

Sys2.S = 1/2;                         
Sys2.g = [(2.00906+2.00687+2.0030)/3];
Sys2.lwpp = [0 3];

Sys3.S = 1/2;                         
Sys3.g = [2.00906 2.00687 2.0030];
Sys3.Nucs = '14N';
Sys3.A = [13 108];
Sys3.lwpp = [0.14];
Sys3.tcorr = 2e-9; %sec


Exp.mwFreq = 9.882628 %GHz
Exp.nPoints = length(Spec);



%% simulations
[SimField1 SimSpec1] = chili(Sys1,Exp);
SimSpec1_int = cumtrapz(SimSpec1);
SimSpec1_doubleintegral = cumtrapz(SimSpec1_int);
SimSpc1 = SimSpec1/max(SimSpec1_doubleintegral);

[SimField2 SimSpec2] = pepper(Sys2,Exp);
SimSpec2_int = cumtrapz(SimSpec2);
SimSpec2_doubleintegral = cumtrapz(SimSpec2_int);
SimSpc2 = SimSpec2/max(SimSpec2_doubleintegral);


spctotal = 0.05*SimSpc1+0.95*SimSpc2;
spctotal0 = spctotal/max(spctotal);

spctotal01 = SimSpc1;
spctotal1 = 0.05*(spctotal01/max(spctotal));

spctotal02 = SimSpc2;
spctotal2 = 0.95*(spctotal02/max(spctotal));


figure(2)
plot(Field,Spec,'k',SimField1,spctotal0,'r','LineWidth',3)
xlabel('Field [mT]','FontSize',25)
legend({'Exp','Sim'},'FontSize',25)
axis tight;
ax = gca;
ax.FontSize = 25; 
%saveas(gcf,'C:\Users\keljo\Documents\Stage\easyspin\simulaties\figures\CP2_L_PBS_simnew','epsc')
%saveas(gcf,'C:\Users\keljo\Documents\Stage\easyspin\simulaties\figures\CP2_L_PBS_simnew.png')

figure(3)
plot(Field,Spec,'k',SimField1,spctotal0,'r',SimField1,spctotal1,'b',SimField1,spctotal2,'g','LineWidth',3)
xlabel('Field [mT]','FontSize',25)
legend({'Exp','Sim','Fast','Spin-spin'},'FontSize',25)
axis tight;
ax = gca;
ax.FontSize = 25; 
%saveas(gcf,'C:\Users\keljo\Documents\Stage\easyspin\simulaties\figures\CP2_L_PBS_sim2new','epsc')
%saveas(gcf,'C:\Users\keljo\Documents\Stage\easyspin\simulaties\figures\CP2_L_PBS_sim2new.png')
