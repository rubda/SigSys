%CLEANUP Minneskompaktering.
%
%    
%    Beskrivning:
%    cleanup anv�nder Matlabkommandot pack f�r att kompaktera minnet, men 
%    h�ller dessutom reda p� de globala variabler som anv�nds av Kretslab.
%    
%    See also:
%    STARTUP
%    

QQQqqq=[KlabL pm1 pm2 pm3 pm4 FSMAX];
clear KlabL pm1 pm2 pm3 pm4 FSMAX
pack
global KlabL pm1 pm2 pm3 pm4 FSMAX
KlabL=QQQqqq(1);
pm1=QQQqqq(2);
pm2=QQQqqq(3);
pm3=QQQqqq(4);
pm4=QQQqqq(5);
FSMAX=QQQqqq(6);
clear QQQqqq
