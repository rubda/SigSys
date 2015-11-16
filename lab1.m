% Uppgift 2

% Punkt 1. 
MS2P4_mod('1.5*sin(pi*t).*(t>=0&t<1)','1.5*(t>=0&t<1.5)-(t>=2&t<2.5)') % Ex 1
%MS2P4_mod('1.5*(t>=0&t<1.5)-(t>=2&t<2.5)','1.5*sin(pi*t).*(t>=0&t<1)') % Ex 2

%% Punkt 2. 
MS2P4_mod('1.5*sin(pi*t).*(t>=0&t<1)','1.5*(t+0.2>=0&t+0.2<1.5)-(t+0.2>=2&t+0.2<2.5)')

%% Punkt 3.
MS2P4_mod('1.5*sin(pi*(t-0.5)).*(t-0.5>=0&t-0.5<1)','1.5*(t+0.2>=0&t+0.2<1.5)-(t+0.2>=2&t+0.2<2.5)')


%% Uppgift 3

% a)
t_0 = 8;
sig = fouser('pulse(t,0,1) + pulse(t,7,8)', t_0);
sig_effect = pwr(sig);
allowed_effect = 0.94 * sig_effect;
fprintf('\n94%% av signaleffekten: %f\n\n', allowed_effect)

for i=1:10
    tone_effect = pwr(remtone(sig, 'all', i));
    fprintf('Delton: %d - %f\n', i-1, tone_effect/sig_effect)
end

% Redovisa en graf med filtrets utsignal. OKEJ. 
signal(remtone(sig, 'all', 10))
pause;
spect(sig, remtone(sig, 'all', 8))

%% b)

sig = fouser('pulse(t,0,1) + pulse(t,7,8)', t_0);
for i=(2:500)
     signal(remtone(sig, 'all', i), remtone(sig, 'hp', i));
     pause;
end
