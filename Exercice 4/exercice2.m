%--------------------------------------------------------------------------
% Exercice 2
%--------------------------------------------------------------------------
function exercice2()
    % Question 2
    % ...

    % Question 3
    % ...
end

% Fonction de codage RLE d'une image
function pairs = encode( im )
    pairs = {};
    % ...
end

% Fonction de décodage RLE d'une image
function im = decode( pairs, nb_rows, nb_cols )
    im2 = zeros(1, nb_rows*nb_cols);
    % ...
    im = uint8(reshape(im2, nb_rows, nb_cols));
end