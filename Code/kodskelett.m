clear all
close all
N = 100;        %Population size
reps = 100000;    %Number of simulations
c = 1;          %c is aarbitrary number. Easiest if set to one
w = 0.01;       %Weak selection
k = 2;          %Degree of the network
brange = 1.8:0.05:2.2;
fixvector = zeros(1,length(brange));
p = 1;

for b = brange    %Runs for different b
    fix = 0;           %Integer to save number of times all people becomes cooperators
    counter = 0;
    parfor j = 1:reps;
        network = cycle_network(k,N); % 1 = Cooperator, 0 = Defector
        
        while sum(network(2,:))>0 && sum(network(2,:))<N  %Runs until its fixated
            fitness = zeros(1,2);  % fitness of neighbouring nodes, 1 = defectors, 2 = contributors
            r = ceil(rand*N); % randomly selected person that dies in the death-birth cycle
            network(2,r) = 0; % random person is removed and replaced with a temp defector
            
            for i = 3:network(1,r)+2 % loop over neighboring nodes
                temp = network(i,r); % index of neighbour
                payoff = 0;
                for l = 3:network(1,temp)+2 % loop over neighbours neighbours
                    payoff = payoff + b*network(2,network(l,temp));
                end
                payoff = payoff -network(1,temp)*network(2,temp)*c;
                fitness(network(2,temp)+1) = fitness(network(2,temp)+1) + 1-w + w*payoff; 
            end
            
            Fc = fitness(2);
            Fd = fitness(1);
            if rand<Fc/(Fc+Fd)  %Makes the new person a cooperator with probability Fc/(Fc+Fd)
                network(2,r) = 1;
            end
            counter = counter +1;
        end
        if sum(network(2,:)) == N  %Checks if its fixated for cooperators
            fix = fix+1;
        end
    end
    counter = counter /reps;
    counter
    fixvector(p) = fix/reps;
    p = p+1;
end
plot(brange/c,fixvector,'bx');  %Plots the fixation probability against b/c