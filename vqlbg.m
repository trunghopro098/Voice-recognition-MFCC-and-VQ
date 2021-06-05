%% VQ Vector quantization
%
% Inputs: d contains training data vectors (one per column)
% k is number of centroids required
%
% Output: r contains the result VQ codebook (k columns, one for each  centroids)
%%

function r = vqlbg(d,k) 
e = .1; %ch?n e  = 0.1
r = mean(d, 2); % trung b�nh c�c vector hu?n luy?n (1*20);
dpr = 10000; %ng??ng
for i = 1:log2(k) %k=64 i ch?y t? 1-8
    r = [r*(1+e), r*(1-e)]; % nh�n ?�i codebook 
    while (1 == 1)
        z = disteu(d, r); % t�nh kho?ng c�ch t? aucotic vector ??n r.
        [m,ind] = min(z, [], 2); %t�m c�c kho?ng nh? nh?t;
        t = 0; 
        for j = 1:2^i
            r(:, j) = mean(d(:, find(ind == j)), 2); %#ok<FNDSB> %t�nh gi� tr? trung b�nh r?i c?p nh?t codeword;
            x = disteu(d(:, find(ind == j)), r(:, j)); %#ok<FNDSB>  t�nh kho?ng c�chc?a t?ng vector ??n codeworld;
            for q = 1:length(x) %t�nh t?ng kho?ng c�ch;
                t = t + x(q);
            end
        end
        if (((dpr - t)/t) < e) %x�t n�� kho?ng c�ch trun b�nh nh? h?n ng??ng th� ?� xong 1 l?n chia codebook
            break;
        else
            dpr = t;
        end
    end
end