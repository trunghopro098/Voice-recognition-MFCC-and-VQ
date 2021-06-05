%% MFCC Function
% MFCC
%https://www.aiourlife.com/2020/04/mel-frequency-cepstral-coefficients.html
% Inputs: s contains the signal to analize
% fs is the sampling rate of the signal
%http://tainguyenso.dut.udn.vn/bitstream/DUT/497/1/LeNgocHuy.TT.pdf.pdf
% Output: r contains the transformed signal
%% author : Ho Van Trung && Nguyen Van Chien
% tr? v? h? s? cepstral t?n s? mel (MFCC) cho ð?u vào âm thanh, ðý?c l?y m?u ? t?n s? fsHz.
function r = mfcc(s, fs)
%s tín hi?u x? l? fs t?ng s? l?y m?u
m = 100;% kho?n cách 2 ð?u khung
n = 256; % s? lý?ng m?u trên m?i khung
frame=blockFrames(s, fs, m, n); % ðýa tín hi?u vào khung
%20 s? b? l?c
%n chi?u dài c?a fft
m = melfb(20, n, fs); % tan so melf
n2 = 1 + floor(n / 2);
z = m * abs(frame(1:n2, :)).^2; %% tao ma tran tan so melf
r = dct(log(z)); 
end
%r tín hi?u ð? bi?n ð?i
%tính nãng lý?ng log ph? thu?c vào mi?n ð?u vào ; n?u mi?n ð?u vào là th?i
%gian th? r = log(n2.2). ta ðang s? d?ng mi?n ð?u vào t?ng s?
