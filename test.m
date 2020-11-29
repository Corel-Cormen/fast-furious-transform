X = rand(1, 1024);

ff = fft(X);
Xd = FFTradix2(X);
ERR = max(abs(ff - Xd))