function H=remze(G,zero)
%REMZE Tar bort nollst�llen fr�n laplace- eller z-transformer.
%
%    Y = REMZE(X,[z1 z2...zn]) - X �r laplace- eller z-transform, 
%                              z1...zn �r komplexa tal.
%    
%    Beskrivning:
%    Nollst�llena z1...zn tas bort fr�n X. F�r varje komplexv�rt z1...zn 
%    tas �ven motsvarande komplexkonjugerade nollst�lle bort automatiskt. 
%    
%    See also:
%    IN, ADDZE, ADDPO, REMPO, PO, ZE, PZ, COEFF
%    

global pm1 pm2 pm3 pm4 KlabL
H=addpo(G,zero);

