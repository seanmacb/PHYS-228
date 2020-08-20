clear

format long

x = (-3:0.01:3);
y = quart(x);

plot(x,y);
grid minor;
xlim([-2 2]);

% Question 1 - Roots at ~-1.36 and 1

functionname = 'quart';

leftbound = -2;
rightbound = -1;
tolerance = 0.0000001;

biroot1 = bisect(leftbound,rightbound,functionname,tolerance);

secroot1 = secmet(leftbound,rightbound,functionname,tolerance);

leftbound = 0;
rightbound = 2;

biroot2 = bisect(leftbound,rightbound,functionname,tolerance);

secroot2 = secmet(leftbound,rightbound,functionname,tolerance);

% Question 2 - Roots are given as secroot1, secroot2, biroot1, and biroot2.
% Roots of 1 and ~-1.3532

% Question 3 - Solved algebraically in picture I attached. Ends up being
% about 289.579666 kelvin or 16.429666 celsius or 61.5733988 Fahrenheit,
% which seems pretty reasonable.

clear

tolerance = 10^-10;

functionname = 'netfunc';

biroot1 = bisect(0,3000,functionname,tolerance);

% Question 4 - Above! Gets 289.5797 which is damn close to 289.579666

secroot1 = secmet(0,500,functionname,tolerance);

% Question 5 - Above! 0 to 3000 returns NaN, meaning net(0) and net(3000)
% are of the same sign. This means not only that its finding the right root
% when i use the right bounds (289.5797), but the secant function is 
% returning the right values when it is given invalid bounds! Woohoo!

clear

temp = (200:0.05:330);
alb = albedo(temp);

plot(temp,alb);
grid minor;
ylim ([0 1]);
xlim([200 330]);

% Question 6 - Does what you said it should do. Pretty weird graph though.
% I dig it.

netenergy = newnetfunc(temp);

plot(temp,netenergy)
grid minor;
xlim([200 330]);

% Question 7 - Pretty neat graph. Roots we care about are near ~234 and
% ~286 degrees kelvin. Other root is ~265.

clear

funcname = 'newnetfunc';
tolerance = 50;

secroot1 = secmet(230,240,funcname,tolerance);
secroot2 = secmet(286.51417,286.51418,funcname,tolerance);
secroot3 = secmet(264.811,264.812,funcname,tolerance); % The other root we dont care about

% Question 8 - With a tolerance within 50 joules was getting reliable
% results. secroot1 and secroot2 are the ones we care about here. Was tring
% for better results, but my computer started to sound like a plane taking
% off.

clear

temp = (0:0.05:500);
netenergy = newnetfunc(temp);

plot(temp,netenergy)
grid minor

leftlim = 215;
rightlim = 217;

tolerance = 100;

funcname = 'newnetfunc';

secroot = secmet(leftlim,rightlim,funcname,tolerance);

% Question 9 - Okay, so this one was just a matter of going into newnetfunc
% and changing s0. For s0 = 2500, there was only one stable state, at
% ~342.6 degrees. At s0 = 1000, it also only had one stable energy state,
% at ~216. I then used the secant method. 
% For s0 = 2500, the root was at 342.6113 degrees kelvin
% For s0 = 1000, the root was at 216.6864 degrees kelvin