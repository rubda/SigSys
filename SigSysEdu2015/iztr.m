function x=iztr(X)
%IZTR Invers z-transformering.
%
%    x = IZTR(X) - X �r en z-transform.
%    
%    Beskrivning:
%    Funktionen ber�knar invers z-transform under f�ruts�ttning att 
%    transformens konvergensomr�de �r |z|>R+, d�r R+< = l, dvs. transformens
%    poler finns p� eller innanf�r enhetscirkeln.
%    Eventuella poler i origo f�r ha multiplicitet st�rre �n ett (multipelpol),
%    men f�r �vrigt hanterar iztr endast enkelpoler.
%    
%    Example:
%    X = in([1],[1 0.5],'z');
%    x = iztr(X);
%    
%    Vanliga fel:
%    Se till att z-transformen inte inneh�ller multipelpoler utanf�r origo!
%    iztr anv�nder en partialbr�ksuppdelning fr�n Matlabs bibliotek, och denna 
%    klarar inte multipelpoler utanf�r origo.
%    
%    See also:
%    IFOUTR, ILAPTR
%    

global pm1 pm2 pm3 pm4 KlabL
if vtype(X)~=10, error('Input incorrect, not z-transform'); end
if any(abs(X(2,4:3+X(2,2)))>1), error('Poles outside |z|=1'); end
x=zeros(1,KlabL);
Xt=X(1,3)*poly(X(1,4:3+X(1,2)));
Xn=X(2,3)*poly(X(2,4:3+X(2,2)));
a=find(X(2,4:3+X(2,2))==0);
d=length(a);
if d>0,
 Xn=X(2,4:3+X(2,2));
 Xn(a)=[];
 Xn=X(2,3)*poly(Xn);
end;
if length(Xn)==1,
 Xt=Xt/Xn;
 x=fir(Xt,d-length(Xt)+1);
else
 n=0:KlabL/2-2;
 [r,p,k]=residue(Xt,Xn);
 r=r';
 p=p';
 for i=1:length(r)
  x(2+KlabL/2:KlabL)=x(2+KlabL/2:KlabL)+r(i)*exp(log(p(i))*n);
 end
 if length(k)>0,
  x(2+KlabL/2-length(k):1+KlabL/2)=k;
 end
 x=[zeros(1,d) x(1:KlabL-d) 0 0 0 0];
end
if max(imag(x))>.01*max(real(x)),
 disp('Warning: signal is complex, real part is used.')
end
x=real(x);
