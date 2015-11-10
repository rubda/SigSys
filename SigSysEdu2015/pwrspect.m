function pwrspect(X,Y,fmax)
%PWRSPECT Plottning av energispektra.
%
%    PWRSPECT(X)        - X �r fouriertransform.
%    PWRSPECT(X,Y)      - X och Y �r fouriertransformer.
%    PWRSPECT(X,fmax)   - X �r fouriertransform, fmax �r reellt tal.
%    PWRSPECT(X,Y,fmax) - X och Y �r fouriertransformer, fmax �r reellt tal.
%    
%    Beskrivning:
%    Plottar energispektrum f�r en eller tv� fouriertransformer. 
%    fmax kan anv�ndas f�r att �ndra frekvensomr�det.
%    
%    Example:
%    X = in('1/(1+j*w)','w');
%    pwrspect(X)
%    pause
%    pwrspect(X,2)
%    
%    See also:
%    SPECT, LOGSPECT
%    

global pm1 pm2 pm3 pm4 KlabL
vx=vtype(X);
if nargin >1, vy=vtype(Y); end
if vx==5 | vx==9,  
 clf
 if nargin==1,
  pwrplot(X)
 elseif vy==1 & nargin==2,
  pwrplot(X,Y)
 elseif nargin==2 & (vy==5 | vy==9)
  if vx==5 & vy==5,
   bx=bandwi(X);
   by=bandwi(Y);
   fmax=min(bx,by);
   if fmax==inf, fmax=200; end
   subplot(2,1,1)
   pwrplot(X,fmax)
   subplot(2,1,2)
   pwrplot(Y,fmax)
  else
   subplot(2,1,1)
   pwrplot(X)
   subplot(2,1,2)
   pwrplot(Y)
  end
 elseif nargin==3 & (vy==5 | vy==9),
  subplot(2,1,1)
  pwrplot(X,fmax)
  subplot(2,1,2)
  pwrplot(Y,fmax)
 else
  error('Input incorrect: not Fourier transform')
 end
else
 error('Input incorrect: not Fourier transform')
end


