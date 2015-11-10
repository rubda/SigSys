%DD1 Demonstration av Kretslabfunktioner f�r tidskontinuerliga signaler och system. 
%
%    Tryck p� valfri tangent f�r att stega dig igenom demonstrationsfilen! 
%    K�R DD1 F�R ATT SE HUR KRETSLAB ANV�NDS (i del 1)!!
%
% See also DD2

% Lasse: Vid f�revisning, st�ll om fonten i "File -> Preferences ->
	% -> Command Window Font" till "MS Sans Serif", 18 pt !!!
	% ----------------------------------------------------------------


	clc
	echo on

    % Mata in signal (argumenten �r textstr�ngar).
   % OBS!!  Gl�m inte semikolon i slutet av raden !!
x=in('sin(2*pi*t)','t');

signal(x)  		% Rita signal. Ser det ut som en sinus?
                % H�r finns behov av att titta p� ett mer begr�nsat tidsintervall...

	pause  % ----------------------------------------------------------------

signal(x,2) 	% Definiera utskiftsinterval, -2 < t <= 2 sek
                % Hackigheten beror p� att Matlab samplat signalen i ett
                % antal (65536) tidpunkter och drar vid utristningen streck
                % mellan sampelv�rdena.

	pause  % ----------------------------------------------------------------

	clc
w=in('exp(-t)*us(t)','t');   % Mata in en annan signal

signal(x,w,5)  	 % Rita tv� signaler i samma f�nster:

	pause  % ----------------------------------------------------------------

	clc
z=mult(x,w);  	 % Multiplicera signalerna x och w ( z(t) = x(t)*w(t) )

signal(x,z,5)

	pause  % ----------------------------------------------------------------

	clc
	% Man kan �ven mata in z(t) som ett enda uttryck.
	% Figur med z(t) i b�gge graferna (notera den sammansatta inmatningen):
signal(z,in('exp(-t)*sin(2*pi*t)*us(t)','t'),5);

	pause  % ----------------------------------------------------------------

	clc
who   	% Visa anv�nda variabler (i "workspace"):

	pause  % ----------------------------------------------------------------

size(z)  	 % Dimensionen av z:

	% Vektorn z �r en samplad version (65536 sampelv�rden) av den 
	% tidskontinuerliga funktionen z(t)!

	pause  % ----------------------------------------------------------------

z(65537)  	 % Sampelperioden (h�r: T=0.01 sek) ges av position 65537 i z-vektorn

	pause  % ----------------------------------------------------------------

	clf
	clc
   % Rita sj�lv z(t) f�r 0 <= t <= 2 sek, m.h.a. MatLab-funktionen "plot".
	% Matlab drar r�ta linjer mellan sampelv�rdena.
    % tmax = 2 = T*200 sek (sampelperiod T=0.01 sek)
    % Tiden t=0 motsvaras av position 32769 i z-vektorn:
    
plot(z(65537)*(0:200),z(32769:32769+200))
	
grid   	% Rita rutm�nster i utskriften

	pause  % ----------------------------------------------------------------

hold on   	% "H�ll kvar" den utritade kurvan

	% Rita r�da ('r') cirklar ('o') p� varje sampelv�rde:
    
plot(z(65537)*(0:200),z(32769:32769+200),'or')
	
	% Man kan sj�lv zooma in i utritad kurva m.h.a. musen.
	% Man kan �ven rita pilar och skriva text:
	% (OBS: fungerar bara p� version > Matlab 5.3

	pause % ----------------------------------------------------------------
   
	clc
   clf reset	
zd=deriv(z);		% Derivering av signal

zi=integr(z); 		% Integrering av signal

signal(zd,zi,5)

	% Definiera text i "underplot:ar".
	% G�r den �vre "utskriftsaxeln" aktiv:
subplot(2,1,1)

	% Definiera titel:
title('Derivatan av signalen z(t), dvs z''(t)')


xlabel('Tid (s)') 	 % Definiera x-axel:
	
	pause  % ----------------------------------------------------------------

	% G�r motsvarande med den undre delutskriften:
subplot(2,1,2)
ylabel('Integralen av z(t)')
	
	pause  % ----------------------------------------------------------------

zdel=delay(z,1); 	 % F�rdr�jning av signal, zdel(t) = z(t-1):

signal(z,zdel,5)
	
	pause  % ----------------------------------------------------------------

za=ampl(z,3);  	 % F�rst�rkning av signal, za(t) = 3z(t)

signal(z,za,5)
	
	pause  % ----------------------------------------------------------------

	% Multiplikation av signaler, inmatade med 'in', zm(t) = z(t)*za(t):
zm=mult(z,za);

signal(z,zm,3)

subplot(2,1,1)
title('z(t)')

subplot(2,1,2)
title('z(t) * zm(t)  =  z(t) * (z(t) * za(t))  =  z(t) * (z(t) * 3*z(t))')
	
	pause  % ----------------------------------------------------------------

e=value(z,0.23)  	 % Best�m signalv�rdet e = z(0.23):

	pause  % ----------------------------------------------------------------




	clf
	clc
	% FILTRERING (faltning):
	% -----------------------

xstr='exp(-t)*sin(2*pi*t)*us(t)';   % Mata in textstr�ng

	% Definiera funktionen x(t) (samma x(t) som anv�nts tidigare):
x=in(xstr,'t');

	pause  % ----------------------------------------------------------------

	% Definiera impulssvaret h(t) till ett sabilt & kausalt LTI-system:
h=in('exp(-2*t)*us(t)','t');

signal(x,h,3)
	
	pause  % ----------------------------------------------------------------

y=output(x,h);  	% Ber�kna LTI-systemets utsignal

signal(x,y,5)

subplot(2,1,1)
title('x(t) = exp(-t)*sin(2*pi*t)*u(t)')
xlabel('')

subplot(2,1,2)
title('y(t) = (x*h)(t), d�r h(t) = exp(-2t)*us(t)')
	
	pause  % ----------------------------------------------------------------

	% Text kan �ven skrivas m.h.a. TeX-kommandon (tit = handtag (pekare)):
subplot(2,1,1)
tit = title('\it x(t) = e^{-t}sin(2\pi t)u(t)')

set(tit,'fontsize',18) 	% �ndra fontstorlek:
xlabel('')

subplot(2,1,2)
title('{\it y(t) = (x*h)(t),} d�r {\it h(t) = e^{-2t}u(t)}')

	pause  % ----------------------------------------------------------------
   
	clf
	clc
	% Funktionen "signalmod" (odokumenterad variant av "signal")
	% kan anv�ndas f�r alternativa utskrifter.
	% x(t) utritas uppe till v�nster:
subplot(2,2,1)
signalmod(x,5)
title('\it x(t)')

	pause  % ----------------------------------------------------------------
   
   % h(t) utritas uppe till h�ger:
subplot(2,2,2)
signalmod(h,5)
title('\it h(t)')

	pause  % ----------------------------------------------------------------
   
   % y(t) utritas under x(t) och h(t):
subplot(2,1,2)
signalmod(y,5)
title('\it y(t) = (x*h)(t)')

	pause  % ----------------------------------------------------------------
   
   
      
   
	clc, clf
	% Fourierserier:
	% -------------------
   
	% Uppgift 14-1 i Kretslabmanualen (Periodtid; T=4 sek):
xper='ramp(t,0,2)+pulse(t,2,3)';		% Definiera x(t) f�r 0 <= t < T
C=fouser(xper,4);			% Ber�kna de komplexa fourierseriekoefficienterna
signal(C)				% Rita 2 perioder av x(t) (2 perioder => default)
	
	pause  % ----------------------------------------------------------------

signal(C,4)		% Rita 4 perioder av x(t) (OBS! Inte 4 sekunder !!)
	
	pause  % ----------------------------------------------------------------
   
   % Rita ampliud- och fasspektrum f�r x(t)
   % Observera ber�kningsonoggrannheten f�r fasen! 
spect(C)	
			
	pause  % ----------------------------------------------------------------
   
	clc
	% Tag bort alla deltoner fr.o.m. delton Nr. 10
	% Rita amplitudspektrum f�r x(t) samt f�r x(t) med borttagna deltoner:
spect(C,remtone(C,'all',10))
	   
	pause  % ----------------------------------------------------------------
   
   % Rita signalen x(t) samt x(t) med borttagna deltoner.
   % Deltoner med relativt h�g frekvens formar skarpa h�rn:
signal(C,remtone(C,'all',10))
	
	pause  % ----------------------------------------------------------------
   
   % Rita amplitudspektrum f�r x(t) samt f�r x(t) med delton 5 nollst�lld:
spect(C,remtone(C,5))
	
	pause  % ----------------------------------------------------------------

   % Rita signalen x(t) samr x(t) med delton 5 nollst�lld:
signal(C,remtone(C,5))
	
	pause  % ----------------------------------------------------------------

	clc
	% OBS! Notera att man INTE kan mata in x=in('....','t'); f�ljt av C=fouser(x,T) !!!

	pause  % ----------------------------------------------------------------
   
thd(C) 	% Ber�kning av Klirrfaktor, normaliserad effekt, medelv�rde, RMS-v�rde & likriktat medelv�rde:

	pause  % ----------------------------------------------------------------
   
      
   
   
   
	clf
	clc
	% Fouriertransform:
	% -----------------------

x=in('exp(-t)*sin(2*pi*t)*us(t)','t'); % = den ovan anv�nda x(t)

X=foutr(x);		% Ber�kna fouriertransformen X(f) till x(t)
spect(X)			% Rita amplitudspektrum |X(f)| och fasspektrum arg H(f)
	
  	pause  % ----------------------------------------------------------------
   
spect(X,10)		% Rita spektrum upp till 10 Hz
   
	pause  % ----------------------------------------------------------------
   
	clc
   xbrus=noise(x,0.005);	% xbrus(t) = x(t) + brus med varians 0.005
signal(x,xbrus,2.5)   		% Rita x(t) och xbrus(t) f�r |t| < 2.5 

	pause  % ----------------------------------------------------------------

Xbrus=foutr(xbrus);	% Fouriertransformera den brusiga signalen

spect(X,Xbrus,10)   	% Rita amplitudspektrum f�r x(t) och xbrus(t)
subplot(2,1,1), axis([0 10 0 0.6])    % �ndra axelgradering f�r |X(f)|
subplot(2,1,2), axis([0 10 0 0.6])    % �ndra axelgradering f�r |Xbrus(f)|
	
	pause  % ----------------------------------------------------------------
   
	% Rita LOGARITMISKT amplitudspektrum f�r x(t) och xbrus(t),
	% dvs rita 20*log(|H(f)|) upp till 10 Hz      (10-logaritmen)
logspect(X,Xbrus,10) 
	
	pause  % ----------------------------------------------------------------
   
   clc
   % Ideal (icke-kausal) filtrering - LP-filter med gr�nsfrekvens 5:
xlp=lp(xbrus,5); 

spect(X,foutr(xlp),10)    % Amplitudpektrum f�r x(t) och LP-filtrerad brussignal
subplot(2,1,1), axis([0 10 0 0.6])
subplot(2,1,2), axis([0 10 0 0.6])
	
    pause  % ----------------------------------------------------------------

signal(x,xlp,5)    % x(t) och LP-filtrerad brussignal
	
   pause  % ----------------------------------------------------------------
   
   clc
   % Kausalt LP-filter av 1:a ordningen:
h=in('4*exp(-4*t)*us(t)','t'); % Exempel p� impulssvar
H=foutr(h);	% Ber�kna frekvensfunktionen H(f) 

spect(Xbrus,H) % Max{|H(f)|} = 1  => amplitudnormerat filter
	
   pause  % ----------------------------------------------------------------
   
   clf
   clc
y=output(xbrus,h);	% Ber�kna utsignalen  y(t) = (xbrus*h)(t)

subplot(3,1,1)
signalmod(x,2.5)	    % Rita x(t) �verst
axis([-1 2.5 -1 1])
xlabel('')
title('\it x(t)')

subplot(3,1,2)
signalmod(xbrus,2.5)	    % Rita xbrus(t) i mitten
axis([-1 2.5 -1 1])
xlabel('')
ylabel('{\it x(t)} + brus')

subplot(3,1,3)
signalmod(y,2.5)	    % Rita y(t) underst
axis([-1 2.5 -1 1])
ylabel('\it y(t) = (x_{\rm brus}*h)(t)')
	
	% P.g.a. LP-filtrets utseende har frekvenstoppen vid 1 Hz hos X(f)
   % efter filtreringen f�rskjutits till l�gre frekvens!
   % Man ser i figuren att y(t) har l�gre frekvens �n x(t)

	pause  % ----------------------------------------------------------------

clf
clc
Y=foutr(y);	% Ber�kna Y(f) = F{(xbrus*h)(t)} 
				% Notera att Y(f) �ven kan ber�knas som Y=output(Xbrus,H);
            
subplot(3,1,1)
spectmod(X,'A',10);    % Amplitudspektrum |X(f)| �verst
ylabel('\it |X(f)|')

subplot(3,1,2)
spectmod(Xbrus,'A',10);    % Amplitudspektrum |Xbrus(f)| i mitten
ylabel('\it |X_{\rm brus}(f)|')

subplot(3,1,3)
spectmod(Y,'A',10);    % Amplitudspektrum |Y(f)| underst
ylabel('\it |Y(f)| = |X_{\rm brus}(f)|\times |H(f)|')
	
	pause  % ----------------------------------------------------------------

	clf
   clc
   % Logaritmiskt amplitudspektrum:
logspect(Xbrus,Y)    % Rita |Xbrus(f)| och |Y(f)|

	pause  % ----------------------------------------------------------------
   
   
   clf
   clc
   % Man kan �ven mata in fouriertransformer analytiskt:

pm1=0.5;   	% pm1, pm2, pm3 och pm4 �r Kretslabs fyra global variabler
Xw=in('pm1/2*sinc(w*pm1/4/pi)^2','w');    % Se Tabell 17:8 i formelsamlingen
spect(Xw)
	
	pause  % ----------------------------------------------------------------


	clf
	clc
	% LAPLACETRANSFORMEN   
	% ----------------------------
   
   % Systemfunktionen  H(s) = (s^3 + 100s) / (s^3 + 6s^2 + 16s + 16)
   % Mata in t�ljarpolynomets och n�mnarpolynomets koefficienter:
H=in([1 0 100 0],[1 6 16 16],'s');   
   
pz(H)   % Rita pol-nollst�llediagram
title('\it H(s) = (s^3 + 100s) / (s^3 + 6s^2 + 16s + 16)')
   
	pause  % ----------------------------------------------------------------
   
spect(H,10)    % Rita amplitud- och faskarakt�ristik upp till 10 Hz

	pause  % ----------------------------------------------------------------
   
pzchange(H)     % Med pzchange kan du sj�lv, med hj�lp av mus, l�gga till, 
                % ta bort, flytta och g�ra andra justeringar av transformens 
                % poler och nollst�llen. "Lek" l�nge med denna funktion!!
                %
                % LYCKA TILL!
                %
                % Fr�gor? H�r av dig till mig - 
                % Lasse Alfredsson, lasse@isy.liu.se

