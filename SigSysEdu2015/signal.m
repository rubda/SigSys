function signal(x,y,tmax);
%SIGNAL Plottning av signaler.
%
%    SIGNAL(x)        - x �r signal.
%    SIGNAL(x,y)      - x och y �r signaler.
%    SIGNAL(x,max)    - x �r signal, max �r reellt tal.
%    SIGNAL(x,y,max)  - x och y �r signaler, max �r reellt tal.
%    SIGNAL(D)        - C �r fourierserie.
%    SIGNAL(D1,D2)    - C och D �r fourierserier.
%    SIGNAL(D,p)      - plottar p perioder av D
%    SIGNAL(D1,D2,p)  - plottar p perioder av D1 och D2
%    
%    Beskrivning:
%    Plottar en eller tv� signaler eller en eller tv� fourierserier som 
%    signaler. max och p kan anv�ndas f�r att �ndra intervallet p� tidsaxeln.
%    
%    Example:
%    x = in('exp(-t)*sin(2*pi*t)*us(t)','t');
%    signal(x)
%    
%    See also:
%    SIGNALMOD, SPECT
%    

global pm1 pm2 pm3 pm4 KlabL
vx=vtype(x);
if nargin>1, vy=vtype(y); end
if vx==4 | vx==7 | vx==8,
 clf
 if nargin==1,
  siplot(x)
 elseif nargin==2,
  if vx==4 & vy==4,
   % tmax=512*min(x(KlabL+1),y(KlabL+1));  Lars-Eriks tmax
   subplot(2,1,1)
   % siplot(x,tmax)
   siplot(x)
   subplot(2,1,2)
   % siplot(y,tmax)
   siplot(y)
  elseif vy==4 | vy==7 | vy==8,
   subplot(2,1,1)
   siplot(x)
   subplot(2,1,2)
   siplot(y)
  elseif vy==1,
   siplot(x,y)
  else
   error('Input incorrect: not signal')
  end
 elseif vy==4 | vy==7 | vy==8,
  subplot(2,1,1)
  siplot(x,tmax)
   subplot(2,1,2)
  siplot(y,tmax)
 else
  error('Input incorrect: not signal')
 end
else
 error('Input incorrect: not signal')
end
