function [msg]= decoding1(img,len)
    
    [row,col]=size(img);
    count=1;
    message_in_bits='';
    for i=1:row
        for j=1:col        
            if count<=len            
            
                LSB=mod(img(i,j),2);            
                %message_in_bits=append(message_in_bits,num2str(LSB)); 
                message_in_bits=strcat(message_in_bits,num2str(LSB));            
                count=count+1;
            end
        end    
    end
    message_in_bits
    i=1;
    msg='';
    while i<=len        
        %msg=append(msg,char(bin2dec(message_in_bits(1,i:i+7))));
        msg=strcat(msg,char(bin2dec(message_in_bits(1,i:i+7))));
       i=i+8;
    end
    
    msg = strrep(msg,'-',' ');
end