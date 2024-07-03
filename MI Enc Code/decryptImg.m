function [output]= decryptImg(cipher,enc,d,n)
   % output = ones(cipher);
   in = double(enc);
   insize = size(in);

    output = ones(insize);
    for u=1:numel(in)
        output(u) = exmod(cipher(u),d,n);
    end
    
end