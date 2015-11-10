function y=deriv(x)
%DERIV Derivering av signaler.
%
%    y = DERIV(x) - x �r tidskontinuerlig signal.
%    
%    Beskrivning:
%    Approximativ derivering av tidskontinuerliga signaler. Derivatan 
%    x'(t) approximeras till ungef�r lika med (x(t+T)-x(t))/T, d�r T 
%    best�ms av sampelfrekvensen (kan ej p�verkas av anv�ndaren).
%    
%    See also: 
%    INTEGR
%    

global pm1 pm2 pm3 pm4 KlabL
if vtype(x)==4,
 y=diff(x(1:KlabL));
 y=[[y(1) y]/x(KlabL+1) x(KlabL+1)];
else
 error('Input incorrect: not signal')
end



 
 
