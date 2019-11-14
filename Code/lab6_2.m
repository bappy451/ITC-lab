clear
n = 6%# of codeword bits per block
k = 3%# of message bits per block
A = [ 1 1 1;1 1 0;1 0 1 ];%Parity submatrix-Need binary(decimal combination of 7,6,5,3)            
G = [ eye(k) A ]%Generator matrix
H = [ A' eye(n-k) ]%Parity-check matrix
% ENCODER%
msg = [ 1 0 0 ] %Message block vector-change to any 3 bit sequence
code = mod(msg*G,2)%Encode message
 code(2)= ~code(2);
recd = code %Received codeword with error
% DECODER%
syndrome = mod(recd * H',2)
%Find position of the error in codeword (index)
find = 0;
for ii = 1:n
    if ~find
        errvect = zeros(1,n);
        errvect(ii) = 1;
        search = mod(errvect * H',2);
        if search == syndrome
            find = 1;
            index = ii;
        end
    end
end
disp(['Position of error in codeword=',num2str(index)]);
correctedcode = recd;
correctedcode(index) = mod(recd(index)+1,2)%Corrected codeword
%Strip off parity bits
msg_decoded=correctedcode;
msg_decoded=msg_decoded(1:3)