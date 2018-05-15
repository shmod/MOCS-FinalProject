%Lattice 4 and 8

function network= lattice_8_network(N);

network= zeros(8+2,N);


%inner bounds of lattice
for i=2+sqrt(N):sqrt(N):N-1-sqrt(N)
    
    for j=0:sqrt(N)-3
        network(:,i+j)=[8 0 i+j-sqrt(N)-1 i+j-sqrt(N) i+j-sqrt(N)+1 ...
            i+j-1 i+j+1 i+j+sqrt(N)-1 i+j+sqrt(N) i+j+sqrt(N)+1]';

    end
end

%Corners
%upper left
network(:,1)=[2 0 2 1+sqrt(N) 1+sqrt(N)+1 0 0 0 0 0]';
%upper right
network(:,sqrt(N))=[2 0 sqrt(N)-1 sqrt(N)*2 sqrt(N)*2-1 0 0 0 0 0]';
%Down left
network(:,N-sqrt(N)+1)=[2 0 N-2*sqrt(N)+1 N-2*sqrt(N)+2 N-sqrt(N)+2 0 0 0 0 0]';
%Down right
network(:,N)=[2 0 N-1 N-sqrt(N) N-sqrt(N)-1 0 0 0 0 0]';

%Top row
for i=2:sqrt(N)-1
    network(:,i)=[2 0 i-1 i+sqrt(N)-1 i+sqrt(N) i+sqrt(N)+1 i+1 0 0 0]';
end

%Bottom row
for i=N-sqrt(N)+2:N-1
    network(:,i)=[2 0 i-1 i-sqrt(N)-1 i-sqrt(N) i-sqrt(N)+1 i+1 0 0 0]';
end

%Left column
for i=1+sqrt(N):sqrt(N):N-2*sqrt(N)+1;
    network(:,i)=[2 0 i+1 i-sqrt(N) i-sqrt(N)+1 i+sqrt(N) i+sqrt(N)+1 0 0 0]';
end

%Right column
for i=sqrt(N)*2:sqrt(N):N-sqrt(N);
    network(:,i)=[2 0 i-1 i-sqrt(N) i-sqrt(N)-1 i+sqrt(N) i+sqrt(N)-1 0 0 0]';
end


cooperator=ceil(rand()*N);
network(2,cooperator)=1;

end
