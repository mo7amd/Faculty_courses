function LTI_DE(fs,signal,Time)
%    *************** create channel of DE **************************
   b=1;
   a=[1 0.5 0.5];
%    ********** signal after pass channel and return it again ******
   y=filter(b,a,signal);
   signalreturn = filter(a,b,y);
%    ********** freq resoponse and return from it again ************
   h1 = freqz(b,a,length(signal));
   h2 = freqz(a,b,length(signal));
%    ****************** plot section *******************************
   plot_function(y,fs,Time,'LTI DE system');
   plot_function(signalreturn,fs,Time,'LTI inverse DE system');
   plot_function(abs(h1),fs,Time,'frequency response of DE system');
   plot_function(abs(h2),fs,Time,'frequency response of inverse DE system');

%***** Bonus *****   
   figure('Name','Bonus of stability');
   subplot(2,1,1);
   zplane(b,a);
   subplot(2,1,2);
   zplane(a,b);
end
