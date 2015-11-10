function D=fouser(u,To,fi,TT)
%FOUSER Definition av fourierserier.
%
%    D = FOUSER(uttryck,To) - uttryck �r text och To �r reellt tal.
%    D = FOUSER(Co,uttryck1,uttryck2,To) - Co och To �r reella tal, 
%                                        uttryck1 och uttryck2 �r text.
%    
%    Beskrivning:
%    I det f�rsta fallet ber�knas den komplexa fourierserieutvecklingen Dn f�r 
%    en periodisk tidssignal med periodtid To. Tidssignalen anges som textstr�ngen 
%    uttryck, som beskriver det matematiska uttrycket som funktion av t i 
%    tidsintervallet 0 <= t < To. Textstr�ngen skall omges av apostrofer.
%
%    I det andra fallet ber�knas den komplexa fourierserieutvecklingen Dn d� den
%    periodiska signalen �r given som en fourierserieutveckling med cosinussignaler;
%    Co+summa{Cn*cos((2*pi/To)*n*t+fi_n)}; n=1:inf. Argumenten uttryck1 och uttryck2 
%    �r textstr�ngar som beskriver Cn resp. fi_n som matematiska funktioner av n. 
%    Textstr�ngarna skall omges av apostrofer. 
%    Funktionen ber�knar 256 fourierkoefficienter.
%    
%    Example:
%    D = fouser('pulse(t,0,0.5)',1);
%    signal(D);
%    spect(D);
%    D = fouser(1,'1/n','atan(n)',1); 
%    
%    Vanliga fel:
%    De matematiska uttrycken f�r bara inneh�lla variablerna t (uttryck) respektive 
%    n (uttryck1 och uttryck2). Exempelvis funkerar *inte*
%    A = 5; D = FOUSER('A*pulse(t,0,0.5)',1);
%    eftersom kommandot fouser anv�nder lokala variabler, och 
%    allts� inte hittar variabeln A n�r uttrycket skall ber�knas. Anv�nd i 
%    st�llet n�gon av de fyra f�rdefinierade globala variablerna pml...pm4.
%    
%    Ett annat vanligt fel �r att man beskriver tidssignalen i fel tidsintervall.
%    Observera att i fallet D = FOUSER(uttryck,To) skall uttryck beskriva tidssignalen
%    fr�n t = 0 till t = To!
%    
%    See also:
%    REMTONE, SIGNAL, SPECT, IN, SAMPLE 
%    

global pm1 pm2 pm3 pm4 KlabL
if nargin==2,
 t=To/512*(0:511);
 u=eval(chstr(u,'t'));
 U=1/512*fft(u);
 D=[U 1/To 0 0];
end
if nargin==4,
 D=zeros(1,515);
 D(513)=1/TT;
 D(1)=u;
 n=1:256;
 A=eval(chstr(To,'n'));
 V=eval(chstr(fi,'n'));
 D(2:257)=0.5*A.*cos(V)+j*0.5*A.*sin(V);
% D(2:257)=0.5*A.*sin(V)-j*0.5*A.*cos(V);
 A=A(256:-1:1);
 V=V(256:-1:1);
 D(257:512)=0.5*A.*cos(V)-j*0.5*A.*sin(V);
% D(257:512)=0.5*A.*sin(V)+j*0.5*A.*cos(V);
end

 
