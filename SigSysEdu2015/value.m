function v=value(U,f)
%VALUE Returnerar enskilda signal- eller transformv�rden.
%
%    v = VALUE(x,t0) - x �r tidskontinuerlig signal, t0 �r reellt tal.
%    v = VALUE(x,n0) - x �r tidsdiskret signal, n0 �r reellt heltal.
%    v = VALUE(X,f0) - X �r fouriertransform eller laplacetransform till 
%                    tidskontinuerlig signal, f0 �r reellt tal.
%    v = VALUE(X,theta_0) - X �r fouriertransform eller z-transform till
%                         tidsdiskret signal, theta_0 �r reellt tal.
%    v = VALUE(C,k0)      - C �r fourierserie, k0 �r reellt heltal.
%    v = VALUE(X,k0)      - X �r DFT, k0 �r reellt heltal.
%    
%    Beskrivning:
%    Ger v�rdet f�r signal eller transform vid given tidpunkt resp. frekvens.
%    F�r laplace- och z-transformer ber�knas v�rden p� imagin�ra axeln resp. 
%    p� enhetscirkeln.
%    
%    Example:
%    H = butterw(3);
%    v = value(H,1);
%    
%    Vanliga fel:
%    Kretslab representerar tids- och frekvenskontinuerliga signaler resp. 
%    transformer som samplade versioner av motsvarande kontinuerliga funktioner.
%    Om man inte anger ett lagrat tids- eller frekvensv�rde t0, n0, f0 eller 
%    theta_0, returneras det n�rmast lagrade funktionsv�rdet.
%    F�r fourierserie och DFT m�ste k0 vara heltal.
%    Om man anger ett tid- eller frekvenspunkt som �r utanf�r det samplade
%    intervallet, returneras ett felmeddelande.
%    
%    See also:
%    SIGNAL, SPECT
%    

global pm1 pm2 pm3 pm4 KlabL
if vtype(U)==4,
 a=round(f/U(KlabL+1));
 if abs(a)>KlabL/2, error('No data for that time'); end
 v=U(a+KlabL/2+1);
 disp(['Amplitude: ' num2str(v)])
elseif vtype(U)==5,
 if abs(f)>U(KlabL+1)/2, error('No data for that frequency'); end
 a=round(KlabL*f/U(KlabL+1));
 v=U(a+1);
 m=num2str(abs(v));
 disp(['Magnitude: ' m])
 p=180/pi*angle(v);
 if p>0, p=p-360; end
 disp(['Phase: ' num2str(p) ' degrees'])
elseif vtype(U)==6,
 Ut=U(1,3)*poly(U(1,4:3+U(1,2)));
 Un=U(2,3)*poly(U(2,4:3+U(2,2)));
 v=polyval(Ut,j*2*pi*f)./polyval(Un,j*2*pi*f);
 m=num2str(abs(v));
 disp(['Magnitude: ' m])
 p=180/pi*angle(v);
 if p>0, p=p-360; end
 disp(['Phase: ' num2str(p) ' degrees'])
elseif vtype(U)==7,
 if f<0, error('Input incorrect'); end
 if f>=256, error('No data for that tone'); end
 if f~=0,
  v=U(f+1);
  m=num2str(abs(2*v));
  disp(['Amplitude: ' m])
  p=90+180/pi*angle(v);
  if p>180, p=p-360; end
  if m==0, p=0; end
  p=num2str(p);
  disp(['Phase: ' p ' degrees'])
 else
  v=real(U(1));
  m=num2str(real(U(1)));
  disp(['DC Level: ' m])
 end
 return
elseif vtype(U)==8,
 a=round(f);
 if abs(a)>KlabL/2, error('No data for that point'); end
 v=U(a+KlabL/2+1);
 disp(['Amplitude: ' num2str(v)])
elseif vtype(U)==9,
 a=rem(rem(round(KlabL*f),KlabL)+KlabL,KlabL);
 v=U(a+1);
 m=num2str(abs(v));
 disp(['Magnitude: ' m])
 p=180/pi*angle(v);
 if p>0, p=p-360; end
 disp(['Phase: ' num2str(p) ' degrees'])
elseif vtype(U)==10,
 Ut=U(1,3)*poly(U(1,4:3+U(1,2)));
 Un=U(2,3)*poly(U(2,4:3+U(2,2)));
 v=polyval(Ut,exp(j*2*pi*f))./polyval(Un,exp(j*2*pi*f));
 m=num2str(abs(v));
 disp(['Magnitude: ' m])
 p=180/pi*angle(v);
 if p>0, p=p-360; end
 disp(['Phase: ' num2str(p) ' degrees'])
elseif vtype(U)==11,
 if f>U(129), error('Point number larger than length of DFT'); end
 v=U(f+1);
 m=num2str(abs(v));
 disp(['Magnitude: ' m])
 p=180/pi*angle(v);
 if p>0, p=p-360; end
 disp(['Phase: ' num2str(p) ' degrees'])
else
 error('Input incorrect: not signal or transform')
end


