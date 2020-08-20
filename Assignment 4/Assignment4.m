clear

format long

q2time = [0.1,0.05,0.01,0.005,0.001,0.0005,0.0001,0.00005,0.00001];
q2deltaE = [26.711523066347713,5.086947184356111,0.081091792385606,0.030854868839048,0.005032289565632, ...
    0.002454596789193,4.814002366086076*10^-4,2.401122567588510*10^-4,4.792866718424799*10^-5];

q4time = [0.1,0.05,0.01,0.005,0.001,0.0005,0.0001,0.00005,0.00001];
q4deltaE =[3.131611343511892e-05,0.001913030510350,1.959860887134485e-04,1.101304552511354e-04, ...
    1.974675047219931e-05,9.988647818967578e-06,1.974495163530043e-06,9.872381793243901e-07,1.974460659345811e-07];

g=9.8;
L=1;
delt=0.01; % Delta t value

t=0;
v=0;
s=0.1;
sinit = s;
th = theta(s,L);
E = energy(v,g,L,th);

slist =[];
vlist = [];
elist = [];
sanalist = [];
tlist =[];

count = 1;

slist(count) = s;
vlist(count) = v;
tlist(count) = t;
elist(count) = E;
sanalist(count) = anapos(g,L,t,sinit);

count = count+1;

while t<10
    tnew = t+delt;
    snew = s+v*delt;
    vnew = v+delt*(-g*sin(theta(s,L))); % used snew here for second half of assignment
    Enew = energy(v,g,L,theta(s,L)); % Used vnew and snew here for second half of assignment
    slist(count) = snew;
    vlist(count) = vnew;
    tlist(count) = tnew;
    elist(count) = Enew;
    sanalist(count) = anapos(g,L,tnew,sinit);
    
    v=vnew;
    s=snew;
    t=tnew;
    
    count = count+1;
end

plot(tlist,slist,tlist,sanalist) % Position graph here
xlabel("Time");
ylabel("Position (m)");
grid on

% plot(tlist,elist); % Energy graph here
xlabel("Time");
ylabel("Energy (J)");
grid on

% Question 1 - above. Gains energy over time (not conserved) and amplitude increases over
% time

% loglog(q2time,q2deltaE,'-s','Linestyle','none');
grid on;
xlabel ('Timestep (s)');
ylabel ('E_f - E_i');

% disp(elist(end)-elist(1)) % Use this to display final-initial values

% Question 2 - above. Done by changing delt value to whatever you want
% delta t to equal. Defined in array at top after noting values for each
% one. 

% Question 3 - When s gets bigger than pi, it means that the pendulum has 
% swung over the top of itself and in a complete circle. I could image some 
% programming problems coming from this with the pendulum either falling under 
% gravity (if the code was super accurate) or potentially going in a circle 
% forever, which i would expect the approximation to do because it's and 
% approximation and it's somewhat dumb. 

% Question 4 - I simply used my code from above and changed s in the vnew
% term to snew and s in the enew to snew.
% Q1 - Very closely follows analytical solution for position with a small delta t. Near perfect (emphasis on
% near).
% For energy, it sinusoidally increases and decreases around the total
% energy value, instead of increasing indefinitely. So a *little* better
% Q2 - graph below

% loglog(q4time,q4deltaE,'-s','Linestyle','none');
grid on;
xlabel ('Timestep (s)');
ylabel ('E_f - E_i');


% Question 5
% 
% For s0 = 0.4
% The position graph shows the period is ~2.0275s, while the analytical
% solution shows 2s exactly. Follows the analytical solution closely in terms of everything else,
% as amplitude is the same. Periods are slightly out of phase.
% The energy graph again sinusoidally oscillates around the inital energy
% value of ~0.77355 with an amplitude of 0.001. Not much fluctuation.
% 
% For s0 = 1
% The position graph shows that the periods are getting a little more out
% of phase, but amplitude is still the same.
% The energy graph sinusoidally oscillates around the initial value of
% ~4.5058 with an amplitude of 0.005. Not much fluctuation.
%
% For s0 = 2
% The position graph shows the periods out of phase by a significant amount
% versus the analytical solution
% The energy graph is sinusoidally fluctuating around the initial value
% with an amplitude of ~0.01
%
% For s0 = 3.12
% The position graph shows the periods completely out of phase versus the
% analytical solution. Wow.
% The energy graph is weird. Looks almost like an inverse tangent  or continuous tangent wave.
% Amplitude of ~0.03