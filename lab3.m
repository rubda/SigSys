% b)

load lab3_extra/uppgift5b.mat

pzchange(H1)
hold on;
pzchange(H2)

%% c)

load lab3_extra/uppgift5c.mat

pzchange(H3)

%% d)

% ????

%% e)

[B, A] = butter(10, 2 * pi * 100, 'low', 's');
pzchange(in(B, A, 's'))

%%
[D, C] = cheby1(5, 3, 2 * pi * 100, 'low', 's');
pzchange(in(D, C, 's'))

%% f)

load lab3_extra/uppgift5fb.mat

pzchange(H5)

%% e)

signal(toner);
pause;
signal(ifoutr(Y));