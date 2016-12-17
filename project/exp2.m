function exp2(fs,signal,start_point,end_point,Time)
   m=signal;
   t1=start_point;
   t2=end_point;
   tm=Time;
   fprintf('enter the impulse respnse information:\n');
   [y,t3,t4,~] = exp1(fs);
   x=conv(y,m);
   x1=x*(1/fs);
   m = deconv(x,y);
   t=linspace(t1+t3,t2+t4,length(x));
   sig = 'enter the sigma: ';
   sigma = input(sig);
   z=sigma*randn(1,length(x));
   n=x+z;
   %fr=exp(1j*(2*pi*fs).*tm);
   %fr1=exp(1j*(2*pi*fs).*t);
   %freq_resp=((1/fs)*conv(y,fr))./fr1;
   %plot_func(freq_resp,fs,t);
   plot_function(x1,fs,t);
   plot_function(n,fs,t);
   plot_function(m,fs,tm);
end
