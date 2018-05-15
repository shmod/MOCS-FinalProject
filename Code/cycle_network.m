function network= cycle_network(k,N)

%cycle network for last project
%k must be even...

network=zeros(k+2,N);
network(1,:) = ones(1,N)*k;

x=0:N-1;

for j=1:k/2
    network(2+j,:)=mod(x+j,N)+1;
    network(2+j+k/2,:)=mod(x-j,N)+1;
end

%Lastly we add a cooperator into the system

cooperator_pick=ceil(rand()*N);
network(2,cooperator_pick)=1;

end
