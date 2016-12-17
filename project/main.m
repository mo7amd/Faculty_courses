function main()
prompt = 'enter the sampling freq : ';
sampling_freq = input(prompt);
fs=sampling_freq;
fprintf('enter the signal information:\n');
[signal,start_point,end_point,Time] = function_generator(fs);
LTI_inpulesReponse(fs,signal,start_point,end_point);
LTI_DifferenceEquation(fs,signal,Time);
end

