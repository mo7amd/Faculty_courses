clc;
fprintf('please enter sound file between single quotes: ')
[y,fs]=wavread(input(''));
if  fs==44100
    x=y;
    t=linspace(0,length(x)/fs,length(x));
    t2=linspace(0,1,length(x));
    s=zeros(1,length(t2)-2);
    h=[1 s 0.5];
    figure;
    plot(t2,h);
    g=conv(x,h);
    figure
    plot(t,x);
    f=linspace(-fs/2,fs/2,length(t));
    X=fftshift(fft(x));
    t1=linspace(0,(length(x)/fs)+1,(2*length(x))-1);
    figure;
    plot(f,abs(X))
    figure;
    plot(t1,g);
    sound(g,fs);
    audiowrite('ericfinal.wav',g,44100);
    x=x(1:447617);
    X([183228:223808 223809:264409])=0;
    x2=real(ifft(X));
    audiowrite('ericfinal22.wav',x2,44100);
    plot(f,abs(X))
else
    fo=44100;
    x=resample(y,fs,fo);
    t=linspace(0,length(x)/fo,length(x));
    t2=linspace(0,1,length(x));
    s=zeros(1,length(t2)-2);
    h=[1 s 0.5];
    figure;
    plot(t2,h);
    g=conv(x,h);
    figure
    plot(t,x);
    f=linspace(-fo/2,fo/2,length(t));
    X=fftshift(fft(x));
    t1=linspace(0,(length(x)/fo)+1,(2*length(x))-1);
    figure;
    plot(f,abs(X))
    figure;
    plot(t1,g);
    sound(g,fo);
    audiowrite('ericfinal.wav',g,44100);
    audiowrite('ericfinal2.wav',x,44100);
    x=x(1:447617);
    X([183228:223808 223809:264409])=0;
    x2=real(ifft(X));
    audiowrite('ericfinal22.wav',x2,44100);
    plot(f,abs(X))
end