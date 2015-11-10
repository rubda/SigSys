function y=delay(x,n)
%DELAY F�rdr�jning av signaler.
%
%    y = DELAY(x,t0) - x �r signal, t0 �r reellt tal.
%    y = DELAY(x,n0) - x �r tidsdiskret signal, n0 �r reellt heltal.
%    
%    Beskrivning:
%    Returnerar x(t-t0) respektive x[n-n0].
%    Notera att t0 och n0 �ven kan vara negativa. D� erh�lls en
%    "v�nsterskiftad" signal.
%    
%    Observera:
%    Kommandot g�r egentligen ett cykliskt skift av den samplade 
%    signalvektorn x, varf�r den del av signalen som "f�rsvinner
%    ut till h�ger" dyker upp igen till v�nster. 
%    Detta g�rs f�r att f� r�tt resultat i frekvensdom�nen.
%    

global pm1 pm2 pm3 pm4 KlabL
if vtype(x)==4,
 n=round(n/x(KlabL+1));
 if n<0, n=n+KlabL; end
 y=[x(KlabL-n+1:KlabL) x(1:KlabL-n) x(KlabL+1)];
elseif vtype(x)==8,
 if n<0, n=n+KlabL; end
 y=[x(KlabL-n+1:KlabL) x(1:KlabL-n) x(KlabL+1:KlabL+4)];
else
 error('Input incorrect: not signal');
end

