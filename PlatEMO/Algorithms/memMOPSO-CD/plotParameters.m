load('parameters.mat');
figure('name', 'C1, C2 and w parameters'); hold on;
plot(allC1, '*r');
plot(allC2, '+g');
plot(allW, '.b');
title('Evolução dos Parâmetros');
xlabel('Geração atual');
ylabel('Valor');
legend('C1','C2','W');