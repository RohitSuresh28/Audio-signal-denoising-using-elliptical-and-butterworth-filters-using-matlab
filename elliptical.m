% Assume you have a noisy signal 'noisy_signal' and the sampling frequency 'Fs'
[y, Fs] = audioread('adultCASE1.mp3');

% Step 1: Design the Elliptical Filter
N = 6;                % Filter order (adjust this value based on your requirements)
Rp = 1;               % Passband ripple in decibels (adjust this value based on your requirements)
Rs = 60;              % Stopband attenuation in decibels (adjust this value based on your requirements)
cutoff_freq = 1000;   % Cutoff frequency in Hz (adjust this value based on your requirements)
Wn = (2 * cutoff_freq) / Fs;  % Normalize the cutoff frequency

% Design the elliptical low-pass filter
[b, a] = ellip(N, Rp, Rs, Wn, 'low');

% Step 2: Filter Coefficients are in 'b' (numerator) and 'a' (denominator)

% Step 3: Filter the Noisy Signal
% Apply the filter to the noisy signal using 'filter' (or 'filtfilt' for zero-phase filtering)
filtered_signal = filter(b, a, y);
% Alternatively, for zero-phase filtering:
% filtered_signal = filtfilt(b, a, noisy_signal);

% Plot the original and filtered signals for comparison
t = (0:length(y)-1) / Fs;
figure;
subplot(2,1,1);
plot(t, y);
title('Original Noisy Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, filtered_signal);
title('Filtered Signal (Elliptical Low-Pass)');
xlabel('Time (s)');
ylabel('Amplitude');