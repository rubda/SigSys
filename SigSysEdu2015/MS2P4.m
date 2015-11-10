% MS2P4.m : MATLAB Session 2, Program 4
% Script M-file graphically demonstrates the convolution process.

figure(1) % Create figure window and make visible on screen
x = inline('1.5*sin(pi*t).*(t>=0&t<1)');  
h = inline('1.5*(t>=0&t<1.5)-(t>=2&t<2.5)'); 

dtau = 0.005; tau = -1:dtau:4;
ti = 0; tvec = -.25:.03:3.75;
tvecDense = tvec(1):dtau:tvec(end);  % Lasses tillägg
y = NaN*zeros(1,length(tvec)); % Pre-allocate memory

for t = tvec,
    ti = ti+1; % Time index
    xh = x(t-tau).*h(tau); 
    lxh = length(xh);
    y(ti) = sum(xh.*dtau); % Trapezoidal approximation of convolution integral
    subplot(2,1,1),plot(tau,h(tau),'k-',tau,x(t-tau),'b--',t,0,'ok'); 
    axis([tau(1) tau(end) -2.0 2.5]); 
    patch([tau(1:end-1);tau(1:end-1);tau(2:end);tau(2:end)],...
        [zeros(1,lxh-1);xh(1:end-1);xh(2:end);zeros(1,lxh-1)],...
        [.8 .8 .8],'edgecolor','none'); 
    xlabel('\tau'); legend('h(\tau)','x(t-\tau)','t','h(\tau)x(t-\tau)',3);
    c = get(gca,'children'); set(gca,'children',[c(2);c(3);c(4);c(1)]);
    subplot(2,1,2),plot(tvecDense,x(tvecDense),'b--',tvec,y,'r',tvec(ti),y(ti),'ok'); 
    xlabel('t'); ylabel('y(t) = \int h(\tau)x(t-\tau) d\tau'); 
    legend('x(t)', 'y(t)', 't');  % Lasses tillägg
    axis([tau(1) tau(end) -1.0 2.0]); grid;
    ohfig;  % Lasses tillägg för att få tydligare grafer
    drawnow;
end
%output=y;


    
