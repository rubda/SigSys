function h=firopt(N,F1,F2,K)
%FIROPT Optimering av FIR-filter med Remez algoritm.
%
%    h = FIROPT(L,theta_p,theta_s) - L �r reellt heltal,
%                                  theta_p och theta_s �r reella tal.
%    h = FIROPT(L,theta_p,theta_s,K) - L �r reellt heltal, 
%                                    theta_p, theta_s och K �r reella tal.
%    
%    Beskrivning:
%    Ber�knar impulssvaret f�r ett optimalt kausalt FIR-filter av LP-typ med 
%    l�ngd L, passbandsgr�ns theta_p, sp�rrbandsgr�ns theta_s och f�rh�llande 
%    K mellan rippel i pass- och sp�rrband. 
%    Om K ej anges s�tts denna till 1, vilket man bland annat erh�ller f�r
%    ripple(1,18.3) och ripple(3,7.7).
%    
%    
%    Example:
%    Tag fram impulssvaret f�r ett optimalt FIR-filter av LP-typ med passbands-
%    gr�ns theta_p = 0.1, sp�rrbandsgr�ns theta_s = 0.2, 1 dB rippel i passbandet 
%    och minst 60 dB d�mpning i sp�rrbandet:
%    K = ripple(1,60);
%    L = firlen(0.1,0.2,l,K);
%    h = firopt(L,0.1,0.2,K);
%    
%    See also:
%    FIRLEN, RIPPLE
%    

global pm1 pm2 pm3 pm4 KlabL
if nargin<4, K=1; end
if N>KlabL, N=KlabL; end
h=fir(remez(N-1,[0 2*F1 2*F2 1],[1 1 0 0],[1 K]));
