rad=100;
rfb=350;
cfb=800;
cb=fspecial('gaussian',7*rad,175);
%cb=fspecial('disk',rad);


[rcb,ccb]=size(cb);
cb=cb/max(max(cb));%*255;
fb=zeros(rI,cI);

fb(rfb-rad:(rfb-rad)+rcb-1,cfb-rad:(cfb-rad)+rcb-1)=cb;
Ifb=imcomplement(fb);

for i=1:3
    Ifs(:,:,i)=double(I(:,:,i)).*fb;
    Ffs(:,:,i)=double(Fc(:,:,i)).*Ifb;
end
Ifc=cat(3,Ifs(:,:,1),Ifs(:,:,2),Ifs(:,:,3));
figure, imshow(uint8(Ifc))

Ffc=cat(3,Ffs(:,:,1),Ffs(:,:,2),Ffs(:,:,3));
figure, imshow(uint8(Ffc))

figure, imshow(uint8(Ffc+Ifc))