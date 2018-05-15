%Lattice 4 and 8

function network= lattice_4_network(N);

network= zeros(4+2,N);


%inner bounds of lattice
for i=2+sqrt(N):sqrt(N):N-1-sqrt(N)
    
    for j=0:sqrt(N)-3
        
        network(1,i+j)=4;
        network(3,i+j)=i+j-1;
        network(4,i+j)=i+j+1;
        network(5,i+j)=i+j-sqrt(N);
        network(6,i+j)=i+j+sqrt(N);

    end
end

%Corners
%upper left
network(:,1)=[2 0 2 1+sqrt(N) 0 0]';
%upper right
network(:,sqrt(N))=[2 0 sqrt(N)-1 sqrt(N)*2 0 0]';
%Down left
network(:,N-sqrt(N)+1)=[2 0 N-2*sqrt(N)+1 N-sqrt(N)+2 0 0]';
%Down right
network(:,N)=[2 0 N-1 N-sqrt(N) 0 0]';

%Top row
for i=2:sqrt(N)-1
    network(:,i)=[2 0 i-1 i+sqrt(N) i+1 0]';
end

%Bottom row
for i=N-sqrt(N)+2:N-1
    network(:,i)=[2 0 i-1 i-sqrt(N) i+1 0]';
end

%Left column
for i=1+sqrt(N):sqrt(N):N-2*sqrt(N)+1;
    network(:,i)=[2 0 i+1 i-sqrt(N) i+sqrt(N) 0]';
end

%Right column
for i=sqrt(N)*2:sqrt(N):N-sqrt(N);
    network(:,i)=[2 0 i-1 i-sqrt(N) i+sqrt(N) 0]';
end


cooperator=ceil(rand()*N);
network(2,cooperator)=1;

end
