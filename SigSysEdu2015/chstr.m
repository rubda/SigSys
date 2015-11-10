function sut=chstr(str,var)
% chstr
% chstr, som anv�nds av funktionen in, l�gger till '.'
% f�re alla '^', '*' och '/', i textstr�ngen som
% definierar den inmatade funktionen.
%
v = char(str);
for k = fliplr(find((v=='^') | (v=='*') | (v=='/')))
   v = [v(1:k-1) ' .' v(k:end)];
end
sut=['(' v ').*ones(size(' var '))'];

