function LTI_ImpulseResponse(fs,signal,start_point,end_point,Time)
%   *******************generate LTI channel************************
   cprintf('*[1,0,1]','enter the impulse respnse information:\n');
   [Impulse_response,start_time_impulse,end_time_impulse,~] = function_generator(fs,'LTI impulse response');
%    ***************** impulse response section 
   output=conv(Impulse_response,signal);
   convoluted_signal=output*(1/fs);
   deconvoluted_signal = deconv(output,Impulse_response);
   timeofconvsignal=linspace(start_point+start_time_impulse,end_point+end_time_impulse,length(output));
%    ************** noise section **********************************
   sig = 'Enter the sigma: ';
   sigma = input(sig);
   z=sigma*randn(1,length(output));
   ConvolutionWithNoise=convoluted_signal+z;
   %The frequency response in the way of the lectures
   fr=exp(1j*(2*pi*fs).*Time);
   fr1=exp(1j*(2*pi*fs).*timeofconvsignal);
   freq_resp=((1/fs)*conv(Impulse_response,fr))./fr1;
%    ************* plot section ************************************
   plot_function(freq_resp,fs,timeofconvsignal,'frequency responce');
   plot_function(convoluted_signal,fs,timeofconvsignal,'convoluted signal');
   plot_function(ConvolutionWithNoise,fs,timeofconvsignal,'convoluted with noise signal');
   plot_function(deconvoluted_signal,fs,Time,'deconvoluted signal');
end
