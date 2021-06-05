%% VQ Vector quantization
%
% Inputs: d contains training data vectors (one per column)
% k is number of centroids required
%
% Output: r contains the result VQ codebook (k columns, one for each  centroids)
%%

function r = vqlbg(d,k) 
e = .1; %ch?n e  = 0.1
r = mean(d, 2); % trung bình các vector hu?n luy?n (1*20);
dpr = 10000; %ng??ng
for i = 1:log2(k) %k=64 i ch?y t? 1-8
    r = [r*(1+e), r*(1-e)]; % nhân ?ôi codebook 
    while (1 == 1)
        z = disteu(d, r); % tính kho?ng cách t? aucotic vector ??n r.
        [m,ind] = min(z, [], 2); %tìm các kho?ng nh? nh?t;
        t = 0; 
        for j = 1:2^i
            r(:, j) = mean(d(:, find(ind == j)), 2); %#ok<FNDSB> %tính giá tr? trung bình r?i c?p nh?t codeword;
            x = disteu(d(:, find(ind == j)), r(:, j)); %#ok<FNDSB>  tính kho?ng cáchc?a t?ng vector ??n codeworld;
            for q = 1:length(x) %tính t?ng kho?ng cách;
                t = t + x(q);
            end
        end
        if (((dpr - t)/t) < e) %xét nêú kho?ng cách trun bình nh? h?n ng??ng thì ?ã xong 1 l?n chia codebook
            break;
        else
            dpr = t;
        end
    end
end