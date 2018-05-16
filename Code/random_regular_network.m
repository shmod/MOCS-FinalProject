%random regular network for last project
function network = random_regular_network(k,N)

network = zeros(2+k,N);

% We start of by initializing a connect random network
%Links the first two persons to eachother
network(1,1:2) = 1;
network(3,1) = 2;
network(3,2) = 1;
temp =0;
for i = 3:N     %Connects everyone to an already connected random person
    if (network(1,i) < k)
        r = ceil(rand*(i-1));
        while (network(1,r) == k || r == i)
            temp = temp + 1
            r = ceil(rand*N);
        end
        
        network(network(1,i)+3,i) = r;    %Link the persons to eachoter
        network(network(1,r)+3,r) = i;
        network(1,i) = network(1,i) +1;    %Increase the persons degree
        network(1,r) = network(1,r)+1;
    end
end

for i = 1:N
    while (network(1,i) ~= k)

        %Pick a random person
        r = ceil(rand*N);
        %If the picked person already has k neighbours or
        %if it picks itself or q and r are already connected
        temp = 0;
        while (network(1,r) == k || r == i || ismember(i,network(3:network(1,r)+2,r)))
            temp = temp + 1
            r = ceil(rand*N);
            if temp > N
                break
            end
            
        end
        if temp > N*10
            break
        end

        network(network(1,r)+3,r) = i;   %Link the perons to eachother
        network(network(1,i)+3,i) = r;
        network(1,r) = network(1,r)+1;   %Increase the degree of the persons
        network(1,i) = network(1,i)+1;
    end
end
%Add a cooperator
cooperator_pick=ceil(rand()*N);
network(2,cooperator_pick)=1;
end