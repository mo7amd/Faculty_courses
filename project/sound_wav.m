function sound_wav()
clc;
cprintf('*[1,0,1]','please enter sound file between single quotes: ');
%to read any input wav format file
[wav,fs]=wavread(input(''));

if  fs==44100
%no need for resampling
    fo=fs;
    wav_time=linspace(0,length(wav)/fs,length(wav));
    
%the impulse response system   
    impulse_time=linspace(0,1,length(wav));
    impulse_zeros=zeros(1,length(impulse_time)-2);
    impulse_response=[1 impulse_zeros 0.5];

%Convoluting the wav with the impulse response
    convoluted_signal=conv(wav,impulse_response);
    frequency=linspace(-fo/2,fo/2,length(wav));
    %convolution_time=linspace(0,(length(wav)/fs)+1,(2*length(wav))-1);

%Saving the output sound
    wavwrite(convoluted_signal,fo,'Convoluted wav');
%     audiowrite('Convoluted wav',convoluted_signal,fo);
%************* filter bonus **************
    wav=wav(1:length(wav));
    WAV=fftshift(fft(wav));
    WAV([(round(length(wav)/2)+1)-round(4000*length(wav)/fs):round(length(wav)/2) round(length(wav)/2)+1: round(length(wav)/2)+round(4000*length(wav)/fs)])=0;
    wav_after_modification=real(ifft(WAV));
    wavwrite(wav_after_modification,fo,'wav after filter');
    figure('name','filtered wav');
    plot(frequency,abs(WAV))

else
%we need resampling    
    fo=44100;
    wav=resample(wav,fs,fo);
    wav_time=linspace(0,length(wav)/fo,length(wav));

    impulse_time=linspace(0,1,length(wav));
    impulse_zeros=zeros(1,length(impulse_time)-2);
    impulse_response=[1 impulse_zeros 0.5];

    convoluted_signal=conv(wav,impulse_response);
    frequency=linspace(-fo/2,fo/2,length(wav));
    %convolution_time=linspace(0,(length(wav)/fo)+1,(2*length(wav))-1);
    wavwrite(convoluted_signal,fo,'Convoluted wav');
    
%************* filter bonus **************
    wav=wav(1:length(wav));
    WAV=fftshift(fft(wav));
    WAV([(round(length(wav)/2)+1)-round(4000*length(wav)/fs):round(length(wav)/2) round(length(wav)/2)+1: round(length(wav)/2)+round(4000*length(wav)/fs)])=0;
    wav_after_modification=real(ifft(WAV));
    wavwrite(wav_after_modification,fo,'wav after filter');
    figure('name','filtered wav');
    plot(frequency,abs(WAV))
%*********************************************************
end
    plot_function(wav,fo,wav_time,'orginal sound');
%playing the sound    
    sound(convoluted_signal,fo);
end