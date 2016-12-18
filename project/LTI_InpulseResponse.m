function LTI_InpulseResponse(fs,signal,start_point,end_point,Time)
   fprintf('enter the impulse respnse information:\n');
   [Inpulse_response,start_time_inpulse,end_time_inpulse,~] = function_generator(fs,'LTI inpulse response');
%    th=linspace(t3,t4,length(y));
%    figure;
%    plot(th,abs(fftshift(fft(y))));
   output=conv(Inpulse_response,signal);
   convoluted_signal=output*(1/fs);
   deconvoluted_signal = deconv(output,Inpulse_response);
   t=linspace(start_point+start_time_inpulse,end_point+end_time_inpulse,length(output));
   sig = 'enter the sigma: ';
   sigma = input(sig);
   z=sigma*randn(1,length(output));
   ConvolutionWithNoise=output+z;
   fr=exp(1j*(2*pi*fs).*Time);
   fr1=exp(1j*(2*pi*fs).*t);
   freq_resp=((1/fs)*conv(Inpulse_response,fr))./fr1;
   plot_function(freq_resp,fs,t,'frequancy responce');
   plot_function(convoluted_signal,fs,t,'convoluted signal');
   plot_function(ConvolutionWithNoise,fs,t,'convoluted with noise signal');
   plot_function(deconvoluted_signal,fs,Time,'deconvoluted signal');
end
