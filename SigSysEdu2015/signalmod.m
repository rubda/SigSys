function signalmod(x,tmax);
% SIGNALMOD Ritar signaler
%     signalmod(x), signalmod(x,tmax) fungerar som signal, men utan att 
%     f�rst sl�cka figurf�nstret (clf) och med bara en signal att plotta.
%
%     Example:
%     x=in('pulse(t,-1,5)','t');
%     subplot(2,1,1)
%     signalmod(x)
%     subplot(2,2,3)
%     signalmod(x)
%     subplot(2,2,4)
%     signalmod(x)
%
%
%     See also signal


if nargin==1,
  siplot(x)
else
  siplot(x,tmax)
end
% xlabel('Tid  (t sek)')  % Tag bort, eftersom signalmod �ven kan anv�ndas f�r x[n]
ohfig;
