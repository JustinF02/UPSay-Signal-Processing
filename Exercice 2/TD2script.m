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
binImage = imbinarize(grayImage);         % conversion en image binaire
figure('Name','Image binaire');
imshow(binImage);

% binImage est la donnee a transmettre


for i = 1 : tries
    canalTransmis = canalBinSym(binImage, 0.1);
    
    imageDecodee = decodage(canalTransmis);
    
    %on affiche les images seulement si on simule une seule fois
    if tries == 1
        figure('Name','Canal transmis');
        imshow(canalTransmis, []);
        figure('Name','Image decodee');
        imshow(imageDecodee);

        disp('Taille de binImage :');
        disp(size(binImage));
        
        disp('Taille de canalTransmis :');
        disp(size(canalTransmis));
        
        disp('Taille de imageDecodee :');
        disp(size(imageDecodee));

    end

    

    %nombreErreurs = comparation(binImage, imageDecodee);
    %bilanErreurs(i) = nombreErreurs;
end


