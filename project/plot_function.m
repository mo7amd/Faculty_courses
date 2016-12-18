function plot_function(signal,fs,time,title)
    f=linspace(-fs/2,fs/2,length(signal));
    figure('name',title);
    subplot(2,1,1);
    plot(time,signal);
    subplot(2,1,2);
    plot(f,abs(fftshift(fft(signal))));
end  
