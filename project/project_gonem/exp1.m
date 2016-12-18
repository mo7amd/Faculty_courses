function [signal,start_point,end_point,Time] = exp1(fs)
    prompt = 'enter start point : ';
    start_point = input(prompt);
    
    prompt = 'enter end point : ';
    end_point = input(prompt);
    
    prompt = 'enter number of break point : ';
    break_points = input(prompt);
    if ~break_points
        positions = end_point;
    else    
    prompt = 'enter postion of break points as [1 2 ..] \n:     ';
    positions = input(prompt);
    end
    all_points = [start_point positions end_point];
    disp(all_points);
    signal = [];
    Time = [];
    disp(break_points);
    for signals=1:break_points+1
       input_signal = menu('Choose a type','DC signal','Ramp signal','exponintial signal','sinsoidal signal'); %input(prompt) 
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
