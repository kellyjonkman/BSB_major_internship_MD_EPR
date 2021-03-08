%%
clear, clc, clf

t0meas = readtable('AB+CP2_20201202_t0_graphs.xlsx');
t42meas = readtable('AB+CP2_20201202_graphs.xlsx')

figure(1)
plot(t0meas.wavelengths,t0meas.B1_blanc_t0,t0meas.wavelengths,t0meas.B1_samp_t0,t0meas.wavelengths,t0meas.B2_blanc_t0,t0meas.wavelengths,t0meas.B2_samp_t0,t0meas.wavelengths,t0meas.B3_blanc_t0,t0meas.wavelengths,t0meas.B3_samp_t0,'LineWidth',5)
xlabel('Wavelength (nm)','FontSize',35)
title('t=0h')
legend('B1 blank','B1 sample','B2 blank','B2 sample','B3 blank','B3 sample','FontSize',35)
axis tight;
ax = gca;
ax.FontSize = 35;
saveas(gcf,'C:\Users\keljo\Documents\Stage\lab_results\Fluor_spec\t0_B123','epsc')

figure(2)
plot(t42meas.wavelengths,t42meas.B1_blanc_t40,t42meas.wavelengths,t42meas.B1_samp_t40,t42meas.wavelengths,t42meas.B2_blanc_t40,t42meas.wavelengths,t42meas.B2_samp_t40,t42meas.wavelengths,t42meas.B3_blanc_t40,t42meas.wavelengths,t42meas.B3_samp_t40,'LineWidth',5)
xlabel('Wavelength (nm)','FontSize',35)
title('t=42h')
legend('B1 blank','B1 sample','B2 blank','B2 sample','B3 blank','B3 sample','FontSize',35)
axis tight;
ax = gca;
ax.FontSize = 35;
saveas(gcf,'C:\Users\keljo\Documents\Stage\lab_results\Fluor_spec\t42_B123','epsc')

figure(3)
plot(t42meas.wavelengths,t42meas.B1_blanc_t40,t42meas.wavelengths,t42meas.B1_samp_t40,t42meas.wavelengths,t42meas.B2_blanc_t40,t42meas.wavelengths,t42meas.B2_samp_t40,t42meas.wavelengths,t42meas.B3_blanc_t40,t42meas.wavelengths,t42meas.B3_samp_t40,t42meas.wavelengths,t42meas.Aggregated_example,'LineWidth',5)
xlabel('Wavelength (nm)','FontSize',35)
title('t=42h')
legend('B1 blank','B1 sample','B2 blank','B2 sample','B3 blank','B3 sample','Aggregated','FontSize',35)
axis tight;
ax = gca;
ax.FontSize = 35;
saveas(gcf,'C:\Users\keljo\Documents\Stage\lab_results\Fluor_spec\t42_B123_agg','epsc')