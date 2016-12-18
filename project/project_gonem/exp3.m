function exp3(fs,signal,Time)
   b=1;
   a=[1 0.5 0.5];
   y=filter(b,a,signal);
   plot_func(y,fs,Time);
   signal = filter(a,b,y);
   plot_func(signal,fs,Time);
   [h1,w] = freqz(b,a,length(signal)); %
   [h2,w] = freqz(a,b,length(signal)); %
   plot_func(h1,fs,Time);
   plot_func(h2,fs,Time);
   figure;
   subplot(2,1,1);
   zplane(b,a);
   subplot(2,1,2);
   zplane(a,b);
 end

