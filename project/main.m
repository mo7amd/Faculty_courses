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
clear all;
clc;
cprintf('*blue','********** Welcome to our program **********\n');
cprintf('*blue','Loading...');
for i=1:5
    cprintf('*blue','.');
    pause(1);
end
fprintf('\n');
while(true)
prompt = 'enter the sampling freq : ';
sampling_freq = input(prompt);
fprintf('enter the signal information:\n');
[signal,start_point,end_point,Time] = exp1(sampling_freq);
exp2(sampling_freq,signal,start_point,end_point,Time);
exp3(sampling_freq,signal,Time);
end
end





