function exp3(fs,signal,Time)
   m=signal;
   tm=Time;
   b=[1];
   a=[1 0.5 0.5];
   y=filter(b,a,m);
   plot_function(y,fs,tm);
   m = filter(a,b,y);
   s = isstable(m)
   plot_function(m,fs,tm);
   fr1=y./m;
   fr2=m./y;
   %fr=exp(1j*(2*pi*fs).*tm);
   %freq_resp1=filter(b,a,fr);
   %freq_resp2=filter(a,b,fr);
   plot_function(fr1,fs,tm);
   plot_function(fr2,fs,tm);
end
