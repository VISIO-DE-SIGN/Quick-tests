dataset_path = getenv('Dataset_path');
image = strcat(dataset_path, "\camera00\00\image.000058.jp2");
I = imread(image);
%imshow(I)

[c,r,dim] = size(I)
pps_h = c/20;       %pixels per square horizontal
res_h = c/pps_h
res_v = round(r/pps_h)
Ismall = imresize(I,[res_h,res_v]);
%figure
%imshow(Ismall,'InitialMagnification',2000)

% para el canal azul
%figure
%imshow(Ismall(:,:,3),'InitialMagnification',2000) 
Ismall_B = Ismall(:,:,3);

diff = getBlobImage(Ismall_B);

%normalizamos la imagen
diff = diff / max(diff,[],'all');
figure
imshow(diff,'InitialMagnification',2000)