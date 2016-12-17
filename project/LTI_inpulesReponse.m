function LTI_inpulesReponse(fs,signal,start_point,end_point)
   fprintf('enter the impulse respnse information:\n');
   [y,t3,t4,~] = function_generator(fs);
   x=conv(y,signal);
   x1=x*(1/fs);
   signal = deconv(x,y);
   time=linspace(start_point,end_point,(end_point-start_point)*fs);
   t=linspace(start_point+t3,end_point+t4,length(x));
   sig = 'enter the sigma: ';
   sigma = input(sig);
   z=sigma*randn(1,length(x));
   n=x+z;
   fr=exp(1j*(2*pi*fs).*time);
   fr1=exp(1j*(2*pi*fs).*t);
   freq_resp=((1/fs)*conv(y,fr))./fr1;
   plot_function(freq_resp,fs,t);
   plot_function(x1,fs,t);
   plot_function(n,fs,t);
   plot_function(signal,fs,time);
end