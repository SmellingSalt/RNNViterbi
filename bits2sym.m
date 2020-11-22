%% 
function [Symbol_stream,num_zeros]=bits2sym(M,bitstream)
% GROUPING
%Pad zeros if the length of the bitstream is not a multiple of N
lenbit=length(bitstream);
%Number of zeros being padded
num_zeros=0;
while mod(lenbit/M,2)~=0
    bitstream=[bitstream;0];
    lenbit=length(bitstream);
    num_zeros=num_zeros+1;
end
%An entire row contains a symbol. Map it to a decimal number
temp=reshape(bitstream,[lenbit/M,M]);
%Binary to decimal conversion
twopow=M-1:-1:0;
twopow=2.^twopow;
Symbol_stream=sum(twopow.*temp,2);
end



