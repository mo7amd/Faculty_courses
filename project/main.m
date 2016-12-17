function main()
prompt = 'enter the sampling freq : ';
sampling_freq = input(prompt);
fs=sampling_freq;
fprintf('enter the signal information:\n');
[signal,start_point,end_point,Time] = exp1(fs);
exp2(fs,signal,start_point,end_point,Time);
exp3(fs,signal,Time);
end

function [signal,start_point,end_point,Time] = exp1(fs)
    prompt = 'enter start point : ';
    start_point = input(prompt);
    
    prompt = 'enter end point : ';
    end_point = input(prompt);
    
    prompt = 'enter number of break point : ';
    break_points = input(prompt);
    
    prompt = 'enter postion of break points as [1 2 ..] \n:     ';
    positions = input(prompt);
    
    all_points = [start_point positions end_point];
    disp(all_points);
    signal = [];
    Time = [];
    disp(break_points);
    for signals=1:break_points+1
       input_signal = menu('Choose a type','DC signal','Ramp signal','exponintial signal','sinsoidal signal'); %input(prompt) 
       %length_of_signal = all_points(signals+1) - all_points(signals) + 1;
       current_time = linspace(all_points(signals),all_points(signals+1),(all_points(signals+1)-all_points(signals))*fs);
       Time = [Time current_time];
       
       switch input_signal 
           case 1%'DC signal'
               prompt = 'enter the ampilitude: ';
               DC_amplitude = input(prompt);
               DC_signal = DC_amplitude.*ones(1,(all_points(signals+1)-all_points(signals))*fs);
               signal = [signal DC_signal];
           case 2%'Ramp signal'
               prompt = 'enter [slope intercept] : ';
               ramp_inputs = input(prompt);
               slope = ramp_inputs(1,1);
               intercept = ramp_inputs(1,2);
               ramp_signal = current_time.*slope + intercept;
               signal = [signal ramp_signal]; 
           case 3%'exponintial signal'
               prompt = 'enter [dccomp amplitude exponent] : ';
               exp_inputs = input(prompt);
               dcc= exp_inputs(1,1);
               exp_amplitude = exp_inputs(1,2);
               exp_exponent = exp_inputs(1,3);
               exp_signal = dcc+exp_amplitude.*exp(exp_exponent*current_time);
               signal = [signal exp_signal];
           case 4%'sinsoidal signal'
               prompt = 'enter [dccomp amplitude freq phase] : ';
               sino_inputs = input(prompt);
               dcc= sino_inputs(1,1);
               sino_amplitude = sino_inputs(1,2);
               sino_freq = sino_inputs(1,3);
               sino_phase = sino_inputs(1,4);
               sino_signal =dcc+sino_amplitude.*sin(2*pi*sino_freq*current_time + sino_phase);
               signal = [signal sino_signal];
       end
    end
    
    plot_func(signal,fs,Time);
end



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
   tm=linspace(t1,t2,(t2-t1)*fs);
   t=linspace(t1+t3,t2+t4,length(x));
   sig = 'enter the sigma: ';
   sigma = input(sig);
   z=sigma*randn(1,length(x));
   n=x+z;
   fr=exp(1j*(2*pi*fs).*tm);
   fr1=exp(1j*(2*pi*fs).*t);
   freq_resp=((1/fs)*conv(y,fr))./fr1;
   plot_func(freq_resp,fs,t);
   plot_func(x1,fs,t);
   plot_func(n,fs,t);
   plot_func(m,fs,tm);
end

function exp3(fs,signal,Time)
   m=signal;
   tm=Time;
   b=[1];
   a=[1 0.5 0.5];
   y=filter(b,a,m);
   plot_func(y,fs,tm);
   m = filter(a,b,y);
   plot_func(m,fs,tm);
   fr=exp(1j*(2*pi*fs).*tm);
   freq_resp1=filter(b,a,fr)./fr;
   freq_resp2=filter(a,b,fr)./fr;
   plot_func(freq_resp1,fs,tm);
   plot_func(freq_resp2,fs,tm);
end

function plot_func(x,fs,t)
    f=linspace(-fs/2,fs/2,length(x));
    figure;
    plot(t,x);
    figure;
    plot(f,abs(fftshift(fft(x))));
end
