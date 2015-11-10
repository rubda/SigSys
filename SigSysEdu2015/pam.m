function y=pam(u,fs,str)
%PAM Pulsampitudmodulering.
%
%    y = PAM(x,fs)         - x �r tidsdiskret signal, fs �r reellt tal.
%    y = PAM(x,fs,uttryck) - x �r tidsdiskret signal, fs �r reellt tal, 
%                          uttryck �r text.
%    
%    Beskrivning:
%    Funktionen pulsamplitudmodulerar x[n] med avst�ndet T = 1/fs mellan pulserna. 
%    Pulsformen p(t) ges som textstr�ngen uttryck inneh�llande det matematiska 
%    uttrycket som funktion av t. T och fs �r till�tna konstanter i uttrycket. 
%    Textstr�ngen skall omges av apostrofer. Om ingen pulsform anges anv�nds 
%    p(t) = sinc(t/T), vilket motsvarar ideal rekonstruktion.
%    
%    Example:
%    x = sample('exp(-t)*us(t)',10);
%    y = pam(x,10);
%    
%    Vanliga fel:
%    Om x[n] inneh�ller m�nga punkter skilda fr�n noll kan ber�kningen ta 
%    v�ldigt l�ng tid. Spara g�rna dina variabler innan du anv�nder pam,
%    om du skulle beh�va avbryta och starta om Matlab...
%    
%    See also:
%    SAMPLE
%    

global pm1 pm2 pm3 pm4 KlabL
if nargin<3, str='sinc(t*fs)'; end
if vtype(u)~=8, error('Input incorrect'); end
if vtype(str)~=1 & vtype(str)~=2, error('Input incorrect'); end
str=chstr(str,'t');
b=50;
T=1/fs;
for i=1:3
 t=1/(2*b)*(-256:255);
 X=eval(str);
 X=fft(X);
 if max(abs(X(1:256)))<=50*max(abs(X(193:256))),break; end
 b=b/2;
end
if b==6.25, b=12.5; end
v=abs(u(1:KlabL));
a=find(v>1e-3*max(v));
t0=(-KlabL/2:KlabL/2-1)/(4*b);
y=zeros(1,KlabL);
for i=a-KlabL/2-1,
 t=t0-i*T;
 y=y+u(i+KlabL/2+1)*eval(str);
end
y=[y 1/(4*b)];
