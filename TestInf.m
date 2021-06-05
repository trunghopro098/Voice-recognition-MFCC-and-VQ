a= Inf;
b= 1;
c=2;
d=5;
if b > a
    a = b
end
if c >a
    a =b 
end
if d a
    a=d
end

A = zeros(3,3)

A = [1.2 1.5 1.0 3 6;
    6 0.6 1.3 1.1 4;
    5 1.5 1.2 3.5 4;
    3 2 3 4 5]

B = [1.2 1 1.0 3 6;6 0.6 1 1.1 4;5 1.5 1.2 3.5 4;3 2 0 4 5]

M = min(A,[],2)%giá tr? nh? nh?t c?a ?i hàng
b= size(A,1)%hang
b= size(A,2)%cot