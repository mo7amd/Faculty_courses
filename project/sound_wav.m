function sound_wav()
clc;
cprintf('*[1,0,1]','please enter sound file between single quotes: ');
[wav,fs]=wavread(input(''));
if  fs==44100
    fo=fs;
    wav_time=linspace(0,length(wav)/fs,length(wav));
    inpulse_time=linspace(0,1,length(wav));
    inpulse_zeros=zeros(1,length(inpulse_time)-2);
    inpulse_response=[1 inpulse_zeros 0.5];
%     figure;
%     plot(inpulse_time,inpulse_response);
    convoluted_signal=conv(wav,inpulse_response);
%     figure
%     plot(wav_time,wav);
    frequancy=linspace(-fs/2,fs/2,length(wav_time));
    WAV=fftshift(fft(wav));
    convolution_time=linspace(0,(length(wav)/fs)+1,(2*length(wav))-1);
%     figure;
%     plot(frequancy,abs(WAV))
%     figure;
%     plot(convolution_time,convoluted_signal);
    %sound(g,fs);
    audiowrite('ericfinal.wav',convoluted_signal,44100);
    wav=wav(1:length(wav));
    WAV([(round(length(wav)/2)+1)-round(4000*length(wav)/fs):round(length(wav)/2) round(length(wav)/2)+1: round(length(wav)/2)+round(4000*length(wav)/fs)])=0;
    wav_after_modification=real(ifft(WAV));
    audiowrite('ericfinal22.wav',wav_after_modification,44100);
%     figure;
%     plot(frequancy,abs(WAV))
else
    fo=44100;
    wav=resample(wav,fs,fo);
    wav_time=linspace(0,length(wav)/fo,length(wav));
%     figure;
%     plot(wav_time,wav);
    inpulse_time=linspace(0,1,length(wav));
    inpulse_zeros=zeros(1,length(inpulse_time)-2);
    inpulse_response=[1 inpulse_zeros 0.5];
%     figure;
%     plot(inpulse_time,inpulse_response);
    convoluted_signal=conv(wav,inpulse_response);
    frequancy=linspace(-fo/2,fo/2,length(wav_time));
    WAV=fftshift(fft(wav));
    convolution_time=linspace(0,(length(wav)/fo)+1,(2*length(wav))-1);
%     figure;
%     plot(frequancy,abs(WAV))
%     figure;
%     plot(convolution_time,convoluted_signal);
    %sound(g,fo);
    audiowrite('ericfinal.wav',convoluted_signal,44100);
    audiowrite('ericfinal2.wav',wav,44100);
    wav=wav(1:length(wav));
    WAV([(round(length(wav)/2)+1)-round(4000*length(wav)/fs):round(length(wav)/2) round(length(wav)/2)+1: round(length(wav)/2)+round(4000*length(wav)/fs)])=0;
%X([1:183228 264410:447617])=0;
    wav_after_modification=real(ifft(WAV));
    audiowrite('ericfinal222.wav',wav_after_modification,44100);
%     figure;
%     plot(frequancy,abs(WAV))
% ********************************************************
end
    plot_function(wav,fo,wav_time,'orginal sound');
    sound(convoluted_signal,fo);
end