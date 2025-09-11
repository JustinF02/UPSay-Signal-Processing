function result = decodage(canal1Transmis, canal2Transmis, canal3Transmis)
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
result1 = zeros (size(canal1Transmis)); 
result2 = zeros (size(canal2Transmis));
result3 = zeros (size(canal3Transmis));


%le code suivant ne fait qu'une copie naive du premier canal transmis
% a modifier pour implementer la decision a la majorite

% ATTENTION toutes les valeurs utilisees sont soit 0 soit 1

for i = 1:size(canal1Transmis,1)
    for j = 1:size(canal1Transmis,2)
        % bit majoritaire ICI
        if(canal1Transmis(i,j) + canal2Transmis(i,j) + canal3Transmis(i,j) > 1)
            result(i,j) = 1;
        else
            result(i,j) = 0;
        end
    end
end

end