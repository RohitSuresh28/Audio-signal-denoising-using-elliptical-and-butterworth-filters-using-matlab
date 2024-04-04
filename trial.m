% Assume you have a noisy signal 'noisy_signal' and the sampling frequency 'Fs'
[y, Fs] = audioread('artifact__201106030612.wav');

% Step 1: Design the Elliptical Filter
N = 8;                
Rp = 1;               
Rs = 100;              
cutoff_freq = 350;   % Cutoff frequency in Hz
Wn = (2 * cutoff_freq) / Fs;  % Normalize the cutoff frequency

% Design the elliptical low-pass filter
[b, a] = ellip(N, Rp, Rs, Wn, 'low');

% Step 2: Filter Coefficients are in 'b' (numerator) and 'a' (denominator)

% Step 3: Filter the Noisy Signal
filtered_signal = filter(b, a, y);

%[x, F] = [filtered_signal,11025];
%p=sound(filtered_signal);
%[y, Fs] = audioread(sound(filtered_signal));

% Define the cutoff frequency for the low-pass filter
cutoff_freq =700;

% Design a Butterworth low-pass filter
order =8; 
[b, a] = butter(order, cutoff_freq/(Fs/2), 'low');

% Apply the filter to the audio signal
filtered_audio = filter(b, a, filtered_signal);

% Play the original and filtered audio
sound(y, Fs); % Noisy audio
pause(length(y)/Fs); % Pause between sounds
sound(filtered_audio, Fs); % Filtered audio

% Visualize the original and filtered signals
t = (0:length(y)-1) / Fs;
figure;
subplot(2,1,1);
plot(t, y);
title('Original Noisy Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, filtered_audio);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');