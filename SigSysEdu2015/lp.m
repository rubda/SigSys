function y=lp(u,fc)
%LP Ideal l�gpassfiltrering.
%
%    y = LP(x,fc) - x �r tidskontinuerlig signal, fc �r reellt tal.
%    y = LP(x,theta_c) - x �r tidsdiskret signal, theta_c �r reellt tal.
%    D = LP(C,fc) - C �r komplex fourierserieutveckling av tidskontinuerlig
%                      periodisk signal, fc �r reellt tal.                            
%    Y = LP(X,fc) - X �r fouriertransform till tidskontinuerlig signal, 
%                 fc �r reellt tal.
%    Y = LP(X,theta_c) - X �r fouriertransform till tidsdiskret signal, 
%                      theta_c �r reellt tal.
%    
%    Beskrivning:
%    Ideal l�gpassfiltrering med gr�nsfrekvens fc respektive normerad 
%    gr�nsfrekvens theta_c.
%    
%    Example:
%    x = in('exp(-t)*sin(10*t)*us(t)','t');
%    y = lp(x,3);
%    
%    See also:
%    HP, BP, BS, LPLP, LPHP, OUTPUT
%    

global pm1 pm2 pm3 pm4 KlabL
if fc<=0, error('Cutoff frequency must be positive'); end
fl=0;
if vtype(u)==4 | vtype(u)==5,
 if vtype(u)==5, u=ifoutr(u); fl=1; end
 a=ceil(2*KlabL*fc*u(KlabL+1));
 if a<KlabL,
  T=u(KlabL+1);
  u=[u(KlabL/2+1:KlabL) zeros(1,KlabL) u(1:KlabL/2)];
  u=fft(u);
  y=[u(1:a) zeros(1,2*(KlabL-a)+1) u(2*KlabL-a+2:2*KlabL)];
  u=[];
  y=ifft(y);
  y=[y((1.5*KlabL+1):2*KlabL) y(1:KlabL/2) T];
  y=real(y);
  if fl==1, y=foutr(y); end
 else
  y=u;
 end
elseif vtype(u)==8 | vtype(u)==9,
 if vtype(u)==9, u=ifoutr(u); fl=1; end
 a=ceil(2*KlabL*fc);
 if a<KlabL,
  u=[u(KlabL/2+1:KlabL) zeros(1,KlabL) u(1:KlabL/2)];
  u=fft(u);
  y=[u(1:a) zeros(1,2*(KlabL-a)+1) u(2*KlabL-a+2:2*KlabL)];
  u=[];
  y=ifft(y);
  y=[y((1.5*KlabL+1):2*KlabL) y(1:KlabL/2) 0 0 0 0];
  y=real(y);
  if fl==1, y=foutr(y); end
 else
  y=u;
end
elseif vtype(u)==7	% Filtrering av fourierserie. Till�gg Lasse A. 991115!
   y=remtone(u,'lp',ceil(fc/u(513))); % wc/w1=fc*T: u(513)=1/T
else
 error('Input incorrect')
end
