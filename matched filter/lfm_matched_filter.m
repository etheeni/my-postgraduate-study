clc
clear
close all
%lfm
hw = phased.LinearFMWaveform('PulseWidth',1e-4,'PRF',5e3);
x = step(hw);
hmf = phased.MatchedFilter(...
    'Coefficients',getMatchedFilter(hw));
coeffs = getMatchedFilter(hw);
y = step(hmf,x);
subplot(211),plot(real(x));
xlabel('Samples'); ylabel('Amplitude');
axis([0 100 -1 1])
title('Input Signal');
grid on
subplot(212),plot(real(coeffs));
xlabel('Samples'); ylabel('Amplitude');
title('Matched Filter');
grid on

figure(2)
plot(real(y))
xlabel('Samples'); ylabel('Amplitude');
title('Matched Filter Output');
grid on

save('matched_filter_variables.mat');
