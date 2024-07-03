function [d,n, cipher, output]= encryptImg(img)
    
    p = 13;
    q =31;

    n=p*q;
    
    Phi=(p-1)*(q-1);

    for e=2:Phi
        if gcd(e,Phi)==1
            break
        end
    end
    
    i=1;
    r=1;
    while r > 0
        k=(Phi*i)+1;
        r=rem(k,e);
        %disp(['Value of i is : ' num2str(i)]);
        i=i+1;
    end
    d=k/e;
    
    input = double(img);


    inputsize = size(input);

    cipher = ones(inputsize);


    for u=1:numel(input)
        cipher(u) = exmod(input(u),e,n);
    end

    output = ones(inputsize);

    
end