clf

T0EZ_mon = import_xvg('dist1.xvg') %distaveall hexamer, dist1 monomer
T0EZ_mon(:,1) = T0EZ_mon(:,1)/1000
mean_line = movmean(T0EZ_mon(:,2),401)

plot(T0EZ_mon(:,1),T0EZ_mon(:,2),'r','LineWidth',3)
hold on
plot(T0EZ_mon(:,1),mean_line,'k','LineWidth',5)
set(gcf,'Position',[200 200 800 600])
xline(30,'--k','LineWidth',5);
xlabel('Time (ns)','FontSize',25);
ylabel('N-C distance (nm)','FontSize',25); %monomer
% ylabel('Distance (nm)','FontSize',25); %hexamer
xlim([0 250])
% ylim([0.9 1.7]) %hexamer
ylim([0 4]) %monomer
ax = gca;
ax.FontSize = 25; 

%saveas(gcf,'C:\Users\keljo\Documents\Stage\MD_simulations\figures\K11V_mon_dist','epsc')
%saveas(gcf,'C:\Users\keljo\Documents\Stage\MD_simulations\figures\K11V_mon_dist.png')