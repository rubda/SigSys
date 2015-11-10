function z=ze(H)
%ZE Nollst�llel�gen.
%
%    z = ZE(X) - X �r laplace- eller z-transform.
%    
%    Beskrivning:
%    Returnerar en radvektor med X:s nollst�llen.
%    
%    See also:
%    PO
%    

global pm1 pm2 pm3 pm4 KlabL
if vtype(H)==6 | vtype(H)==10,
 z=H(1,4:3+H(1,2));
else
 error('Input incorrect: not Laplace- or z-transform')
end

