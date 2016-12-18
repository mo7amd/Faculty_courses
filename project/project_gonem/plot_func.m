
function plot_func(x,fs,t)
    f=linspace(-fs/2,fs/2,length(x));
    figure;
    subplot(2,1,1);
    plot(t,x);
    subplot(2,1,2);
    plot(f,abs(fftshift(fft(x))));
end
