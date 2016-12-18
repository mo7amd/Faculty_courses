function LTI_DE(fs,signal,Time)
   b=1;
   a=[1 0.5 0.5];
   y=filter(b,a,signal);
   plot_function(y,fs,Time,'LTI DE system');
   signalreturn = filter(a,b,y);
   plot_function(signalreturn,fs,Time,'LTI inverse DE system');
   [h1,w] = freqz(b,a,length(signal)); %
   [h2,w] = freqz(a,b,length(signal)); %
   plot_function(h1,fs,Time,'frequency response of DE system');
   plot_function(h2,fs,Time,'frequency response of inverse DE system');
   figure('Name','Bonus of stability');
   subplot(2,1,1);
   zplane(b,a);
   subplot(2,1,2);
   zplane(a,b);
end
