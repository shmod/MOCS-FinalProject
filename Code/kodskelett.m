clear all
close all
N = 100;        %Population size
reps =100000;    %Number of simulations
c = 1;          %c is aarbitrary number. Easiest if set to one
w = 0.01;       %Weak selection
k = 4;          %Degree of the network
change_network = 100;   %How many runs before a new network is generated
bvals = 3:0.2:5; % actual values of b used
brange = 1:1:length(bvals); % number of points to be examined
fixvector = zeros(1,length(brange));
%Bvals 1.8:0.05:2.2 for k=2
%Bvals 2.6:0.1:3.4 for k=3
%Bvals 3.6:0.1:4.4 for k=4
%Bvals 5:0.5:9 for k=6
%Bvals 7:0.5:11 for k=8
%Bvals 8:1:16 for k=10

parfor b = brange    %Runs for different b
    b_current = bvals(b); % actual value of b used in simulations (b/c = b since c = 1)
    fix = 0;           %Integer to save number of times all people becomes cooperators
    counter = 0;
    for j = 1:change_network
        samenetwork = cycle_network(k,N);  % 1 = Cooperator, 0 = Defector
        for jj = 1:reps/change_network
            network = samenetwork;
            
            while sum(network(2,:))>0 && sum(network(2,:))<N  %Runs until its fixated
                fitness = zeros(1,2);  % fitness of neighbouring nodes, 1 = defectors, 2 = contributors
                r = ceil(rand*N); % randomly selected person that dies in the death-birth cycle
                network(2,r) = 0; % random person is removed and replaced with a temp defector
                
                for i = 3:network(1,r)+2 % loop over neighboring nodes
                    temp = network(i,r); % index of neighbour
                    payoff = 0;
                    for l = 3:network(1,temp)+2 % loop over neighbours neighbours
                        payoff = payoff + b_current*network(2,network(l,temp));
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
    end
    counter = counter /reps;
    counter
    fixvector(b) = fix/reps;
end

%% plots
plot(bvals/(c),fixvector,'bx');  %Plots the fixation probability against b/c
xlabel('b')
ylabel('fixation probability')