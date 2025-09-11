function result = comparation(dataIn, dataOut)
% comparation  fait un comptage direct des bits 
% qui sont differents entre dataIn et dataOut
%
% dataIn   = donnee envoyee par le canal de transmission;
%            format: matrice contenant des 1 et des 0
% dataOut  = donnee decodee en sortie du canal de transmission;
%            format: le meme que la donnee d'entree
% result   = nombre de bits differents entre les deux matrices
%
result = 0;
[n, m] = size(dataIn)
for i = 1:n 
    for j = 1:m
        if(dataIn(i,j) ~= dataOut(i,j)) 
            result = result +1;
        end
    end
end

fprintf("probabilité calculée : %f ", result/(n*m));
%le code suivant envoie 0
% a modifier pour compter le nombre de differences



end