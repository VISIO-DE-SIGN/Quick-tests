dataset_path = getenv('Dataset_path');
image = strcat(dataset_path, "\camera00\00\image.000060.jp2");
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
Ismall_R = Ismall(:,:,1);
Ismall_G = Ismall(:,:,2);

diff_b = getBlobImage(Ismall_B);
diff_r = getBlobImage(Ismall_R);
diff_g = getBlobImage(Ismall_G);


figure
imshow(diff_b,'InitialMagnification',2000)
title('blue chanel');

figure
imshow(diff_r,'InitialMagnification',2000)
title('red chanel');

figure
imshow(diff_g,'InitialMagnification',2000)
title('green chanel');

figure
only_blue = diff_b - diff_r/2 - diff_g/2;
imshow(only_blue,'InitialMagnification',2000)
title('+B-R-G');