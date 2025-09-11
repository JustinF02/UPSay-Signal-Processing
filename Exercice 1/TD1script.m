%% test stats
clear all;
close all;

tries = 1;
bilanErreurs = zeros(tries,1);

pError = 0.1;

inputImage = imread('C.jpg');  % ouverture du fichier (RGB)
figure('Name','Image RGB initiale');
imshow(inputImage);
grayImage = rgb2gray(inputImage);    % conversion en niveaux de gris
figure('Name','Image niveaux gris');
imshow(grayImage);
binImage = im2bw(grayImage);         % conversion en image binaire
figure('Name','Image binaire');
imshow(binImage);

% binImage est la donnee a transmettre

% repetition R3
canal1 = binImage;
canal2 = binImage;
canal3 = binImage;

for i = 1 : tries
    canal1Transmis = canalBinSym(canal1, pError);
    canal2Transmis = canalBinSym(canal2, pError);
    canal3Transmis = canalBinSym(canal3, pError);
    
    imageDecodee = decodage(canal1Transmis, canal2Transmis, canal3Transmis);
    
    %on affiche les images seulement si on simule une seule fois
    if tries == 1
        figure('Name','Canal 1 transmis');
        imshow(canal1Transmis);
        figure('Name','Canal 2 transmis');
        imshow(canal2Transmis);
        figure('Name','Canal 3 transmis');
        imshow(canal3Transmis);
        figure('Name','Image decodee');
        imshow(imageDecodee);
    end

    

    nombreErreurs = comparation(binImage, imageDecodee);
    bilanErreurs(i) = nombreErreurs;
end


