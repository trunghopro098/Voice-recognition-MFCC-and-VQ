%% MFCC Function
% MFCC
%https://www.aiourlife.com/2020/04/mel-frequency-cepstral-coefficients.html
% Inputs: s contains the signal to analize
% fs is the sampling rate of the signal
%http://tainguyenso.dut.udn.vn/bitstream/DUT/497/1/LeNgocHuy.TT.pdf.pdf
% Output: r contains the transformed signal
%% author : Ho Van Trung && Nguyen Van Chien
% tr? v? h? s? cepstral t?n s? mel (MFCC) cho �?u v�o �m thanh, ��?c l?y m?u ? t?n s? fsHz.
function r = mfcc(s, fs)
%s t�n hi?u x? l? fs t?ng s? l?y m?u
m = 100;% kho?n c�ch 2 �?u khung
n = 256; % s? l�?ng m?u tr�n m?i khung
frame=blockFrames(s, fs, m, n); % ��a t�n hi?u v�o khung
%20 s? b? l?c
%n chi?u d�i c?a fft
m = melfb(20, n, fs); % tan so melf
n2 = 1 + floor(n / 2);
z = m * abs(frame(1:n2, :)).^2; %% tao ma tran tan so melf
r = dct(log(z)); 
end
%r t�n hi?u �? bi?n �?i
%t�nh n�ng l�?ng log ph? thu?c v�o mi?n �?u v�o ; n?u mi?n �?u v�o l� th?i
%gian th? r = log(n2.2). ta �ang s? d?ng mi?n �?u v�o t?ng s?
