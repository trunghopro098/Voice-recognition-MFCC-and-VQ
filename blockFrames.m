%% blockFrames Function
% blockFrames: Puts the signal into frames
%
% Inputs: s contains the signal to analize
% fs is the sampling rate of the signal
% m is the distance between the beginnings of two frames
% n is the number of samples per frame
%
% Output: M3 is a matrix containing all the frames

function M3 = blockFrames(s, fs, m, n)
%s t�n hi?u x? l?
%fs t?ng s? l?y m?u, t?c �? l?y m?u
%m kho?n c�ch 2 �?u khung
%n s? l�?ng m?u tr�n m?i khung.
l = length(s);% �? d�i t�n hi?u x? l?

nbFrame = floor((l - n) / m) + 1;%floor h�m l�m tr?n - �m v� c�ng
%s? l�?ng t�n hi?u
for i = 1:n
    for j = 1:nbFrame
        M(i, j) = s(((j - 1) * m) + i); %#ok<AGROW>
    end
end
%l?y c?a s? t�n hi?u s? d?ng hamming windown
%t?o c?a s? h v?i n �i?m
h = hamming(n);
M2 = diag(h) * M;%diag T?o ma tr?n m?i v� x? l? ��?ng ch�o theo quy �?c.
%ma tr?n �ue?c t?o ra v?i t? h vaftheo quy t?c v� s? h�ng b�ng s? c?t c�c
%ph?n t? c?a h n?m tr�n �?ng ch�o c?a M2
%bi?n d?i fourier
for i = 1:nbFrame
    %fft t�nh to�n bi?n �?i fourier r?i r?c(DFT)
    %M3 fft x? l? c�c c?t d�?i d?ng vecto v� tr? v? bi?n �?i fourier c?a
    %m?i c?t
    M3(:, i) = fft(M2(:, i)); %#ok<AGROW>%tr? v? ma tr?n ch?a c�c khung �? bi?n �?i fourier
end
end
%--------------------------------------------------------------------------
