function result = canalBinSym(data, pError)
    % canalBinSym simule une transmission par un canal binaire symétrique
    % avec une probabilité d'erreur pError
    %
    % data     = donnée envoyée par le canal de transmission;
    %            format: matrice contenant des 1 et des 0
    % pError   = probabilité d'erreur
    % result   = donnée en sortie du canal de transmission
    
    [n, m] = size(data);  % Taille de l'image d'entrée
    result = data;  % Initialisation de la matrice résultat comme une copie de l'entrée

    % Simulation du canal binaire symétrique
    for i = 1:n
        for j = 1:m
            % Introduire une erreur avec probabilité pError
            if rand < pError  % Si un nombre aléatoire est inférieur à pError
                result(i, j) = ~data(i, j);  % Inverser le bit
            else
                result(i, j) = data(i, j);  % Sinon, conserver le bit
            end
        end
    end
end
