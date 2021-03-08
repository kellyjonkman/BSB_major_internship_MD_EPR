clf
plot(T0EZ_mon_rmsd(:,1),T0EZ_mon_rmsd(:,2),'k','LineWidth',5)
set(gcf,'Position',[200 200 800 600])
xlabel('RMSD (nm)','FontSize',25); %RMSD (nm) or N-C distance (nm)
ylabel('Potential energy (k_BT)','FontSize',25);
axis tight;
ax = gca;
ax.FontSize = 25; 

%saveas(gcf,'C:\Users\keljo\Documents\Stage\MD_simulations\figures\T0EZ_mon_ener_rmsd','epsc')
%saveas(gcf,'C:\Users\keljo\Documents\Stage\MD_simulations\figures\T0EZ_mon_ener_rmsd.png')