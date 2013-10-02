% evalue le polynome qui a comme coefficients coef au point x
% coef(1) * x^3 + coef(2) * x^2 + coef(1) * x
function p = badass_polyval (coefs, x)
p = 0;
for coef = coefs
    p = p * x + coef;
end
end
