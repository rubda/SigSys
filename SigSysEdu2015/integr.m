function y=integr(x)
%INTEGR Integrering av signaler.
%
%    y = INTEGR(x) - x �r en tidskontinuerlig signal.
%    
%    Beskrivning:
%    Approximativ integrering av tidskontinuerliga signaler. Integralen 
%    approximeras som integralen �ver x(t)dt som �r ungef�r lika med 
%    T*summa{x(nT)}, d�r T best�ms av sampelfrekvensen (kan ej p�verkas 
%    av anv�ndaren).
%    
%    See also:
%    DERIV
%    

global pm1 pm2 pm3 pm4 KlabL
if vtype(x)==4,
 y=cumsum(x(1:KlabL))*x(KlabL+1);
 y=[y x(KlabL+1)];
else
 error('Input incorrect: not signal')
end

