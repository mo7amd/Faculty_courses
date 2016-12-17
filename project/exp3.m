function exp3(fs,signal,Time)
   m=signal;
   tm=Time;
   b=[1];
   a=[1 0.5 0.5];
   y=filter(b,a,m);
   plot_func(y,fs,tm);
   m = filter(a,b,y);
   s = isstable(m)
   plot_func(m,fs,tm);
   fr1=y./m;
   fr2=m./y;
   %fr=exp(1j*(2*pi*fs).*tm);
   %freq_resp1=filter(b,a,fr);
   %freq_resp2=filter(a,b,fr);
   plot_func(fr1,fs,tm);
   plot_func(fr2,fs,tm);
end
