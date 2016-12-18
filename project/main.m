function main()
% welcome to our final project program.
% this program desing to generate general signal
% and LTI
% channel using
% 1) Difference equations
% 2) inpulse response
% to run the program just rub main.m file
% that will run all functions in nice UI designed by
% us.
close all;
clc;
Loading();
while true
    cprintf('-comment','\n\n choose type of signal : \n ');
    cprintf('*blue','1) sound signal\n 2) generate signal\n');
    cprintf('*red',' 0) to exit\n')
    prompt = ' : ';
    TypeOfSignal = input(prompt);
    close all;
    clc;
    switch TypeOfSignal
        case 0
            return;
        case 1
            sound();
        case 2
            generate_signal();
        otherwise
            warning('please enter only one of the above');
    end
end
end

function Loading()
cprintf('*[1,0,1]','********** Welcome to our program **********\n\n');
cprintf('*blue','Loading...');
for i=1:2
    cprintf('*blue','.');
    pause(1);
end
fprintf('\n');
end

function generate_signal()
while true
    clc;
    sampleFlage = 1;
    while sampleFlage
        cprintf('-comment','enter the sampling freq');
        prompt = ' : ';
        sampling_freq = input(prompt);
        prompt = ('Do you want re-enter sampling freq (y/n)? ');
        reEnter = input(prompt,'s');
        if reEnter == 'n' || reEnter == 'N'
            sampleFlage = 0;
        end
    end

    [signal,start_point,end_point,Time] = function_generator(sampling_freq,'messege signal');
    
    while true
    cprintf('-comment','\n\nchoose kind of chaneel : \n');
    cprintf('*blue',' 1) LTI channel "inpulse response"\n 2) LTI "DE"\n');
    cprintf('*red',' 0) to exit\n');
    prompt = ' : ';
    TypeOfChannel = input(prompt);
    switch TypeOfChannel
        case 0
            clc;
            return;
        case 1
            LTI_InpulseResponse(sampling_freq,signal,start_point,end_point,Time);
            clc;
        case 2
            LTI_DE(sampling_freq,signal,Time);
            clc;
        otherwise
            warning('please enter only one of the above')
    end
    end
end
end

