exp = readmatrix('CD_T0EZ_exp.xlsx');
expwl = exp(2:703,1);
expt0 = exp(2:703,2);
expt1 = exp(2:703,3);
expt4 = exp(2:703,4);
expt22 = exp(2:703,5);
expt50 = exp(2:703,6);
expt72 = exp(2:703,7);
expt96 = exp(2:703,8);
expt169 = exp(2:703,9);

figure(1)
plot(ddata(:,1),monomer,':',ddata(:,1),hexamer,':',expwl,expt0,expwl,expt1,expwl,expt4,expwl,expt22,expwl,expt50,expwl,expt72,expwl,expt96,expwl,expt169,'LineWidth',5)
legend('Sim T0 hex','Sim T0 mon','Exp 0 hours','Exp 1 hour','Exp 4 hours','Exp 22 hours','Exp 55 hours','Exp 72 hours','Exp 96 hours','Exp 169 hours','FontSize',25,'Location','eastoutside')
set(gcf,'Position',[200 200 1400 600])
xlabel('Wavelength (nm)','FontSize',25);
ylabel(['\Delta' char(949)],'FontSize',25);
xlim([180 260])
ylim([-6 9])
ax = gca;
ax.FontSize = 25;

saveas(gcf,'C:\Users\keljo\Documents\Stage\MD2CD\CD_spec_T0hex_and_mon','epsc')