function [signal,start_point,end_point,Time] = function_generator(fs,title)
    cprintf('*comment','Enter [ StartPoint EndPoint Number_Of_BreakPoint ]\n');
    prompt = ' : ';
    points = input(prompt);
    start_point = points(1,1);
    end_point = points(1,2);
    break_points = points(1,3);
    if ~break_points
        positions = end_point;
    else    
    prompt = 'enter postion of break points as [ 1 2 .. ] \n:     ';
    positions = input(prompt);
    end
    
    all_points = [start_point positions end_point];
    disp(all_points);
    signal = [];
    Time = [];
    for signals=1:break_points+1
        SignalFlag = 1;
    while SignalFlag == 1
%        input_signal = menu('Choose a type','DC signal','Ramp signal','exponintial signal','sinsoidal signal'); 
       cprintf('-comment','Choose type of signal ');
       fprintf('%d',signals);
       cprintf('-comment',' : \n')
       cprintf('*blue',' 1) DC Signal\n 2) Ramp Signal\n 3) Exponential Signal\n 4) Sinosoidal Signal\n');
       prompt = ' : ';
       input_signal = input(prompt); 
       current_time = linspace(all_points(signals),all_points(signals+1),(all_points(signals+1)-all_points(signals))*fs);
       Time = [Time current_time];
       
       switch input_signal 
           %******************'DC signal'*****************************
           case 1
               prompt = 'Enter the ampilitude: ';
               DC_amplitude = input(prompt);
               DC_signal = DC_amplitude.*ones(1,(all_points(signals+1)-all_points(signals))*fs);
               signal = [signal DC_signal];
           %******************'Ramp signal'***************************
           case 2
               prompt = 'Enter [slope intercept] : ';
               ramp_inputs = input(prompt);
               slope = ramp_inputs(1,1);
               intercept = ramp_inputs(1,2);
               ramp_signal = current_time.*slope + intercept;
               signal = [signal ramp_signal]; 
           %*****************'exponintial signal'*********************
           case 3
               prompt = 'Enter [DC_component  amplitude  exponent  Time_shift] : ';
               exp_inputs = input(prompt);
               dcc= exp_inputs(1,1);
               exp_amplitude = exp_inputs(1,2);
               exp_exponent = exp_inputs(1,3);
               time_shift = exp_inputs(1,4);
               exp_signal = dcc+exp_amplitude.*exp(exp_exponent*(current_time-time_shift));
               signal = [signal exp_signal];
           %*****************'sinsoidal signal'***********************
           case 4
               prompt = 'Enter [DC_component amplitude freq   phase] : ';
               sino_inputs = input(prompt);
               dcc= sino_inputs(1,1);
               sin_amplitude = sino_inputs(1,2);
               sin_freq = sino_inputs(1,3);
               sin_phase = sino_inputs(1,4);
               sin_signal =dcc+sin_amplitude.*sin(2*pi*sin_freq*current_time + sin_phase);
               signal = [signal sin_signal];
       end
       prompt = 'Do you want re-enter the past signal (y/n) ? ';
       ReEnter = input(prompt,'s');
       if ReEnter == 'n' || ReEnter == 'N' 
           SignalFlag=0;
       end
    end
    end
    plot_function(signal,fs,Time,title);
end