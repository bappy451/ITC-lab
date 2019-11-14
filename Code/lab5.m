clc
close all;
clear all;
%%
[A,fs]=audioread('friends.mp3');
sound(A,fs);
%% Sender
C=[];
A=A';
for i=512:512:numel(A)
B=dct(A(i-511:i));
C=[C, B(1:128)];
end
%% Reciever
A2=[];
for i=128:128:numel(C)
S=[C(i-127:i),zeros(1,384)];
S=idct(S);
A2=[A2,S];
end
%% Evaluation
dis=numel(A)-numel(A2);
A2=[A2,zeros(1,dis)];
PSNR=psnr(A2,A)
MSError=mse(A2,A)
SNR=snr(A2,A)
%% plot
figure,
plot(A);
hold on
plot(A2,'r')
plot((A2-A),'y');