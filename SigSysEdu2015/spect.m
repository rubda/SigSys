function spect(X,Y,fmax)
%SPECT Plottning av frekvensspektrum/-karakt�ristik.
%
%    SPECT(X)        - X �r fourier-, laplace- eller z-transform eller DFT.
%    SPECT(X,Y)      - X och Y �r fourier-, laplace- eller z-transformer
%                      eller DFT:er.
%    SPECT(X,fmax)   - X �r fourier-, laplace- eller z-transform, 
%                      fmax �r reellt tal.
%    SPECT(X,Y,fmax) - X och Y �r fourier-, laplace- eller z-transformer, 
%                      fmax �r reellt tal.
%    SPECT(D)          - D �r fourierserie.
%    SPECT(D1,D2)      - D1 och D2 �r fourierserier.
%    SPECT(D,nmax)     - D �r fourierserie, nmax �r positivt heltal.
%    SPECT(C1,D1,nmax) - D1 och D2 �r fourierserier, nmax �r positivt heltal.
%    
%    Beskrivning:
%    Plottar amplitud- och fasspektrum f�r en transform eller amplitudspektra 
%    f�r tv� transformer. F�r laplace- och z-transformer ber�knas v�rdena p� 
%    imagin�ra axeln resp. p� enhetscirkeln. fmax kan anv�ndas f�r att �ndra 
%    frekvensomr�det. 
%    Om X eller Y �r frekvensfunktion eller systemfunktion �r det motsvarande
%    amplitud- och faskarakt�ristik som plottas.
%    Funktionen plottar �ven amplitud- och fasspektrum for fourierserier
%    och DFT:er. Spektrum kan, f�r fourierserier, ritas upp till delton nmax.
%    
%    Example:
%    X = in('1/(1+j*w)','w');
%    spect(X)
%    
%    H = butterw(3);
%    SPECT(H,5)
%    
%    See also:
%    PWRSPECT, LOGSPECT, SIGNAL, SPECTMOD
%    

global pm1 pm2 pm3 pm4 KlabL FSMAX
if length(find(vtype(X)==[5 6 7 9 10 11]))>0,
 clf
 subplot(2,1,1)
 if nargin==1,
  spplot(X,2)
 elseif vtype(Y)==1 & nargin==2
  spplot(X,2,Y)
 elseif length(find(vtype(Y)==[5 6 7 9 10 11]))>0 &  nargin==2,
  if length(find([5 6]==vtype(X)))>0 & length(find(vtype(Y)==[5 6]))>0,
   fmax=min(bandwi(X),bandwi(Y));
   if fmax==inf, fmax=FSMAX/2; end  % OBS fmax=200 innan �ndring augusti 2004!!
   spplot(X,1,fmax)
   subplot(2,1,2)
   spplot(Y,1,fmax)
  else
   spplot(X,1)
   subplot(2,1,2)
   spplot(Y,1)
  end
 elseif length(find(vtype(Y)==[5 6 7 9 10 11]))>0 & nargin==3
  spplot(X,1,fmax)
   subplot(2,1,2)
  spplot(Y,1,fmax)
 else
  error('Input incorrect: not transform')
 end
 
 % Till�gg f�r att l�gga till 'edit-boxar' f�r �ndring av
 % utskriftsintervall,  Lasse A aug. 2004
%  subplot(2,1,1)
%  ax1_hand=gca;
%  ax1=axis;
%  subplot(2,1,2)
%  ax2_hand=gca;
%  fmin_hand=uicontrol('Style','edit','Units','normalized','Position',[0.12 .5 0.05 0.04],...
%       'String',num2str(ax1(1)), 'CallBack','faxchange(0)', ...
%       'foreground','black','background',0.7*[1 1 1],'horizontal','left');
%  fmax_hand=uicontrol('Style','edit','Units','normalized','Position',[0.88 .5 0.05 0.04],...
%       'String',num2str(ax1(2)),'CallBack','faxchange(1)', ...
%       'foreground','black','background',0.7*[1 1 1],'horizontal','left');
%  
%  set(gcf,'UserData',[ax1_hand ax2_hand fmin_hand fmax_hand]);
else
 error('Input incorrect: not transform')
end
