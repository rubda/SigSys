%DD2 Demonstration av Kretslabfunktioner f�r tidsdiskreta signaler och system. 
%
%    Tryck p� valfri tangent f�r att stega dig igenom demonstrationsfilen! 
%    K�R DD2 F�R ATT SE HUR KRETSLAB ANV�NDS (i del 2)!!
%
% See also DD1

clc

    % Lasse: Vid f�revisning, st�ll om fonten i "File -> Preferences ->
   % -> Command Window Font" till "MS Sans Serif", 18 pt !!!
   
   % OBS! Funktionen OHfig anv�nds nedan f�r att rita figurer
   % med tjockare streck och med st�rre textstorlek
	% ----------------------------------------------------------------

	
	clc
  	echo on 
	% Mata in systemfunktionen till ett visst LTI-system
	% H(s) = (s^3 + 100s)/(s^3 + 6s^2 + 16s + 16)
H=in([1 0 100 0],[1 6 16 16],'s');

	
pz(H)	  % Rita pol-nollst�llediagram
	OHfig

	pause  % ----------------------------------------------------------------

	% Rita amplitud- och faskarakt�ristik (0 - 6 Hz)
spect(H,6)
	OHfig

	pause  % ----------------------------------------------------------------

Hn=normal(H);	% Amplitudnormera H => |H(f)|max = 1
   
spect(H,Hn,6)	% Rita |H(f)| och |Hn(f)|
	OHfig

	pause  % ----------------------------------------------------------------

logspect(Hn,6)	% Rita |H(f)| i logaritmisk skala
   OHfig
   
	% OBS!!  "Warning: Log of zero" �r inget att bry sig om !
   
   pause  % ----------------------------------------------------------------
   clc
   
	% Mata in signalen x(t), som sedan f�r bli insignal till systemet 
x=in('exp(-t)*sin(7*t)*us(t)','t');
   
	% Fouriertransformera x(t) (OBS! Laplacetransformering g�r ej numeriskt!)  
X=foutr(x);

	% Ber�kna utsignalens frekvensspektrum, Y(f)=X(f)*Hn(f)
	% H�r anv�nds det amlitudnormerade filtret med systemfkn Hn(s)!
	% Kretslab ber�knar sj�lv Hn(f) = Hn(s)|s=j2pi*f
    
Y=output(X,Hn);		

spect(X,Y,6)	% Rita |X(f)| och |Y(f)|
	OHfig

	pause  % ----------------------------------------------------------------
   
   clc
	% Rita |X(f)|, |H(f)| och |Y(f)| = |X(f)|*|H(f)| i samma figur:
   
clf	% Rensa figurf�nstret

plotX= spectmod(X,'A',6);	% Rita |X(f)| (bl�) (plotX �r "handtag" till kurvan)
hold on	% S� att n�sta kurva ritas i samma diagram

plotH= spectmod(Hn,'A',6);	  % Rita |Hn(f)| (plotH �r "handtag" till kurvan)
set(plotH,'color','magenta') 	% �ndra |Hn(f)|-kurvan till r�d f�rg

plotY= spectmod(Y,'A',6);	% Rita |Y(f)| (plotY �r "handtag" till kurvan)
set(plotY,'color','red')		% �ndra |Y(f)|-kurvan till r�d f�rg

legend('\it |X(f)|','\it |Hn(f)|','\it |Y(f)| = |X(f)|*|Hn(f)|')
hold off

	pause  % ----------------------------------------------------------------
   clc
   
N = ze(H)  	% Nollst�llena till H(s) (den *icke* amplitudnormerade!)
   
P = po(H)	  % Polerna till H(s):

	pause  % ----------------------------------------------------------------
   
poly(N)	  % Ger t�ljarpolynomens koefficienter (fr�n nollst�llena) f�r H(s)

poly(P)	  % Ger n�mnarpolynomens koefficienter (fr�n polerna) f�r H(s)

	pause  % ----------------------------------------------------------------

[Tk,Nk] = coeff(H)	% T�ljar- och n�mnarpolynomens koefficienter f�r H(s)

pause  % ---------------------------------------------------------------

roots(Tk)  	% Ger nollst�llena till polynomet med koefficienter i Tk
	% = Nollst�llena till H(s)

roots(Nk)	% Ger nollst�llena till polynomet med koefficienter i Nk
	% = Polerna till H(s)

	pause  % ----------------------------------------------------------------
	clc
   
	% Hn(s) har ett komplexkonjugerat polpar i s = -2 +/- 2j
	% Flytta dessa till s = -1 +/- 6j, 
	% samt flytta polen i s=-2 till s=-5,5 och �ka dess multipliciteten med 1 
	% (ger allts� dubbelpol i s=-5,5)
	% Tag �ven bort nollst�llet i origo.
	% Den nya systemfunktionen betecknas H2(s) och skall �ven amplitudnormeras:
   
	% Tag f�rst bort polparet (OBS - komplexkonjugatet tas automatiskt bort)
	% samt polen i -2:
H2=rempo(Hn,[-2+2j -2]);
   
	% Tag bort nollst�llet i origo;   
H2=remze(H2,0);
   
	% L�gg till poler i s = -1 +/- 6j och dubbelpol i s = -5,5:
H2=addpo(H2,[-1+6j -5.5 -5.5]);

	% Amplitudnormera:
H2=normal(H2);
   
	pause  % ----------------------------------------------------------------
   
	% Rita pol-nollst�llediagram:
pz(H2)
	OHfig

	pause  % ----------------------------------------------------------------
   
	% Rita amplitud- och faskarakt�ristiken, |H2(f)| resp arg H2(f)
   % Ett hyfsat bra l�gpassfilter (av ordning 4 = antalet poler)
	% med gr�nsfrekvens 1 Hz!
spect(H2,6)
	OHfig

	pause  % ----------------------------------------------------------------
   
	% Rita logaritmisk amplitudkarakt�ristik, 20*log |H2(f)| i tv� varianter
logspect(H2,6)
	OHfig

	pause  % ----------------------------------------------------------------
	clc	
   
   % Butterworthfilter (LP) av ordning 4, med gr�nsfrekvens 1 Hz:
Hb=butterw(4);

	% Butterworthfiltrets pol-nollst�llediagram:
pz(Hb)
	OHfig

	pause  % ----------------------------------------------------------------

	% J�mf�r amplitudspektra |H2(f)| och |Hb|:   
spect(H2,Hb,6)   
subplot(2,1,1), title('{\it |H2(f)|}  (det modifierade filtret)'), xlabel('')
subplot(2,1,2), title('{\it |Hb(f)|}  (Butterworthfiltret)')
	OHfig
   
	pause  % ----------------------------------------------------------------
	clc   
   
	% Filtertransformera Butterworthfiltret - LP med gr�nsfrekvens 5 Hz:
	% Erh�lles genom att flytta ut polerna till avst�ndet 2pi*5 fr�n origo!
Hlp5=lplp(Hb,5);

	% Filtertransformera Butterworthfiltret - HP med gr�nsfrekvens 3 Hz:
Hhp3=lphp(Hb,3);

spect(Hlp5,Hhp3,8)
	OHfig
   
	pause  % ----------------------------------------------------------------
 
	% Pol-nollst�llediagram HP-filtret med gr�nsfrekvens 3 Hz:
pz(Hhp3)
	OHfig
   
   pause  % ----------------------------------------------------------------
   
   % 3D-plot av det f�rsta Butterworthfiltrets amplitudkarakt�ristik
	% i ett omr�de i v�nstra halvplanet:
splane(Hb)
   
   pause  % ----------------------------------------------------------------
	clc
   
	% Justera polernas l�ge hos Butterworthfiltret
	% s� att h�gre branthet i �verg�ngsbandet erh�lls!
	% Flytta t.ex. polerna till -1,29 +/- 2,46j och -0,53 +/- 5,95j
	% Amplitudnormering skall fortfarande g�lla!
	% D� erh�lls ett Chebychevfilter av ordning 4.
   
	% Anv�nd Kretslabfunktionen pzchange !!
	% ---------------------------------------------------------
   
pzchange(Hb)



% ANM:   
% Om inte Kretslabfunktionen ilaptr (inverstransformering) fungerar
% (se text om begr�nsningar i Kretslabmanualen),
% s� kan man sj�lv g� �ver till fouriertransformen 
% f�r att sedan inversfouriertransformera:

global TRFM, figure(4), signal( ifoutr( output( TRFM, in('1','f') ))), OHfig

   
   
   