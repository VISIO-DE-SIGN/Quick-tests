dataset_path = getenv('Dataset_path');
image = strcat(dataset_path, "\camera00\00\image.000072.jp2");  %191
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

%Chanels
%{
figure
imshow(diff_b,'InitialMagnification',2000)
title('blue chanel');

figure
imshow(diff_r,'InitialMagnification',2000)
title('red chanel');

figure
imshow(diff_g,'InitialMagnification',2000)
title('green chanel');

%}

%figure
only_blue = diff_b - diff_r/2 - diff_g/2;
only_blue = only_blue / max(only_blue,[],'all');
%imshow(only_blue,'InitialMagnification',2000)
%title('only blue');

%figure
only_red = diff_r - diff_b/2 - diff_g/2;
only_red = only_red / max(only_red,[],'all');
%imshow(only_red,'InitialMagnification',2000)
%title('only red');

%figure
only_green = diff_g - diff_b/2 - diff_r/2;
only_green = only_green / max(only_green,[],'all');
%imshow(only_green,'InitialMagnification',2000)
%title('only green');

[M,N] = max(only_blue);
[M_,col] = max(M);
row = N(col);

margin = 0;
x = (col-1-margin) * pps_h;
y = (row-1-margin) * pps_h;
w = 1 * (1 + margin) * pps_h;
h = 1 * (1 + margin) * pps_h;
imshow(I)
rectangle('Position',[x,y,w,h],'LineWidth',3,'EdgeColor','r')

