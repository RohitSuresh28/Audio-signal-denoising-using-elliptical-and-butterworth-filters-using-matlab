% Example: Filtering noise from an audio signal using a low-pass Butterworth filter

% Load the audio file (replace 'noisy_audio.wav' with your audio file)
[y, Fs] = audioread('adultCASE1.mp3');

% Define the cutoff frequency for the low-pass filter
cutoff_freq = 2000; % Adjust this value based on your signal characteristics

% Design a Butterworth low-pass filter
order = 4; % Filter order
[b, a] = butter(order, cutoff_freq/(Fs/2), 'low');

% Apply the filter to the audio signal
filtered_audio = filter(b, a, y);

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