function F = func_list(x, C1, r1, C2, r2)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
% f1 = (x - C1)'*(x - C1) - r1^2;
% f2 = (x - C2)'*(x - C2) - r2^2;
f1 = norm(x - C1)^2 - r1^2;
f2 = norm(x - C2)^2 - r2^2;
F = [f1, f2];
end