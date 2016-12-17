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
           %******************'DC signal'*****************************
           case 1
               prompt = 'enter the ampilitude: ';
               DC_amplitude = input(prompt);
               DC_signal = DC_amplitude.*ones(1,(all_points(signals+1)-all_points(signals))*fs);
               signal = [signal DC_signal];
           %******************'Ramp signal'***************************
           case 2
               prompt = 'enter [slope intercept] : ';
               ramp_inputs = input(prompt);
               slope = ramp_inputs(1,1);
               intercept = ramp_inputs(1,2);
               ramp_signal = current_time.*slope + intercept;
               signal = [signal ramp_signal]; 
           %*****************'exponintial signal'*********************
           case 3
               prompt = 'enter [dccomp amplitude exponent] : ';
               exp_inputs = input(prompt);
               dcc= exp_inputs(1,1);
               exp_amplitude = exp_inputs(1,2);
               exp_exponent = exp_inputs(1,3);
               exp_signal = dcc+exp_amplitude.*exp(exp_exponent*current_time);
               signal = [signal exp_signal];
           %*****************'sinsoidal signal'***********************
           case 4
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
    
    plot_function(signal,fs,Time);
end
