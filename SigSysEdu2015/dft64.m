function U=dft64(u,type,n0)
%DFT64 64 punkters DFT.
%
%    X = DFT64(x,typ) - x �r tidsdiskret signal, typ �r text.
%    X = DFT64(x,typ,n0) - x �r tidsdiskret signal, typ �r text, 
%                        n0 �r reellt heltal.
%    
%    Beskrivning:
%    F�nstrar signalen x och ber�knar en 64 punkters DFT av den f�nstrade 
%    signalen. F�nstertypen anges med textstr�ngen typ, vilken skall omges 
%    av apostrofer. Tillg�ngliga f�nstertyper finns angivna i hj�lptexten f�r 
%    kretslabfunktionen window. 
%    F�nstringen b�rjar i n = n0. Om n0 utel�mnas s�tts den till 0.
%    
%    Example:
%    x = sample('sin(2*pi*t)',5);
%    X = dft64(x,'hann',10);
%    
%    See also:
%    WINDOW, DFT8, DFT16, DFT32, DFT128
%    

global pm1 pm2 pm3 pm4 KlabL
if vtype(u)~=8, error('Input incorrect: not signal'); end
if nargin<3, n0=0; end
if n0<-KlabL/2 | n0+64>KlabL/2, error('Input incorrect'); end
u=window(u,type,64,n0);
U=[fft(u(KlabL/2+1+n0:KlabL/2+64+n0)) zeros(1,64) 64];
