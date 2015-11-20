% a)

p = in('us(t)-us(t-5)', 't');
fp = foutr(p);
signal(p)
pause;
spect(fp, 2)

%% b)

s1 = in('sin(2*pi*200*t)*pulse(t,0,1/5)', 't');
s2 = in('sin(2*pi*200*t)*pulse(t,0,1/40)', 't');

fs1 = foutr(s1);
fs2 = foutr(s2);

signal(s2);
ohfig;
pause;
spect(fs1, fs2, 400);
subplot(2,1,1), set(gca,'xlim',[175,225])

%% c)

signal(toner);
pause;

T = foutr(toner);
spect(T);

%% d)

spect(foutr(ton));
subplot(2,1,1), set(gca,'xlim',[800,1500])

