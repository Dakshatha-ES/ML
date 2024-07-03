clc;

[FileName,PathName] = uigetfile('*.png;*.bmp','Select an Medical Image');
if isequal(FileName,0)||isequal(PathName,0)
    warndlg('User Press Cancel');
else
    img = imread([PathName,FileName]);
    img = imresize(img,[200,200]);
    
    figure(1)
    imshow(img);
    title('Input Image');
    
    gr=rgb2gray(img);
    
    figure(2)
    imshow(gr);
    title('GrayScale Image');
    
    msg='Patient Secret Information';        
    
    fprintf('Input = %s',msg);
    msg = strrep(msg,' ','-');

    [stego, len]= enconding1(gr,msg);
    
    
    
    figure(3)
    imshow(stego);
    title('Stego Image');
    
   
    [d,n,cipher, output]= encryptImg(stego);
    figure(4)
    imshow(uint8(cipher));
    title('Encrypted Image');
    
    
    enc=uint8(cipher);
    dec1= decryptImg(cipher,enc,d,n);
    
    figure(5)
    imshow(uint8(dec1));
    title('Decrypted Image');
    
    
    extract=decoding1(dec1,len);
    fprintf('Extracted = %s\n',extract);
end