function D2=remtone(D,A,n0)
%REMTONE Tar bort deltoner fr�n fourierserien D.
%
%    D2 = REMTONE(D,[n1 n2...nN]) - Tag bort deltonerna nr. n1, n2, ... och nN.
%    D2 = REMTONE(D,'odd')        - Tag bort alla deltoner f�r udda n.
%    D2 = REMTONE(D,'even')       - Tag bort alla deltoner f�r j�mna n.
%    D2 = REMTONE(D,'all',n0)     - Tag bort alla deltoner fr.o.m. delton n0.
%
%    F�r f�ljande varianter skall REMTONE tolkas som ett  
%    idealt frekvensselektivtLP-, HP-, BP resp. BS-filter:
%    D2 = REMTONE(D,'lp',n0)      - Sl�pp bara igenom alla deltoner upp till och med delton n0
%    D2 = REMTONE(D,'hp',n0)      - Sl�pp bara igenom alla deltoner fr�n och med delton n0
%    D2 = REMTONE(D,'bp',[n0 n1]) - Sl�pp bara igenom deltonerna fr�n n=n0 till n=n1
%    D2 = REMTONE(D,'bs',[n0 n1]) - Sl�pp igenom alla deltoner utom de fr�n n=n0 till n=n1
%    
%    Beskrivning:
%    Deltonerna n1,n2,...,nN tas bort fr�n D. Tillvalet 'odd' tar bort alla udda 
%    deltoner och 'even' tar bort alla j�mna deltoner. 
%    Tillvalet 'all',n0 tar bort alla toner fr�n och med delton n0.
%    Notera att max{n1,n2,...,nN}  =  255.
%     
%    Example:
%    D  = fouser('pulse(t,0,0.5)',1);
%    D2 = remtone(D,[1 3 8]);
%    D3 = remtone(D,'bp',[3 10]);
%    
%    See also:
%    FOUSER, VALUE, SIGNAL, SPECT
%    

global pm1 pm2 pm3 pm4 KlabL
if vtype(D)~=7, error('Input incorrect: not Fourier series'); end
D2=D;
if size(A)==[1 4],
 if A=='even',
  clear A
  A=2:2:256;
 end
end
if size(A)==[1 3],
 if A=='odd',
  clear A;
  A=1:2:255;
 elseif A=='all',
  clear A
  A=n0:255;
 end
end
if size(A)==[1 2], %Till�gg, Lasse A. 991115
   if A=='lp'
      clear A;
      A=n0+1:255;
   elseif A=='hp'
      clear A;
      A=0:n0-1;
   elseif A=='bp'
      clear A;
      A=[0:n0(1)-1 n0(2)+1:255];
   elseif A=='bs'
      clear A;
      A=n0(1):n0(2);
   end
end
for i=1:length(A),
 if A(i)==0,
  D2(1)=0;
 else
  D2(A(i)+1)=0;
  D2(513-A(i))=0;
 end
end

