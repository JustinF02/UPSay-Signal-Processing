%--------------------------------------------------------------------------
% Exercice 3
%--------------------------------------------------------------------------
function exercice3()
    %src = 'ABACBAC';
    src = 'AAACCBB';
    [symbols,probs] = compute_probabilities(src);
    code = encode(symbols, probs, src);
    src2 = decode(symbols, probs, code);
end

% Fonction calculant les probabilités d'une source
function [symbols,probs] = compute_probabilities( src )
    disp(sprintf('---------[ computing probabilities ]---------'));
    symbols = [];
    probs = [];
    % ...
end

% Fonction codant une source en un réel
function binf = encode( symbols, probs, src )
    disp(sprintf('---------[ encoding ''%s'' ]---------', src));
    binf = 0.0;
    bsup = 1.0;
    long = 1.0;
    disp(sprintf('init binf = %.20f, bsup = %.20f, long = %.20f', binf, bsup, long));
    % ...
    disp(sprintf('code = %.20f', binf));
end

% Fonction décodant un réel en source
function src2 = decode( symbols, probs, code )
    disp(sprintf('---------[ decoding ''%.20f'' ]---------', code));
    src2 = '';
    % ...
    disp(sprintf('src = %s', src2));
end