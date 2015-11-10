% KRETSLAB - SAMMANFATTANDE FUNKTIONSBESKRIVNING
% -----------------------------------------------
% 
% Nedanst�ende funktioner �r i de flesta fall Kretslabfunktioner,
% men kan i en del fall vara normala Matlabfunktioner (speciellt 
% funktionerna under rubriken "Element�ra matematiska funktioner").
%
% Skriv "helpwin funktionsnamn" f�r att erh�lla hj�lptexten till 
% funktionen  "funktionsnamn" i Matlabs hj�lpnavigerare!
% Motsvarande hj�lptext erh�lls i kommandof�nstret om du i st�llet
% skriver "help funktionsnamn".
% 
% Skriv "which funktionsnamn" om du vill veta vilken funktion 
% Matlab anv�nder sig av om/n�r du anropar "funktionsnamn".
% 
% Allm�nna funktioner
% -------------------
% kretslab        - Visar denna hj�lptext f�r Kretslab i Matlabs hj�lpnavigerare!
% startup         - Initierar Kretslab. Anropas n�r Matlab startar.
% help            - help fknsnamn returnerar hj�lptext fill funktionen fknsnamn.
% helpwin         - Startar ett mer sofistikerat hj�lpf�nster med s�kfunktion.
%                   Skriv t.ex. "helpwin kretslab" !!!!!
% who             - (alt. whos) listar vilka variabler som �r definierade.
% clear           - clear x tar bort variabeln x.
% cleanup         - Kompakterar minnet. OBS: anv�nd inte pack
% vartype         - vartype(x) anger vilken typ av variabel x �r. 
% vtype           - vtype(x) ger typkoden f�r variabeln x.
% save            - save fil x sparar variabeln x p� filen fil.mat 
% load            - load fil h�mtar variabler fr�n filen fil.mat 
% shg             - Visar grafiska f�nstret.
% quit            - Avslutar Matlab.
% editpath        - Anv�nds f�r att definiera och �ndra Matlabs s�kv�g.
% ;               - Skrivs efter funktionsanrop, f�r att f�rhindra resultatutskrift.
% <ctrl>+<c>      - Avbryter p�g�ende kommando eller utskrift.
% 
% 
% Element�ra matematiska funktioner
% ----------------------------------
% Konstanter:
% j               - Kvadratroten ur -1
% pi              - pi
% 
% Funktioner:
% ^               - Exponentiering. Ex: 2^5 = 32 
% sqrt            - Kvadratroten
% sin             - sinus
% cos             - cosinus
% tan             - tangens
% asin            - arcussinus
% acos            - arcuscosinus
% atan            - arcustangens
% sinh            - sinus hyperbolicus
% cosh            - cosinus hyperbolicus
% tanh            - tangenshyperbolicus
% exp             - e^t; basen e till den naturliga logaritmen
% log             - den naturliga logaritmen; ln(t)
% log10           - 10-logaritmen
% sinc            - sinc-functionen; sinc(t) = sin(pi*t)/(pi*t)
% us              - Heavisidefunktionen u(t)
% pulse           - pulse(t,t1,t2) = u(t-t1)-u(t-t2) 
%                   (kan naturligtvis �ven matas in som us(t-t1)-us(t-t2) )
% pulse2          - Specialgenerering av pulsfunktionen u(t-t1)-u(t-t2)
% ramp            - Rampfunktionen ramp(t,t1,t2)=((t-t1)/(t2-t1))*(u(t-t1)-u(t-t2))
% dimp            - Specialgenerering av dirac-impuls
% sign            - sign(t) = signum av t (= -1, 0 eller 1).
% abs             - Absolutbelopp; abs(t) = |t|
% angle           - Argumentet, dvs. fasvinkeln arg{t}
% real            - Realdelen Re{t}
% imag            - Imagin�rdelen Im{t}
% conj            - Komplexkonjugatet t*
% max             - max(a,b) motsvarar max{a,b}
% min             - min(a,b) motsvarar min{a,b}
% round           - Avrundning till n�rmaste heltal.
% floor           - Avrundning till n�rmaste l�gre heltal.
% ceil            - Avrundning till n�rmaste h�gre heltal.
% 
% 
% Ritfunktioner
% --------------
% signal         - Ritar signaler.
%                  OBS! Om du klickar p� 'signal' h�r till v�nster, kommer
%                  funktionens hj�lptext att i hj�lpnavigatorn skrivas ut 
%                  l�ngst ned p� den erh�llna sidan!
% signalmod      - Variant av signal. Anv�nds f�r egendefinierade utskrifter.
% spect          - Ritar frekvensspektrum/-karakt�ristik.
% spectmod       - Variant av spect. Anv�nds f�r egendefinierade utskrifter.
% logspect       - Ritar frekvensspektrum/-karakt�ristik i logaritmisk skala.
% logspectmod    - Variant av logspect. Anv�nds f�r egendefinierade utskrifter.
% pwrspect       - Ritar energispektrum.
% pz             - Ritar pol-nollst�llediagram.
% pzmod          - Variant av pz. Anv�nds f�r egendefinierade utskrifter.
% splane         - Ritar beloppet av en laplacetransform i s-planet.
% zplane         - Ritar beloppet av en z-transform i z-planet.
% pzchange       - Ritar pol-nollst�llediagram och frekvensspektrum/-karakt�ristik
%                - samt m�jligg�r interaktiv justering av poler och nollst�llen.
% ohfig          - �kar textstorlek och linjetjocklek i senast ritade f�nster
%                  (ger tydligare figurer vid utskrift m.m.)
% 
% 
% Inmatning
% ----------
% in             - Definierar signaler eller transformer.
% sample         - Samplar signaler.
% fouser         - Definierar fourierserier.
% fir            - Definierar FIR-filter.
% pzchange       - Interaktiv inmatning av poler och nollst�llen till laplace-
%                  och z-transform. Ritar samtidigt pol-nollst�llediagram och 
%                  frekvensspektrum/-karakt�ristik.
% 
% Signaler
% ---------
% add            - Adderar signaler.
% mult           - Multiplicerar signaler.
% deriv          - Deriverar signaler.
% integr         - Integrerar signaler.
% pam            - Pulsamplitudmodulerar tidsdiskreta signaler.
% delay          - F�rdr�jer (skiftar) signaler.
% window         - F�nstrar signaler.
% part           - Tar ut delar av signaler.
% pwr            - Ber�knar energin (alt. signalmedeleffekt) hos signaler.
% noise          - Adderar brus till signaler.
% output         - Faltar signaler/funktioner.
% ampl           - F�rst�rker signaler.
% value          - Ger amplitud vid viss tidpunkt.
% lp             - Ideal l�gpassfiltrering av signal.
% hp             - Ideal h�gpassfiltrering av signal.
% bp             - Ideal bandpassfiltrering av signal.
% bs             - Ideal bandsp�rrfiltrering av signal.
% 
% 
% Fourierserier
% --------------
% output         - Filtrerar signaler.
% addtone        - Adderar deltoner.
% remtone        - Tar bort deltoner.
% thd            - Ber�knar klirrfaktor (distorsion), signalmedeleffekt, 
%                  RMS-v�rde och likriktat medelv�rde.
% value          - Ger amplitud och fas f�r deltoner.
% 
% 
% Transformer
% ------------
% foutr          - Fouriertransformerar signaler.
% ifoutr         - Inverstransformerar fouriertransformer.
% ilaptr         - Inverstransformerar laplacetransformer.
% iztr           - Inverstransformerar z-transformer.
% dft8           - 8 punkters DFT.
% dft16          - 16 punkters DFT.
% dft32          - 32 punkters DFT.
% dft64          - 64 punkters DFT.
% dft128         - 128 punkters DFT.
% value          - Ger amplitud och fas i viss frekvens.
% output         - Filtrerar i frekvensplanet.
% trfcn          - Ber�knar frekvensfunktioner (transfer function).
% addpo          - Adderar poler.
% addze          - Adderar nollst�llen.
% rempo          - Tar bort poler.
% remze          - Tar bort nollst�llen.
% po             - Ger polplacering.
% ze             - Ger nollst�lleplacering.
% coeff          - Ger t�ljar- och n�mnarpolynomskoefficienterna.
% normal         - Amplitudnormerar filter.
% ampl           - Multiplicerar med konstant.
% feedb          - �terkopplar system.
% pzchange       - Se under rubrikerna Ritfunktioner och Inmatning
% 
% 
% Filterdesign
% -------------
% lplp           - LP->LP-transformation.
% lphp           - LP->HP-transformation.
% butterw        - Ber�knar butterworthfilter.
% firwin         - Ber�knar FIR-filter med f�nstermetoden.
% firopt         - Ber�knar FIR-filter med Remez algoritm.
% firlen         - Ger en uppskattning av l�ngden p� ett optimalt 
%                  FIR-filter enligt Remez algoritm.
% ripple         - Ber�knar designkonstant f�r Remez algoritm.
% firztr         - Ber�knar systemfunktioner f�r FIR-filter.
% bilintr        - Bilinj�r transformation.
% pzchange       - Se under rubrikerna Ritfunktioner och Inmatning
% 
% 
% �vrigt
% -------
% dd1            - Demonstration av Kretslabfunktioner f�r tidskontinuerliga
%                  signaler och system. Tryck p� valfri tangent f�r att stega  
%                  dig igenom demonstrationsfilen! 
%                  K�R DD1 F�R ATT SE HUR KRETSLAB ANV�NDS!!
% dd2            - Demonstration av Kretslabfunktioner f�r tidsdiskreta
%                  signaler och system. Tryck p� valfri tangent f�r att stega  
%                  dig igenom demonstrationsfilen!
%                  K�R DD2 F�R ATT SE HUR KRETSLAB ANV�NDS!!
% kretsdemo1     - Demonstrationsverktyg f�r den tidskontinuerliga kursdelen.
%                  N�gra av demo-filerna fungerar dock bara tillsammans med andra
%                  Matlabfunktioner (som examinatorn har).
% kretsdemo2     - Demonstrationsverktyg f�r den tidsdiskreta kursdelen.
% vikex          - Demonstration av vikningseffekter vid sampling.
%            
% ------------------------------------------------------------------------
%
% OBS!!  Om du fick ovanst�ende text presenterad i kommandof�nstret,
% rekommenderas du att i st�llet l�sa hj�ltexten i Matlabs hj�lpnavigerare!
% Skriv d� "kretslab", s� startas den!
%
% ------------------------------------------------------------------------
%