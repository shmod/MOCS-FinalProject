clear all
close all

k = 'circle';
showplot = 1;

N = 9;
sN = zeros(N,N);

if strcmpi(k, 'circle')
    for i = 1:N
        if (i == 1)
            sN(i, 2) = 1;
            sN(i, N) = 1;
        elseif (i == N)
            sN(i, 1) = 1;
            sN(i, N-1) = 1;
        else
        	sN(i, i+1) = 1;
            sN(i, i-1) = 1;
        end
    end
elseif strcmpi(k, 'lattice')
    if (sqrt(N)-ceil(sqrt(N)) ~= 0)
        error('Not a square number');
    end
    r = sqrt(N);
    
    for i = 1:N
        [up, down, left, right] = latticeCalculator(i, N);
        if (up ~= 0)
            sN(i, up) = 1;
        end
        if (left ~= 0)
            sN(i, left) = 1;
        end
        if (right ~= 0)
            sN(i, right) = 1;
        end
        if (down ~= 0)
            sN(i, down) = 1;
        end
    end
end

if (showplot)
    G = graph(sN);
    plot(G);
end