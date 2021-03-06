%% plots
%Plot individual workspaces, choose color for value of k
%color = [0      0.4470 0.7410];   % blue   k = 2
%color = [0.8500 0.3250 0.0980];   % orange k = 3
%color = [0.6350 0.0780 0.1840];   % red    k = 4 
%color = [0.9290 0.6940 0.1250];   % yellow k = 6 
%color = [0.4940 0.1840 0.5560];   % purple k = 8
color = [0.4660 0.6740 0.1880];   % green  k = 10

hold on
plot(bvals/(c),fixvector,'.','markersize',35,'color',color);%Plots the fixation probability against b/c
plot(k,0.01,'x','markersize',25,'color',color,'LineWidth',1.5)%Plot position of 0.01 vs k
plot(0:0.1:20,0.01*ones(length(0:0.1:20)),'-. k','markersize',1); %Line at 0.01
set(gca,'fontsize',20)
axis([0 20 0.002 0.015])
