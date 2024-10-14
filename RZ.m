close all
clear all

Fs = 100; % Frequência de amostragem
a = input('Digite o array de bits entre colchetes (exemplo: [1 0 1 1 0]): ');
y = []; % Inicializa o array de saída

bitA = ones(1, Fs);  % Definição de bitA
bitB = -ones(1, Fs); % Definição de bitB
bitC = zeros(1, Fs);  % Definição de bitC

% Concatenação de bitA e bitB baseado nos valores de 'a'
for i = 1:length(a)
    if a(i) == 1
        y = [y, bitA]; % Concatena bitA em y
        y = [y, bitC]; % Concatena bitA em y
    else
        y = [y, bitB]; % Concatena bitB em y
        y = [y, bitC]; % Concatena bitA em y
    end
end

% Gera o vetor de tempo 't' com o mesmo tamanho de 'y'
t = ((0:length(y)-1)/Fs)/2;

% Plota o sinal
figure
plot(t, y) % Ajusta o eixo de tempo para o tamanho de y
xlabel('Tempo (s)');
ylabel('Amplitude');
axis([0 max(t) -2 2]) % Define os limites do gráfico
title('Sinal Gerado a Partir dos Bits')
grid