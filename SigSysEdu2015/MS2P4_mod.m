function MS2P4_mod(x_str,h_str)
% MS2P4_mod(x_str, h_str) = modifierad MSP4.m, d�r man anger egen x(t) and h(t),
% l�mpligast s� att y(t) har hunnit g� till ca. 0 vid t=4 sek,
% samt att funktionen pausar efter varje steg. 
% 
% Stega dig fram genom att trycka p� valfri tangent!
% Lasse A. Nov 2013
%
%
% Ex 1: MS2P4_mod('1.5*sin(pi*t).*(t>=0&t<1)','1.5*(t>=0&t<1.5)-(t>=2&t<2.5)')
% Ex 2: MS2P4_mod('1.5*(t>=0&t<1.5)-(t>=2&t<2.5)','1.5*sin(pi*t).*(t>=0&t<1)')
% Ex 3: MS2P4_mod('1.5*sin(pi*t).*(t>=0&t<1)','1.5*(t+0.2>=0&t+0.2<1.5)-(t+0.2>=2&t+0.2<2.5)')
% Ex 4: MS2P4_mod('1.5*sin(pi*(t-0.5)).*(t-0.5>=0&t-0.5<1)','1.5*(t+0.2>=0&t+0.2<1.5)-(t+0.2>=2&t+0.2<2.5)')
%
% Ytterligare ett exempel att "leka" med:
% Ex 5:  MS2P4_mod('2*exp(-3*t).*(t>=0&t<1)','1.5*(t>=0.5&t<2.5)')

%
% MATLAB Session 2, Program 4
% Script M-file graphically demonstrates the convolution process.

figure(1) % Create figure window and make visible on screen
% x = inline('1.5*sin(pi*t).*(t>=0&t<1)');  
% h = inline('1.5*(t>=0&t<1.5)-(t>=2&t<2.5)');
x = inline(x_str);  
h = inline(h_str);


dtau = 0.005; tau = -1:dtau:4;
ti = 0; tvec = -.3:.1:4;
tvecDense = tvec(1):dtau:tvec(end);
y = NaN*zeros(1,length(tvec)); % Pre-allocate memory

for t = tvec,
    ti = ti+1; % Time index
    xh = x(t-tau).*h(tau); 
    lxh = length(xh);
    y(ti) = sum(xh.*dtau); % Trapezoidal approximation of convolution integral
    subplot(2,1,1),plot(tau,x(t-tau),'b--',tau,h(tau),'k-',t,0,'ok'); 
    axis([tau(1) tau(end) -2.0 3]); 
    patch([tau(1:end-1);tau(1:end-1);tau(2:end);tau(2:end)],...
        [zeros(1,lxh-1);xh(1:end-1);xh(2:end);zeros(1,lxh-1)],...
        [.8 .8 .8],'edgecolor','none'); 
    xlabel('\tau'); legend('x(t-\tau)','h(\tau)','t','x(t-\tau)h(\tau)',3);
    c = get(gca,'children'); set(gca,'children',[c(2);c(3);c(4);c(1)]);
    subplot(2,1,2),plot(tvecDense,x(tvecDense),'b--',tvec,y,'r',tvec(ti),y(ti),'ok'); 
    xlabel('t'); ylabel('y(t) = \int x(t-\tau)h(\tau) d\tau');
    legend('x(t)', 'y(t)', 't');
    axis([tau(1) tau(end) -1.0 2.0]); grid;
    ohfig
    pause
end


    
