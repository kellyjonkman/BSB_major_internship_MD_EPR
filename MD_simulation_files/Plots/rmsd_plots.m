clf

T0EZ_mon = import_xvg('rmsd.xvg') 
mean_line = movmean(T0EZ_mon(:,2),401)

plot(T0EZ_mon(:,1),T0EZ_mon(:,2),'r','LineWidth',3)
hold on
plot(T0EZ_mon(:,1),mean_line,'k','LineWidth',5)
set(gcf,'Position',[200 200 800 600])
xline(30,'--k','LineWidth',5);
xlabel('Time (ns)','FontSize',25);
ylabel('RMSD (nm)','FontSize',25);
xlim([0 250])
ylim([0 1]) %1 monomer, 0.8 hexamer
ax = gca;
ax.FontSize = 25; 

% saveas(gcf,'C:\Users\keljo\Documents\Stage\MD_simulations\figures\T0EZ_hex_rmsd','epsc')
%saveas(gcf,'C:\Users\keljo\Documents\Stage\MD_simulations\figures\K11V_mon_rmsd.png')