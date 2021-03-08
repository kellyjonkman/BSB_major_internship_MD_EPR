%% Load data
clear, clc, clf

[Field,Spec] = eprload('E1_20201124_06.par'); %load the settings
Spec = Spec/max(Spec); % scale spectrum
Field = Field/10;
Field = Field + 0.045;


%% Defining the spin system

Sys1.S = 1/2;
Sys1.g = [2.00906 2.00687 2.0030];

Sys1.Nucs = '14N';
Sys1.A = [13 108];
Sys1.lwpp = 0.15; % mT
Sys1.tcorr = 0.11e-9; %sec

Sys2.S = 1/2;                         
Sys2.g = [2.00906 2.00687 2.0030];
Sys2.Nucs = '14N';
Sys2.A = [13 108];
Sys2.lwpp = 0.15;
Sys2.tcorr = 4.1e-9; %sec


Exp.mwFreq = 9.882948 %GHz
Exp.nPoints = length(Spec);



%% Simulations 
[SimField1 SimSpec1] = chili(Sys1,Exp);
SimSpec1_int = cumtrapz(SimSpec1);
SimSpec1_doubleintegral = cumtrapz(SimSpec1_int);
SimSpc1 = SimSpec1/max(SimSpec1_doubleintegral);

[SimField2 SimSpec2] = chili(Sys2,Exp);
SimSpec2_int = cumtrapz(SimSpec2);
SimSpec2_doubleintegral = cumtrapz(SimSpec2_int);
SimSpc2 = SimSpec2/max(SimSpec2_doubleintegral);

% Scaling components
spctotal = 0.0775*SimSpc1+0.9225*SimSpc2;
spctotal0 = (spctotal/max(spctotal));

spctotal01 = SimSpc1;
spctotal1 = 0.0775*(spctotal01/max(spctotal));

spctotal02 = SimSpc2;
spctotal2 = 0.9225*(spctotal02/max(spctotal));

%figures
figure(2)
plot(Field,Spec,'k',SimField1,spctotal0,'r','LineWidth',3)
xlabel('Field [mT]','FontSize',25)
legend({'Exp','Sim'},'FontSize',25)
axis tight;
ax = gca;
ax.FontSize = 25; 
%saveas(gcf,'C:\Users\keljo\Documents\Stage\easyspin\simulaties\figures\AB_WT_CP2_PBS_sim','epsc')
%saveas(gcf,'C:\Users\keljo\Documents\Stage\easyspin\simulaties\figures\AB_WT_CP2_PBS_sim.png')

figure(3)
plot(Field,Spec,'k',SimField1,spctotal0,'r',SimField1,spctotal1,'b',SimField1,spctotal2,'g','LineWidth',3)
xlabel('Field [mT]','FontSize',25)
legend({'Exp','Sim','Fast','Slow'},'FontSize',25)
axis tight;
ax = gca;
ax.FontSize = 25; 
%saveas(gcf,'C:\Users\keljo\Documents\Stage\easyspin\simulaties\figures\AB_WT_CP2_PBS_sim2','epsc')
%saveas(gcf,'C:\Users\keljo\Documents\Stage\easyspin\simulaties\figures\AB_WT_CP2_PBS_sim2.png')




