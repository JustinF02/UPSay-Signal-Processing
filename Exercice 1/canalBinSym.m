function result = canalBinSym(data, pError)
% canalBinSym  simule une transmission par un canal binaire
% symetrique avec probabilite d'erreur pError
%
% data     = donnee envoyee par le canal de transmission;
%            format: matrice contenant des 1 et des 0
% pError   = probabilite erreur
% result   = donnee en sortie du canal de transmission
%

%initialisation de la structure utilisee pour le resultat
result = zeros (size(data)); 

%le code suivant ne fait qu'une copie (canal parfait)
% a modifier pour simuler le canal binaire symetrique avec pError

for i = 1:size(data,1)
    for j = 1:size(data,2)

        if(rand() > pError) %rand() gives random between 0 and 1
            result(i,j) = data(i,j);
        else %erreur
            result(i,j) = ~data(i,j); %inversion du bit
    end
end

end