function result = decodage(canalTransmis)
% decodage  prend une decision a la majorite pour reconstruire les donnees
% en sortie du canal de transmission 
%
% canal1Transmis  = premiere repetition en sortie du canal
% 
% canal2Transmis  = deuxieme repetition en sortie du canal
% 
% canal3Transmis  = troisieme repetition en sortie du canal
% 
% result   = donnee reconstruite
%

%initialisation de la structure utilisee pour le resultat

result = zeros (size(canalTransmis));

% H (avec syndromes r1 à r4)
% H = [1 0 0 0 1 0 1
%      0 1 0 0 1 1 0
%      0 0 1 0 1 1 1
%      0 0 0 1 0 1 1];

% 1 map avec 4 clés et comparer les valeurs
keySet = {'1000',
        '0100',
        '0010', 
        '0001'};

valueSet = {'101',
    '110',
    '111',
   '011'};
H = containers.Map(keySet,valueSet);

%linéarisation de l'image en n*1
[x y] = size(canalTransmis);
imgLinear = canalTransmis(:);
resultLinear = zeros (size(imgLinear));

n = numel(imgLinear)
if mod(n, 7 )~= 0
    error("décodage : le nombre de bit doit être multiple de 7");
end

mapZ = containers.Map( ...
    {'101','110','111','011'}, ...
    [1,2,3,4] ...
);


% ATTENTION toutes les valeurs utilisees sont soit 0 soit 1
for i = 1:4:n-3
    block = imgLinear(i:i+6); %récupération du bloc de 7 bits

    if numel(block) ~= 7
        error('Suite de bits non-égale à 7');
    end

    d = block(1:4);
    p = block(5:7);

    keyD = sprintf('%d%d%d%d', d); %toString()
    keyP = sprintf('%d%d%d', p); %'101'



    if(isKey(H, keyD))
        expectedP = H(keyD);

        if  ~strcmp(expectedP, keyP)
            
            %trouver les p bits dans la map pour connaitre le bit à changer
            if isKey(mapZ, keyP)
                pos = mapZ(keyP);     % 1..4
                d = flipBit(d, pos);  % inverse d(pos)
            else
                %Cas typiques '001','010','100' = erreur sur bit de parité -> on ne touche pas aux data
                %ou z='000' (pas d'erreur)
            end
        end
        % add corrected (or not) block

        resultLinear = resultLinear + d
    else
        fprintf("Data %s absente de la map !!", keyD);
    end
end

%reconstruire l'image
result = reshape(resultLinear, i, j)

end

function out = flipBit(block, pos)
    if numel(block) ~=4
        error("le block doit avoir une longueur de 4")
    end
    if pos < 1 || pos > 4
        error("pos doit etre entre 1 et 4")
    end
    out = block;
    out(pos) = ~block(pos);
   
end