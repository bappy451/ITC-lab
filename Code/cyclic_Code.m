n = 15;                % Code length
k = 5;                 % Message length


data = randi([0 1],k,1);


gpol = cyclpoly(n,k);
parmat = cyclgen(n,gpol);


trt = syndtable(parmat);


encData = encode(data,n,k,'cyclic/binary',gpol);

encData(4) = ~encData(4);
encData(7) = ~encData(7);

decData = decode(encData,n,k,'cyclic/binary',gpol,trt);

numerr = biterr(data,decData);
numerr =0;

