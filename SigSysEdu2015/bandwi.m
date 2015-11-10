function b=bandwi(x,var)
%bandwi
% b=bandwi(x,var) anv�nds av vissa kretslabfunktioner f�r att 
% best�mma ungef�rlig bandbredd f�r signalen x
global pm1 pm2 pm3 pm4 KlabL FSMAX
b=FSMAX/2;
if nargin==2,
 if var=='t',
  for i=1:10    % TIDIGARE 5 i st.f. 10
   t=1/(2*b)*(-256:255);
   X=eval(x);
   X=fft(X);
   if max(abs(X(1:256)))<=100*max(abs(X(129:256))),break; end
   b=b/2;
  end
  b=2*b;
  if b==FSMAX, b=inf; end
  if max(abs(X(1:256)))==0, b=12.5; end 
 elseif var=='f' | var=='w',
  for i=1:5
   f=(0:255)*b/256;
   w=2*pi*f;
   X=eval(x);
   if max(abs(X))<=50*max(abs(X(129:256))),break; end
   b=b/2;
  end
  b=2*b;
  if b==FSMAX, b=inf; end
  if max(abs(X))==0, b=12.5; end
 end
else
 if vtype(x)==4,
  b=1/(2*x(KlabL+1));
 elseif vtype(x)==5,
  b=x(KlabL+1)/2;
 elseif vtype(x)==6,
  xt=x(1,3)*poly(x(1,4:3+x(1,2)));
  xn=x(2,3)*poly(x(2,4:3+x(2,2)));
  for i=1:5
   w=2*pi*b/256*(0:255);
   w=j*w+1e-9;
   X=polyval(xt,w)./polyval(xn,w);
   if max(abs(X))<=50*max(abs(X(129:256))),break; end
   b=b/2;
  end
  b=2*b;
  if b==FSMAX, b=inf; end
 end
end


