clear
format long

% READ - there is a problem with the dx in this program. Whenever I change
% dx or dt, it results in the program getting thrown out of whack

x=10;
L=50;
v=0.31968;
dx = 0.1;
delt = 0.01; %0.8 as both values works
distance = -50:dx:50-dx;
tfin = 100;
dlength = 2*L/dx;
tlength = tfin/delt;
temp = zeros(1,dlength);
horncount = zeros(1,dlength);

disp(v*delt/dx)

% initializing everything
for i=1:2*L/dx
    if (i>(L-x)/dx && i<(L+x)/dx)
        temp(i)=1200;
    else
        temp(i)=50;
    end
end

plot(distance,temp) % initial graph

for i=1:tlength-1
    for j=2:dlength-1
        temp(i+1,j) = ((v*delt)/(dx^2))*(temp(i,j-1)-2*temp(i,j)+temp(i,j+1))+temp(i,j);
        if temp(i,j)<50
            temp(i,j) = 50;
        end
        if temp(i,j)>=500
            horncount (j) = 1;
        end
        temp(:,end) = 50;
        temp(:,1) = 50;
    end
temp(end,1) = 50;
temp(end,end) = 50;
end
tlast = temp(end,:);

% hornblende stuff below
hornn=0;
for i = 1:dlength
    if horncount(i) ==1
        hornn=hornn+1;
    end
end

plot(distance,tlast,distance,temp(1,:));
ylim ([0,1250]);

hornlength = hornn*dx; % this is the width of the hornblende

deldike = 5; % how far away from the dike you are looking for the maximum temperature
tempcol = ((L-x-deldike)/dx);
maxtemp = max(temp(:,tempcol));


count = 0;
for i = 1:dlength
    if temp(i,tempcol)==maxtemp
        break
    else
        count = count +1;
    end
end

maxtime = count * delt; % this is the time when the temperature reaches a maximum

% when you double the size of the dike, the hornblende doubled (roughly
% speaking) from 12.3 to 24.1
% Hornblende size seems to double when the width of the dike is doubled.
% Direct relationship between the two
