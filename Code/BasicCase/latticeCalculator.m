% This function takes as input the index of an element and
% the size of the social network matrix N. It then gives back
% the index of the elements around it. A 0-index indicates that
% the element doesn't have a neighbour in that direction.

function [up, down, left, right] = latticeCalculator(i, N);

r = sqrt(N);
up = 0;
down = 0;
left = 0;
right = 0;

if (i > r)         % If the element isn't in the first row
    up = i-r;
end

if (i <= N-r)        % If the element isn't on the last row
    down = i+r;
end


if (mod(i,r) ~= 1) % If the element isn't in the first column
    left = i-1;
end

if (mod(i,r) ~= 0)  % If the element isn't in the last column
    right = i +1;
end


end