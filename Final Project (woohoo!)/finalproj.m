clear

% The program below shows how an ecosystem with 2 predators

L=500; % The size of the island
dx = 1; % 
tend = 100;
del_t = 0.1;
timevec = 0:del_t:tend;
distvec = 0:dx:L; % initial values, these produce the most interesting results! (if you ask me)

predposvec = zeros(tend/del_t,L/dx);
preyposvec = zeros(tend/del_t,L/dx);
predcount = zeros(tend/del_t,1);
preycount = zeros(tend/del_t,1); % initializing all the matrices

d_rate = 2; % death rate of foxes
pred_diff = 1.5; % diffusion rate of predators
prey_diff = .8; % diffusion rate of prey

preyposvec(1,245) = 2000; % initial conditions for matrices
predposvec(1,255) = 200; % Feel free to modify these two lines to mess around with the initial conditions for this program!
preycount(1) = counter(preyposvec(1,:),L/dx);
predcount(1) = counter(predposvec(1,:),L/dx);

for i = 2:tend/del_t+1 % time loop, increasing in time as you go down the rows
    for j = 1:L/dx % position loop, increasing in position as you move to the right
        if j~=1 && j~=L/dx
            ddprey_dzz = (preyposvec(i-1,j+1)+preyposvec(i-1,j-1)-2*preyposvec(i-1,j))/dx^2 ; % second derivative of prey position
            ddpred_dzz = (predposvec(i-1,j+1)+predposvec(i-1,j-1)-2*predposvec(i-1,j))/dx^2 ; % second derivative of predator position
        else
            if j==1
                ddprey_dzz = (preyposvec(i-1,j+1)-2*preyposvec(i-1,j))/dx^2 ;
                ddpred_dzz = (predposvec(i-1,j+1)-2*predposvec(i-1,j))/dx^2 ;
            else
                ddprey_dzz = (preyposvec(i-1,j-1)-2*preyposvec(i-1,j))/dx^2 ;
                ddpred_dzz = (predposvec(i-1,j-1)-2*predposvec(i-1,j))/dx^2 ;
            end
        end        
        preyposvec(i,j) = preyposvec(i-1,j) + del_t*(prey_diff*ddprey_dzz+preyposvec(i-1,j)*(1-predposvec(i-1,j))); % calculating the predator and prey at each location
        predposvec(i,j) = predposvec(i-1,j) + del_t*(pred_diff*ddpred_dzz+predposvec(i-1,j)*(preyposvec(i-1,j)-d_rate));
        if preyposvec(i,j)<0 % some error checking here
            preyposvec(i,j) = 0;
        end
        if predposvec(i,j)<0
            predposvec(i,j) = 0;
        end
    end
    preycount(i) = counter(preyposvec(i,:),L/dx); % counting the total population in 
    predcount(i) = counter(predposvec(i,:),L/dx);
end

% ALL PLOTS BELOW!

semilogy(timevec,predcount) % Plot of the amount of predators in the ecosystem and how it changes over time
xlabel ('Time')
ylabel ('Number of predators in ecosystem')
title('Predator Population on a one dimensional island vs. Time')

semilogy(timevec,preycount) % Plot of the amount of prey in the ecosystem and how it changes over time
xlabel ('Time')
ylabel ('Number of prey in ecosystem')
title('Prey Population on a one dimensional island vs. Time')

for i=1:tend/del_t  % A loop that shows how the ecosystem evolves over time
    plot(1:L/dx,preyposvec(i,:),1:L/dx,predposvec(i,:))
    xlabel ('Position (m)')
    ylabel ('Animal Population')
    legend('Prey','Predators')
    title('Animal Population on a one dimensional island vs. Time')
    drawnow
    pause(0.02)
end

semilogy(timevec,preycount,timevec,predcount) % Plot of the amount of animals (both pred and prey) in the ecosystem and how it changes over time
xlabel ('Time')
ylabel ('Number of animals in ecosystem')
legend('Prey','Predators')
title('Animal Population on a one dimensional island vs. Time')