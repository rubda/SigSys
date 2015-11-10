function u=sample(str,fs)
%SAMPLE Sampling av signaler.
%
%    x = SAMPLE(uttryck,fs) - uttryck �r text, fs �r reellt tal.
%    
%    Beskrivning:
%    Samplar en signal med sampelfrekvensen fs. Signalen ges som textstr�ngen 
%    uttryck, inneh�llande det matematiska uttrycket som funktion av t. 
%    Textstr�ngen skall omges av apostrofer.
%    
%    Example:
%    x = sample('exp(-t)*sin(2*pi*t)*us(t)',10);
%    
%    Vanliga fel:
%    En tidskontinuerlig signal inmatad med funktionen in kan inte samplas, 
%    eftersom den i sj�lva verket redan �r samplad.
%    I exemplet ovan kan man allts� INTE mata in x som
%        xs = in('exp(-t)*sin(2*pi*t)*us(t)','t');
%        x = SAMPLE(x,10);
%        
%    Man kan inte heller anv�nda lokala variabler i argumentet uttryck, 
%    eftersom funktionen sample inte kommer �t s�dana variabler.
%    Man kan allts� INTE mata in enligt f�ljande:
%    	A = 5;    
%        x = SAMPLE('A*exp(-t)*us(t)',10);
%    Anv�nd i st�llet n�gon av de fyra f�rdefinierade globala 
%    kretslab variablerna pm1...pm4.
%    
%    See also:
%    IN, PAM
%    

global pm1 pm2 pm3 pm4 KlabL
if vtype(str)~=1 & vtype(str)~=2, error('Input incorrect'); end
str=chstr(str,'t');
T=1/fs;
t=T*(-KlabL/2:(KlabL/2-1));
u=[eval(str) 0 0 0 0];

% Samma till�gg som i slutet av in.m, f�r att eliminera NaN:
u_is_NaN=find(isnan(u)==1);
u(u_is_NaN)=zeros(size(u_is_NaN));

