function X = FFTradix2(X)
    ilosc_iteracji = 1;
    
    while 2^ilosc_iteracji < length(X)
        ilosc_iteracji = ilosc_iteracji + 1;
    end
    
    n = 1;
    p = 1;
    m = length(X)/2;
    for i = 1 : ilosc_iteracji
        
        Y = X;
        
        kat = 360/(m*2);
        omega = zeros(1, m);
        omega(1) = complex(1);
        for q = 2 : m
            omega(q) = complex(cosd(360-(kat*(q-1))), sind(360-(kat*(q-1))));
        end
        
        for j = 1 : length(X)/2
            X(p) = X(p) + X(p+m);
            if mod(j, m) == 0
                p = p + m + 1;
            else
                p = p + 1;
            end
        end
        
        q = 1;
        k = m+1;
        for j = 1 : length(X)/2
            X(k) = (-X(k) + Y(k-m))*omega(q); 
            if mod(j, m) == 0
                k = k + m + 1;
                q = 1;
            else
                q = q + 1;
                k = k + 1;
            end
        end
            
        m = m/2;
        p = 1;
    end
    
    X = bitrevorder(X);
end