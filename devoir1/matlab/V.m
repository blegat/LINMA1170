function variations = V(X)
% auteurs : groupe 3 (Arnaud Cerckel and Benoit Legat and
% Nicolas Stevens and Harold Taeter)
tol = 1e-8;
noZeros = X(abs(X) > tol);
normalized = noZeros ./ abs(noZeros);
variations = sum(abs(diff(normalized)/2));
end