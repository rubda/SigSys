function logspect(X,Y,fmax)
%LOGSPECT Plottning av amplitudspektra i dB-skala.
%
%    LOGSPECT(X)        - X �r fourier-, laplace- eller z-transform.
%    LOGSPECT(X,Y)      - X och Y �r fourier-, laplace- eller z-transformer.
%    LOGSPECT(X,fmax)   - X �r fourier-, laplace- eller z-transform, 
%                         fmax �r ett reellt tal.
%    LOGSPECT(X,Y,fmax) - X och Y �r fourier-, laplace- eller z-transformer,
%                         fmax �r ett reellt tal.
%    LOGSPECT(X)        - X �r en DFT.
%    LOGSPECT(X,kmax)   - X �r en DFT, kmax �r ett reellt heltal.
%    
%    Beskrivning:
%    Plottar amplitudspektrum f�r en eller tv� transformer i dB-skala,
%    �vre frekvensgr�nsen i utritat frekvensomr�de best�ms antingen automatiskt
%    eller anges med fmax/kmax. 
%    Funktionen ber�knar ocks� (3 dB-)gr�nsfrekvenser.
%    
%    Example:
%    H = butterw(3);
%    logspect(H,4)
%    
%    See also:
%    SPECT, PWRSPECT, LOGSPECTMOD
%    

global pm1 pm2 pm3 pm4 KlabL
if length(find(vtype(X)==[5 6 9 10 11]))>0,
 clf
 subplot(2,1,1)
 if nargin==1,
  splplot(X,2)
 elseif vtype(Y)==1 & nargin==2
  splplot(X,2,Y)
 elseif length(find(vtype(Y)==[5 6 9 10 11]))>0 &  nargin==2,
  if length(find([5 6]==vtype(X)))>0 & length(find([5 6]==vtype(Y)))>0,
   fmax=min(bandwi(X),bandwi(Y));
   if fmax==inf, fmax=200; end
   splplot(X,1,fmax)
   subplot(2,1,2)
   splplot(Y,1,fmax)
  else
   splplot(X,1)
   subplot(2,1,2)
   splplot(Y,1)
  end
 elseif length(find(vtype(Y)==[5 6 9 10 11]))>0 & nargin==3
  splplot(X,1,fmax)
  subplot(2,1,2)
  splplot(Y,1,fmax)
 else
  error('Input incorrect: not transform')
 end

 % Till�gg f�r att l�gga till 'edit-boxar' f�r �ndring av
 % utskriftsintervall Lasse A aug. 2004
 subplot(2,1,1)
 ax1_hand=gca;
 ax1=axis;
 subplot(2,1,2)
 ax2_hand=gca;
 fmin_hand=uicontrol('Style','edit','Units','normalized','Position',[0.12 .5 0.05 0.04],...
      'String',num2str(ax1(1)), 'CallBack','faxchange(0)', ...
      'foreground','black','background',0.7*[1 1 1],'horizontal','left');
 fmax_hand=uicontrol('Style','edit','Units','normalized','Position',[0.88 .5 0.05 0.04],...
      'String',num2str(ax1(2)),'CallBack','faxchange(1)', ...
      'foreground','black','background',0.7*[1 1 1],'horizontal','left');
 
 set(gcf,'UserData',[ax1_hand ax2_hand fmin_hand fmax_hand]);
 
else
 error('Input incorrect: not transform')
end
