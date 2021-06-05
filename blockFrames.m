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
%s tín hi?u x? l?
%fs t?ng s? l?y m?u, t?c ð? l?y m?u
%m kho?n cách 2 ð?u khung
%n s? lý?ng m?u trên m?i khung.
l = length(s);% ð? dài tín hi?u x? l?

nbFrame = floor((l - n) / m) + 1;%floor hàm làm tr?n - âm vô cùng
%s? lý?ng tín hi?u
for i = 1:n
    for j = 1:nbFrame
        M(i, j) = s(((j - 1) * m) + i); %#ok<AGROW>
    end
end
%l?y c?a s? tín hi?u s? d?ng hamming windown
%t?o c?a s? h v?i n ði?m
h = hamming(n);
M2 = diag(h) * M;%diag T?o ma tr?n m?i và x? l? ðý?ng chéo theo quy ý?c.
%ma tr?n ðue?c t?o ra v?i t? h vaftheo quy t?c và s? hàng bãng s? c?t các
%ph?n t? c?a h n?m trên ð?ng chéo c?a M2
%bi?n d?i fourier
for i = 1:nbFrame
    %fft tính toán bi?n ð?i fourier r?i r?c(DFT)
    %M3 fft x? l? các c?t dý?i d?ng vecto và tr? v? bi?n ð?i fourier c?a
    %m?i c?t
    M3(:, i) = fft(M2(:, i)); %#ok<AGROW>%tr? v? ma tr?n ch?a các khung ð? bi?n ð?i fourier
end
end
%--------------------------------------------------------------------------
