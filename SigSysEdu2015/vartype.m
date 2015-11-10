function vartype(x)
%VARTYPE Anger variabeltyp.
%
%    VARTYPE(x) - x �r godtycklig Kretslabvariabel.
%    
%    Beskrivning:
%    Funktionen vartype skriver i kommandof�nstret ut vilken typ av
%    kretslabvariabel x �r. Variabeltypen erh�lls fr�n funktionen 
%    vtype enligt f�ljande:
%    vtype(x) =  = 1  = > 'Tal eller annan Matlab-variabel'
%    vtype(x) =  = 2  = > 'Vektor'
%    vtype(x) =  = 3  = > 'Matris'
%    vtype(x) =  = 4  = > 'Tidskontinuerlig signal'
%    vtype(x) =  = 5  = > 'Fouriertransform av tidskontinuerlig signal'
%    vtype(x) =  = 6  = > 'Laplacetransform'
%    vtype(x) =  = 7  = > 'Fourierserie'
%    vtype(x) =  = 8  = > 'Tidsdiskret signal'
%    vtype(x) =  = 9  = > 'Fouriertransform av tidsdiskret signal'
%    vtype(x) =  = 10  = > 'z-transform'
%    vtype(x) =  = 11  = > 'DFT'
%    Annars  = > 'Annan Matlabvariabel'
%     
%    See also:
%    VTYPE
%    
%    ######################################################
%    
%    KRETSLABS VARIABELTYPER
%    -----------------------
%    
%    Nedan f�ljer en beskrivning av hur Kretslab lagrar signaler och 
%    transformer. Numret p� variabeltypen �r detsamma som returneras
%    av funktionen vtype.
%    
%    1. Tal
%    -------
%    Format (rader x kolumner): 1x1
%    Beskrivning: Alla tal, reella eller komplexa.
%    Kontrollsymboler: Inga.
%    
%    2. Vektor
%    ----------
%    Format (rader x kolumner): 1xn
%    Beskrivning: Alla radvektorer som inte tolkas som n�gon annan variabeltyp.
%    Kontrollsymboler: Inga.
%    
%    3. Matris
%    ----------
%    Format (rader x kolumner): nxm
%    Beskrivning: Alla matriser av godtycklig dimension som inte tolkas 
%                 som n�gon annan variabeltyp.
%    Kontrollsymboler: Inga.
%    
%    4. Tidskontinuerlig signal
%    ---------------------------
%    Format (rader x kolumner): lx(KlabL+1)
%    Beskrivning: Element #1-KlabL �r signalv�rden i tidsf�ljd. 
%                 Element #(KlabL/2)+1 motsvarar tidpunkten t = 0.
%    Kontrollsymboler: Element #KlabL+1 ger sampelperioden, dvs tidsavst�ndet 
%                      mellan varje v�rde.
%    
%    5. Fouriertransform av tidskontinuerlig signal
%    -----------------------------------------------
%    Format (rader x kolumner): 1x(KlabL+2)
%    Beskrivning: Element #1->KlabL �r transformens v�rden f�r frekvenser 
%                 mellan -fs/2 och fs/2, d�r fs �r sampelfrekvensen. 
%                 De f�rsta 512 elementen �r transformens v�rden f�r 
%                 positiva frekvenser och element #KlabL/2+1->KlabL �r v�rden 
%                 f�r negativa frekvenser. Element #1 motsvarar f = 0.
%    Kontrollsymboler: Element #KlabL+1 ger sampelfrekvensen.
%                      Element #KlabL+2 ger frekvensavst�ndet mellan varje v�rde.
%    
%    6. Laplacetransform
%    --------------------
%    Format (rader x kolumner): 2xn
%    Beskrivning: De f�rsta tre elementen i varje rad �r kontrollsymboler. 
%                 D�refter inneh�ller rad 1 nollst�llen och rad 2 poler. 
%                 Om antalen �r olika fylls den kortare raden ut med nollor 
%                 i slutet.
%    Kontrollsymboler: 
%      Element #(1,1) = 6 ger typnumret (f�r att skilja p� laplace- och z-transform).
%      Element #(1,2) ger antal nollst�llen.
%      Element #(1,3) ger koefficienten f�r t�ljarens h�gstagradsterm.
%      Element #(2,1) anv�nds inte.
%      Element #(2,2) ger antal poler.
%      Element #(2,3) ger koefficienten f�r n�mnarens h�gstagradsterm.
%    
%    7. Fourierserie
%    ----------------
%    Format (rader x kolumner): 1x515
%    Beskrivning: De f�rsta 512 elementen �r de komplexa fourierkoefficienterna. 
%                 Element #1-256 motsvarar c_0->c_255 och element #257-512 
%                 motsvarar c_(-256)->c_(-1).
%    Kontrollsymboler: Element #513 ger signalens grundfrekvens, dvs 1/T.
%                      Element #514 och #515 anv�nds inte.
%    
%    8. Tidsdiskret signal
%    ----------------------
%    Format (rader x kolumner): 1x(KlabL+4)
%    Beskrivning: Element #1-KlabL �r signalv�rden i nummerf�ljd. 
%                 Element #KlabL/2+1 motsvarar punkten n = 0.
%    Kontrollsymboler: Element #KlabL+1 -> KlabL+4 anv�nds inte.
%    
%    9. Fouriertransform av tidsdiskret signal
%    ------------------------------------------
%    Format (rader x kolumner): 1xKlabL
%    Beskrivning: Element #1-KlabL �r transformens v�rden for normerade 
%                 frekvenser mellan 0 och 1. Element #1 motsvarar theta = 0 
%                 och 1023 element #KlabL motsvarar theta = 1023/1024.
%    Kontrollsymboler: Inga.
%    
%    10. z-transform
%    ----------------
%    Format (rader x kolumner): 2xn
%    Beskrivning: De f�rsta tre elementen i varje rad �r kontrollsymboler. 
%                 D�refter inneh�ller rad 1 nollst�llen och rad 2 poler. 
%                 Om antalen �r olika fylls den kortare raden ut med nollor i slutet.
%    Kontrollsymboler: 
%      Element #(1,1)  =  10 ger typnumret (f�r att skilja p� laplace- och z-transform).
%      Element #(1,2) ger antal nollst�llen.
%      Element #(1,3) ger koefficienten for t�ljarens h�gstagradsterm.
%      Element #(2,1) anv�nds inte.
%      Element #(2,2) ger antal poler.
%      Element #(2,3) ger koefficienten for n�mnarens h�gstagradsterm.
%    
%    11. DFT
%    --------
%    Format (rader x kolumner): 1x129
%    Beskrivning: Element #1-L �r DFT:ns v�rden f�r k mellan 0 och L-1,
%    	         d�r L �r DFT:ns l�ngd. Om DFT:n �r kortare �n 128 punkter 
%    	         fylls vektorn ut med nollor.
%    Kontrollsymboler: Element #129 ger DFT:ns l�ngd L.
%    

global pm1 pm2 pm3 pm4 KlabL
if vtype(x)==1,
 disp('Tal eller annan Matlab-variabel')
elseif vtype(x)==2,
 disp('Vektor')
elseif vtype(x)==3,
 disp('Matris')
elseif vtype(x)==4,
 disp('Tidskontinuerlig signal')
elseif vtype(x)==5,
 disp('Fouriertransform av tidskontinuerlig signal')
elseif vtype(x)==6,
 disp('Laplacetransform')
elseif vtype(x)==7,
 disp('Fourierserie')
elseif vtype(x)==8,
 disp('Tidsdiskret signal')
elseif vtype(x)==9,
 disp('Fouriertransform av tidsdiskret signal')
elseif vtype(x)==10,
 disp('z-transform')
elseif vtype(x)==11,
 disp('DFT')
else
 disp('Annan Matlabvariabel')
end
