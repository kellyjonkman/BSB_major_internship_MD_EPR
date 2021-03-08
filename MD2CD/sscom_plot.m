clear, clc, clf

sscomp = readmatrix('sscompositionT0.xlsx')

anti1 = sscomp(:,2);
anti1std = sscomp(:,3);
anti2 = sscomp(:,4);
anti2std = sscomp(:,5);
par = sscomp(:,6);
parstd = sscomp(:,7);
turn = sscomp(:,8);
turnstd = sscomp(:,9);
other = sscomp(:,10);
otherstd = sscomp(:,11);

figure(1)
errorbar(sscomp(:,1),anti1,anti1std,'color',[1 .8 .0],'LineWidth',4)
hold on
errorbar(sscomp(:,1),anti2,anti2std,'color',[.0 .8 1],'LineWidth',4)
hold on
errorbar(sscomp(:,1),par,parstd,'color',[1 .4 1],'LineWidth',4)
hold on
errorbar(sscomp(:,1),turn,turnstd,'color',[1 .2 .4],'LineWidth',4)
hold on
errorbar(sscomp(:,1),other,otherstd,'color',[.2 .8 .4],'LineWidth',4)
set(gcf,'Position',[200 200 1300 600])
legend({'Antiparallel sheet 1','Antiparallel sheet 2','Parallel sheet','Turn','Other'},'FontSize',25,'Location','eastoutside');
xlabel('Time (ns)','FontSize',25);
ylabel('Percentage','FontSize',25);
xlim([30 250])
ylim([0 100]) %1 monomer, 0.8 hexamer
ax = gca;
ax.FontSize = 25; 

%saveas(gcf,'C:\Users\keljo\Documents\Stage\MD2CD\T0EZ_hex_sscomp','epsc')

opts = detectImportOptions('sscompositionT0.xlsx');
opts.Sheet = 'monomer'
sscomp = readmatrix('sscompositionT0.xlsx',opts)

turn = sscomp(:,2);
turnstd = sscomp(:,3);
other = sscomp(:,4);
otherstd = sscomp(:,5);
helix2 = sscomp(:,6);
helix2std = sscomp(:,7);

figure(2)
errorbar(sscomp(:,1),turn,turnstd,'color',[1 .2 .4],'LineWidth',4)
hold on
errorbar(sscomp(:,1),other,otherstd,'color',[.2 .8 .4],'LineWidth',4)
hold on
errorbar(sscomp(:,1),helix2,helix2std,'color',[.4 .2 .8],'LineWidth',4)
set(gcf,'Position',[200 200 1125 600])
legend({'Turn','Other','Helix 2'},'FontSize',25,'Location','eastoutside');
xlabel('Time (ns)','FontSize',25);
ylabel('Percentage','FontSize',25);
xlim([30 250])
ylim([0 100]) %1 monomer, 0.8 hexamer
ax = gca;
ax.FontSize = 25; 

%saveas(gcf,'C:\Users\keljo\Documents\Stage\MD2CD\T0EZ_mon_sscomp','epsc')
