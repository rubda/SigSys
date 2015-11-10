function h=firwin(N,F0,wd)
%FIRWIN Ber�kning av kausalt FIR-filter av LP-typ med f�nstermetoden.
%
%    h = FIRWIN(L,theta_c,typ) - L �r reellt heltal, theta_c �r reellt tal och
%                              typ �r en text.
%    
%    Beskrivning:
%    Ber�knar impulssvaret f�r ett FIR-filter av l�ngd L genom att utg� fr�n 
%    ett idealt LP-filter med normerad gr�nsfrekvens theta_c och sedan f�nstra 
%    detta. F�nstertypen anges med textstr�ngen typ, vilken skall omges av 
%    apostrofer. Tillg�ngliga f�nstertyper finns i beskrivningen av kommandot 
%    window. F�nstringen sker symmetriskt runt n = (L-1)/2.
%    
%    Example:
%    h = firwin(21,0.2,'hann');
%    
%    See also:
%    WINDOW
%    

global pm1 pm2 pm3 pm4 KlabL
if N>KlabL/2, N=KlabL/2; end
n=floor(N/2);
n=-n:n;
if length(n)~=N,
 n(1)=[];
 n=n-.5;
end
h=fir(sinc(2*F0*n)*2*F0);
if nargin==3, h=window(h,wd,N); end
