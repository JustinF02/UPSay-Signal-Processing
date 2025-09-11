function result = canalBinSym(data)
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
for i = 1:4:n-3
    d = data(i:i+3); %récupération du bloc de 4 bits
    d1 = d(1);
    d2 = d(2);
    d3 = d(3);
    d4 = d(4);

    %génération des bits de parité

    p5 = xor(d1, xor(d2, d3));
    p6 = xor(d2, xor(d3,d4));
    p7 = xor(d1, xor(d3, d4));

    %codeword
    result = [d1 d2 d3 d4 p5 p6 p7]

end

end