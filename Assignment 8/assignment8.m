clear

format long

[rawdata,samplerate] = audioread("bloop.wav");

% using plot(rawdata), was able to see that the bloop happens over
% 2.4*10^4-2.8*10^4 range

start = 2.39*10^4;

realdata = rawdata(start:start+3999);

% Question 1 - 4000 data points divided by 8000 data points per second
% givers us the result of 0.5 seconds. The actual bloop is a little bit
% shorter than that, but the "realdata" data set is half a second long

N=4000;

[A,B,A0] = fourier(realdata,N);

p = sqrt(squareman(A)+squareman(B));

k = (1:N/2);
freq = (k*samplerate/N);

plot(freq,p) % periodogram here

xlim([0,2000]);
xlabel ("Frequency (Hz)");
ylabel ("Amplitude");
title ("Fourier decomposition of bloop signal");

newN = N/10;
numbah = 10;
splitdata = reshape(realdata,[],numbah);

for i=1:10
    [C(i,:),D(i,:),C0(i,:)] = fourier(splitdata(:,i),newN);
end

newp = sqrt(squareman(C)+squareman(D));
newK = (1:newN/2);
newFreq = (newK*samplerate/newN);
nlist = 1:10;

imagesc(newFreq,nlist,newp)
xlim ([0 2000])
xlabel("Frequency (hz)")
ylabel("Time Window")
title("Waterfall diagram for bloop signal")

% Question 2 - The dominant frequency at t=0.3s is 160 hz, at t=0.35s is 200hz, and
% at t=0.4s is 260 hz. All these times are taken with respect to the
% beginning of the bloop (which is pretty arbitrary).

% Question 3 - If the bloop was sped up 16x, that means the original bloop
% was 16x slower. As a result, we can say that the dominant frequency at t=4.8s is 16 hz, at t=5.6s is 12.5hz, and
% at t=6.4s is 16.25 hz. All these times are taken with respect to the
% beginning of the bloop (which is pretty arbitrary).