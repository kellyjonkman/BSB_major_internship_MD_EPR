figure(2)
ddata1 = readmatrix('preds (14).csv'); 
ddata2 = readmatrix('preds (15).csv'); 
ddata3 = readmatrix('preds (16).csv'); 
ddata4 = readmatrix('preds (17).csv'); 
ddata5 = readmatrix('preds (18).csv');
ddata6 = readmatrix('preds (19).csv');
ddata7 = readmatrix('preds (20).csv');
ddata8 = readmatrix('preds (21).csv');
ddata9 = readmatrix('preds (22).csv');
ddata10 = readmatrix('preds (23).csv');
ddata11 = readmatrix('preds (24).csv');
ddata = [ddata1, ddata2(:,2:21), ddata3(:,2:21), ddata4(:,2:21),ddata5(:,2:21),ddata6(:,2:21),ddata7(:,2:21),ddata8(:,2:21),ddata9(:,2:21),ddata10(:,2:21),ddata11(:,2:21)];
ddata = [ddata, mean(ddata(:,2:221),2)];

plot(ddata(:,1),ddata(:,2:221))
hold on;
plot(ddata(:,1),ddata(:,222),'k','LineWidth',5)
hexamer = ddata(:,222);
set(gcf,'Position',[200 200 1100 600])
xlabel('Wavelength (nm)','FontSize',25);
ylabel(['\Delta' char(949)],'FontSize',25);
ax = gca;
ax.FontSize = 25;

%saveas(gcf,'C:\Users\keljo\Documents\Stage\MD2CD\CD_spec_T0hex','epsc')
%saveas(gcf,'C:\Users\keljo\Documents\Stage\MD2CD\CD_spec_T0hex.png')
