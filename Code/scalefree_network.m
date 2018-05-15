%scale free network for last project
function network = scalefree_network(k,N)
k=k/2;
%k must be even...
network=[];

% First row of the network is  the degree of linkage
% Second row tells if it is a  cooperator or a defector
% zero for defector which is initiated for all
% one for cooperator

%We first add two defectors linked to each other
network(1:2)=1;
network(3,1)=2;
network(3,2)=1;


for j=3:N
    new_friends = zeros(2,k); %Vecor to avoid linkage to same person
    
    %If k is larger or equal to j we cant avoid linkage to same person
    if (k >= j)
        k2 = j-1;
    else
        k2 = k;
    end
    
    %Add k2 number of links for each person
    for q = 1:k2
    
    pick=rand();
    pick_check=pick;
    choice_barrier=0; %init barrier which the random number shall not exceed
    sum_of_degree=sum(network(1,:));
    person=0;
    
    while pick==pick_check
        %Step through persons in the network
        person=person+1;
        %Add a fraction of all links depending on the link of current
        %person, to the choicebarrier
        choice_barrier = choice_barrier + network(1,person)...
            / sum_of_degree;
        %Check if choice barrier exceeds the pick 
        if pick < choice_barrier
            pick=person;
        end
    end
            
    network(1,pick)=network(1,pick)+1;   %Add  one to the degree of pick
    network(network(1,pick)+2, pick)=j;  %Put the index in its column
    network(q+2,j)=pick;     %The linkage to the pick is put in its column
    
    %Save the pick and the linkage of the pick in new friends
    new_friends(1,q) = pick;
    new_friends(2,q) = network(1,pick);
    network(1,pick)=0; %Set linkage of pick to zero to avoid same links
    end
    network(1,j)=q;        %The new person gets degree q=k2
    %Put all the picks back to the network
    for q=1:k2
        network(1,new_friends(1,q))=new_friends(2,q);
    end
end

%Lastly we add a cooperator into the system

cooperator_pick=ceil(rand()*N);
network(2,cooperator_pick)=1;

%plot a histogram 
% hist(network(1,:), 1:max(network(1,:)));
%  xlim([0.5 12]);
%  title('Distribution of degree within network');
%  xlabel('Degree');
%  ylabel('number of people');
end