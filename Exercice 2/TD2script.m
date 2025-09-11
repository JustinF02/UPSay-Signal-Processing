%% test stats
clear all;
close all;

tries = 1;
bilanErreurs = zeros(tries,1);

inputImage = imread('C.jpg');  % ouverture du fichier (RGB)
figure('Name','Image RGB initiale');
%imshow(inputImage);
grayImage = rgb2gray(inputImage);    % conversion en niveaux de gris
figure('Name','Image niveaux gris');
%imshow(grayImage);
binImage = im2bw(grayImage);         % conversion en image binaire
figure('Name','Image binaire');
imshow(binImage);

% binImage est la donnee a transmettre


for i = 1 : tries
    canalTransmis = canalBinSym(binImage);
    
    imageDecodee = decodage(canalTransmis);
    
    %on affiche les images seulement si on simule une seule fois
    if tries == 1
        figure('Name','Canal transmis');
        imshow(canalTransmis);
        figure('Name','Image decodee');
        imshow(imageDecodee);
    end

    

    nombreErreurs = comparation(binImage, imageDecodee);
    bilanErreurs(i) = nombreErreurs;
end


