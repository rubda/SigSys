function y=swap(x)
% swap
% y=swap(x) byter plats p� den f�rsta och den andra halvan i 
% signalvektorn x (anv�nds internt av Kretslab):
% y=x;
% y(1:KlabL)=[x((KlabL/2+1):KlabL) x(1:KlabL/2)];

global pm1 pm2 pm3 pm4 KlabL
y=x;
y(1:KlabL)=[x((KlabL/2+1):KlabL) x(1:KlabL/2)];
