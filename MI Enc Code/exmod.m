function a=exmod(b,e,m)
    if m==1
        a=0;
        return
    end
    i=1;
    a=1;
    while i<=e
        a = mod(a*b,m);
        i = i+1;
    end
end
