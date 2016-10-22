function lab2_commands () 
% t = linspace(2,5,500);
% x = 5*ones(500);
% figure;
% subplot(5,1,1);
% plot(t,x);
% subplot(5,1,2);
% stem(t,x);
% % ***********************************************************
% % generate ramp function
% t1=linspace(0,3,1500);
% x1=zeros(1,1500);
% t2=linspace(3,6,1500);
% % subtract from each element 3 (scale subtraction);
% x2=t2-3;
% T= [t1 t2];
% X = [x1 x2];
% subplot(5,1,3);
% plot(T,X);
% subplot(5,1,4);
% stem(T,X);
% ***********************************************************
% generate triangolar functions 
% sin : scale from 0 > pi 
% sind : scale from 0 > 180 
% also cos - cosd , tan - tand
% exp(x)
% sinh() - cosh() : just to knwo its exist
% ***********************************************************
% don't give a shit about this
% t = linspace(0,2,1000);
% x1 = zeros(1,100)-5;
% x2=17.3*ones(1,100);
% t=linspace(-4,2,600);
% x3=-2*t+5;
% x4=1/3*t.^3-2*t-7;
% x5=5*sin(2*pi*t-pi/4);
% x6=1/2*cosh(0.5*t);
% x7=5*exp(-0.4*t);
% x8=log(t+5);
% x9=log10(t+5);
% *************************************************************
t1 = linspace(0,0.5,100);
t2 = linspace(0.5,1,100);
t3 = linspace(1,1.5,100);
T = [t1 t2 t3];
x1 = 2*t1;
x2 = ones(1,100);
x3 = -cos(pi*t3);
X = [x1 x2 x3];
figure;
subplot(2,1,1);
% add axis limits here to refine the shape of plot
plot(T,X);
subplot(2,1,2);
stem(T,X);
end