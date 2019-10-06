dataset_path = getenv('Dataset_path');
image = strcat(dataset_path, "\camera00\00\image.000058.jp2");
I = imread(image);
imshow(I)

[c,r,dim] = size(I)
pps_h = c/20;       %pixels per square horizontal
res_h = c/pps_h
res_v = round(r/pps_h)
Ismall = imresize(I,[res_h,res_v]);
figure
imshow(Ismall,'InitialMagnification',2000)

% para el canal azul
figure
imshow(Ismall(:,:,3),'InitialMagnification',2000) 
Ismall_B = Ismall(:,:,3);

diff = zeros(res_h,26);
for i = 1:res_h
    for j = 1:res_v
        cum = 0;
        for m = i-1:i+1
            if m-1 < 1 || m+1 > res_h
                continue
            end
            for n = j-1:j+1
                if n-1 < 1 || n+1 > res_v
                    continue
                end
                dif = abs(double(Ismall_B(i,j)) - double(Ismall_B(m,n)));
                cum = cum + dif;
            end
        end
        diff(i,j) = cum;
    end
end

%normalizamos la imagen
diff = diff / max(diff,[],'all');
figure
imshow(diff,'InitialMagnification',2000)