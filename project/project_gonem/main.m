function main()
prompt = 'enter the sampling freq : ';
sampling_freq = input(prompt);
fs=sampling_freq;
fprintf('enter the signal information:\n');
[signal,start_point,end_point,Time] = exp1(fs);
exp2(fs,signal,start_point,end_point,Time);
exp3(fs,signal,Time);
end





