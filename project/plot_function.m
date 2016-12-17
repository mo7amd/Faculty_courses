function plot_function(x,fs,t)
    f=linspace(-fs/2,fs/2,length(x));
    figure;
    plot(t,x);
    figure;
    plot(f,abs(fftshift(fft(x))));
end
