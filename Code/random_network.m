function network = random_network(k,N)

network = [];
network=zeros(k+2,N);
%Links the first two persons to eachother
network(1,1:2) = 1;
network(3,1) = 2;
network(3,2) = 1;

for i = 3:N     %Connects everyone to an already connected random person
   r = ceil(rand*(i-1));
   network(3,i) = r;    %Link the persons to eachoter
   network(network(1,r)+3,r) = i;
   network(1,i) = 1;    %Increase the persons degree
   network(1,r) = network(1,r)+1;
end

while sum(network(1,:))/N<k     %Connects persons until average degree is k
   r = ceil(rand*N);
   q = ceil(rand*N);
   while r == q     %Get onother q if its the same as r
       q = ceil(rand*N);
   end
   %Connects persons at random
   if ismember(q,network(3:network(1,r)+2,r)) == 0  %Checks if q and r is not already connected
       network(network(1,r)+3,r) = q;   %Link the perons to eachother
       network(network(1,q)+3,q) = r;
       network(1,r) = network(1,r)+1;   %Increase the degree of the persons
       network(1,q) = network(1,q)+1;
   end
    
end
%Add a cooperator
cooperator_pick=ceil(rand()*N);
network(2,cooperator_pick)=1;
end

