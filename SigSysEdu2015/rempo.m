function H=rempo(G,pole)
%REMPO Tar bort poler fr�n laplace- eller z-transformer.
%
%    Y = REMPO(X,[p1 p2...pn]) - X �r laplace- eller z-transform, 
%                              p1...pn �r komplexa tal.
%    
%    Beskrivning:
%    Polerna p1...pn tas bort fr�n X. F�r varje komplexv�rt p1...pn 
%    tas �ven motsvarande komplexkonjugerade pol bort automatiskt.
%    
%    See also:
%    IN, ADDZE, ADDPO, REMZE, PO, ZE, PZ, COEFF
%    

global pm1 pm2 pm3 pm4 KlabL
H=addze(G,pole);


