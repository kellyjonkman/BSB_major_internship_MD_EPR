%% Load data
clear, clc, clf

[Field,Spec] = eprload('BP_20201120_03.par'); %load the settings
Spec = Spec/max(Spec); % scale spectrum
Field = Field/10;
Field = Field + 0.08;


%% Defining the spin system
Sys1.S = 1/2;
Sys1.g = [2.00906 2.00687 2.0030];
Sys1.Nucs = '14N';
Sys1.A = [10 7 105];
Sys1.lwpp = 0.15; % mT
Sys1.tcorr = 0.4e-9; %sec

Exp.mwFreq = 9.882948 %GHz
Exp.nPoints = length(Spec);

%% simulation
[SimField1 SimSpec1] = chili(Sys1,Exp);
SimSpec1_int = cumtrapz(SimSpec1);
SimSpec1_doubleintegral = cumtrapz(SimSpec1_int);
SimSpc1 = SimSpec1/max(SimSpec1_doubleintegral);

spctotal = SimSpc1;
spctotal0 = (spctotal/max(spctotal));

figure(2)
plot(Field,Spec,'k',SimField1,spctotal0,'r','LineWidth',3)
xlabel('Field [mT]','FontSize',25)
legend({'Exp','Sim'},'FontSize',25)
axis tight;
ax = gca;
ax.FontSize = 25; 
%saveas(gcf,'C:\Users\keljo\Documents\Stage\easyspin\simulaties\figures\BP_sim','epsc')
%saveas(gcf,'C:\Users\keljo\Documents\Stage\easyspin\simulaties\figures\BP_sim.png')