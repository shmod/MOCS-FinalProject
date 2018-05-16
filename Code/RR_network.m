function network = RR_network(k,N)

network = random_regular_network(k,N);
while network == 10*N
    network = random_regular_network(k,N);
end

end

