function [N,D]=coeff(H)
%COEFF Returnerar t�ljar- och n�mnarpolynomskoefficienterna 
%    hos laplace- eller z-transformer.
%
%    [T,N] = COEFF(X) - X �r laplace- eller z-transform.
%    
%    Beskriving:
%    T och N blir radvektorer med koefficienterna f�r transformens t�ljar- 
%    resp. n�mnarpolynom. H�gstagradskoefficienten st�r f�rst i vektorn.
%    
%    See also:
%    IN, PO, ZE
%    

global pm1 pm2 pm3 pm4 KlabL
if vtype(H)==6 | vtype(H)==10,
 N=real(H(1,3)/H(2,3)*poly(H(1,4:3+H(1,2))));
 D=real(poly(H(2,4:3+H(2,2))));
else
 error('Input incorrect: not Laplace or z transform')
end
