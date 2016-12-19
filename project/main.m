% welcome to our final project program.
% this progra generates a general signal
% and an LTI channel using
% 1) impulse response
% 2) Difference equations
% to run the program just run main.m file
% that will run all functions in nice UI designed by us.

function main()
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
            sound_wav();
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
    sampleFlag = 1;
    while sampleFlag
        cprintf('-comment','Enter the sampling frequency');
        prompt = ' : ';
        sampling_freq = input(prompt);
      if sampling_freq == abs(sampling_freq) 
        prompt = ('Do you want re-enter sampling freq (y/n)? ');
        reEnter = input(prompt,'s');
        if reEnter == 'n' || reEnter == 'N'
            sampleFlag = 0;
        end
      else
          cprintf('red','Please enter a positive value\n');
          sampleFlag=1;
      end
    end

    [signal,start_point,end_point,Time] = function_generator(sampling_freq,'Message signal');
    
    while true
    cprintf('-comment','\n\nChoose kind of channel : \n');
    cprintf('*blue',' 1) LTI channel "impulse response"\n 2) LTI Channel "DE"\n');
    cprintf('*red',' 0) to exit\n');
    prompt = ' : ';
    TypeOfChannel = input(prompt);
    switch TypeOfChannel
        case 0
            clc;
            return;
        case 1
            LTI_ImpulseResponse(sampling_freq,signal,start_point,end_point,Time);
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