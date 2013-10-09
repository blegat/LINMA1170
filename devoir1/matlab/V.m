function variations = V(X)
tol = 1e-8;
noZeros = X(abs(X) > tol);
normalized = noZeros ./ abs(noZeros);
variations = sum(abs(diff(normalized)/2));
end