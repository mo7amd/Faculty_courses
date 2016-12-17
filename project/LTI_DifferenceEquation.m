function LTI_DifferenceEquation(fs,signal,Time)
   b=[1];
   a=[1 0.5 0.5];
   y=filter(b,a,signal);
   plot_function(y,fs,Time);
   signal = filter(a,b,y);
   plot_function(signal,fs,Time);
   fr=exp(1j*(2*pi*fs).*Time);
   freq_resp1=filter(b,a,fr)./fr;
   freq_resp2=filter(a,b,fr)./fr;
   plot_function(freq_resp1,fs,Time);
   plot_function(freq_resp2,fs,Time);
end