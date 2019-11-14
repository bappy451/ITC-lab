clc;
clear all;
close all;

len = 100;
counts = [70 30];
seq = randsrc(1,len,[1 2; .7 .3]);

code = arithenco(seq,counts);
s = size(code); 
disp(s);
out=awgn(code,5);

for i=1:length(code)
    if out(1,i)<=1
        out(1,i)=0;
    else
        out(1,i)=1;
    end
end


number_of_similar_bits = sum(code==out);
plot(code);
hold on;
plot(out);

%dseq = arithdeco(out,counts,length(seq));
%s2 = size(dseq);
%disp(s2);
%disp(isequal(seq,dseq));
