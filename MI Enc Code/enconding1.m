function [stego,len]= enconding1(img,msg)
    
    
    [row,col]=size(img);
    L=256;
    
    len=length(msg)*8;  
    ascii=uint8(msg);   
    binary_separate=dec2bin(ascii,8);   
    binary_all='';  
    for i=1:length(msg)
        %binary_all=append(binary_all,binary_separate(i,:));
        binary_all=strcat(binary_all,binary_separate(i,:));
    end

    count=1;    
    
    for i=1:row
        for j=1:col        
            if count<=len            
                LSB=mod(img(i,j),2);                     
                a=str2double(binary_all(count));            
                temp=double(xor(LSB,a));                       
                stego(i,j)=img(i,j)+temp;
                count=count+1;
            else
                stego(i,j)=img(i,j);
            end
        end
    end
end