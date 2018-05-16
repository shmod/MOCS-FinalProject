%Random network

function network = random_regular_network(k,N)
network = [];
network=zeros(k+2,N);
%Links the first two persons to eachother
network(1,1:2) = 1;
network(3,1) = 2;
network(3,2) = 1;

for i = 3:N     %Connects everyone to an already connected random person
    r = ceil(rand*(i-1));
    while network(1,r) == k || r == i
        r = ceil(rand*N);
    end
    network(3,i) = r;    %Link the persons to eachoter
    network(network(1,r)+3,r) = i;
    network(1,i) = 1;    %Increase the persons degree
    network(1,r) = network(1,r)+1;
end
b = 0;
while sum(network(1,:))/N<k     %Connects persons until average degree is k
    c = 0;
    r = ceil(rand*N);
    while network(1,r) == k
        r = ceil(rand*N);
        if c>=N*10
            network = c;
            return
        end
    end
    q = ceil(rand*N);
    while r == q || network(1,q) == k     %Get onother q if its the same as r
        q = ceil(rand*N);
        c = c+1;
        if c>=N*10
            network = c;
            return 
        end
    end
    %Connects persons at random
    if ismember(q,network(3:network(1,r)+2,r)) == 0  %Checks if q and r is not already connected
        network(network(1,r)+3,r) = q;   %Link the perons to eachother
        network(network(1,q)+3,q) = r;
        network(1,r) = network(1,r)+1;   %Increase the degree of the persons
        network(1,q) = network(1,q)+1;
    end
    if b>=N*10
        network = b;
        return
    end
    b = b+1;
end
%Add a cooperator
cooperator_pick=ceil(rand()*N);
network(2,cooperator_pick)=1;
end