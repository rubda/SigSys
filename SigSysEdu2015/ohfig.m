function ohfig(parent)
%OHFIG G�r text st�rre och linjer bredare i figur
%   OHFIG(f) �ndrar (i figur #f) fontstorleken p� 
%   alla figurtexter, vertikala positioner f�r x-, y- och z-label, 
%   och tjocklek p� linjer.
%   Det kan finnas flera ''axes'' per figur.
%   nargin=0 => f=aktuell figur
%
% Vill du ha en annan linjetjocklek eller fonttorlek?
% Editera d� ohfig.m och justera v�rdet p� lw resp. FONTSTL

% Lasse Alfredsson, September 1997

if nargin==0, parent=gcf; end

lw=2;
FONTSTL = 18;

child=get(parent,'Children');
if isempty(child)		
	if strcmp(get(parent,'type'),'line')		% type==line
		set(parent,'linewidth',lw)
	elseif strcmp(get(parent,'type'),'text')	% type==text
		set(parent,'Fontsize',FONTSTL)
	elseif strcmp(get(parent,'type'),'axes')	% empty axes
		set(parent,'Fontsize',FONTSTL)	
	end
else
	if strcmp(get(parent,'type'),'axes')		% type==axes
		set(parent,'FontSize',FONTSTL)
		set(get(parent,'XLabel'),'FontSize',FONTSTL)
		set(get(parent,'YLabel'),'FontSize',FONTSTL)
		set(get(parent,'ZLabel'),'FontSize',FONTSTL)
		set(get(parent,'Title'),'FontSize',FONTSTL)
	end
	for a=1:length(child)
		ohfig(child(a))
	end
end



