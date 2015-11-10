function K=ripple(rp,rs)
%RIPPLE Ber�kning av rippelforh�llande.
%
%    K = RIPPLE(rp,rs) - rp och rs �r reella tal.
%    
%    Beskrivning:
%    Ber�knar f�rh�llandet mellan rippel i pass- och sp�rrband f�r ett filter
%    med passbandsrippel rp [dB] och sp�rrbandsrippel rs [dB].
%    
%    See also:
%    FIROPT, FIRLEN
%    

global pm1 pm2 pm3 pm4 KlabL
K=(10^(rp/20)-1)*10^(rs/20);
