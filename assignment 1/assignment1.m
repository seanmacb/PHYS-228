format long

fname = 'blue_hills_temperature.tsv';
name='blue_hills_temperature';

load(fname)

temperature = blue_hills_temperature(:,3);
months = blue_hills_temperature(:,1);

% Question 1 - blue_hills_temperature is a 2055 row by 3 column matrix,
% with the first column corresponding to months since 1960, and the third
% column corresponding to celsius temperature. The 2nd column seems
% irrelevant


years = 1960+(months)/12;
fartemp = temperature*(9/5)+32;

plot(years,temperature)
xlabel('Year');
ylabel('Temperature (Celsius)');
title('Temperature at Blue Hills 1836-2006');
grid on;

% Question 2 above

xlim([(2.006208333333333e+03)-10 2.006208333333333e+03]);

% Question 3 - You can see a sinusoidal pattern of temperature from year to
% year

%%% PART TWO %%% - ignore until next week.

jancycle= temperature(1:12:end);
febcycle= temperature(2:12:end);
marcycle= temperature(3:12:end);
aprcycle= temperature(4:12:end);
maycycle= temperature(5:12:end);
juncycle= temperature(6:12:end);
julcycle= temperature(7:12:end);
augcycle= temperature(8:12:end);
sepcycle= temperature(9:12:end);
octcycle= temperature(10:12:end);
novcycle= temperature(11:12:end);
deccycle= temperature(12:12:end);

janave=mean(jancycle);
febave=mean(febcycle);
marave=mean(marcycle);
aprave=mean(aprcycle);
mayave=mean(maycycle);
junave=mean(juncycle);
julave=mean(julcycle);
augave=mean(augcycle);
sepave=mean(sepcycle);
octave=mean(octcycle);
novave=mean(novcycle);
decave=mean(deccycle);

jananom=janave-jancycle;
febanom=febave-febcycle;
maranom=marave-marcycle;
apranom=aprave-aprcycle;
mayanom=mayave-maycycle;
junanom=junave-juncycle;
julanom=julave-julcycle;
auganom=augave-augcycle;
sepanom=sepave-sepcycle;
octanom=octave-octcycle;
novanom=novave-novcycle;
decanom=decave-deccycle;

anomaly = [];

for a = 1:length(aprcycle);
    anomaly(12*a-11)=jananom(a);
    anomaly(12*a-10)=febanom(a);
    anomaly(12*a-9)=maranom(a);
    anomaly(12*a-8)=apranom(a);
    anomaly(12*a-7)=mayanom(a);
    anomaly(12*a-6)=junanom(a);
    anomaly(12*a-5)=julanom(a);
    anomaly(12*a-4)=auganom(a);
    anomaly(12*a-3)=sepanom(a);
    anomaly(12*a-2)=octanom(a);
    anomaly(12*a-1)=novanom(a);
    anomaly(12*a)=decanom(a);
end

anomaly(2053)=jananom(end);
anomaly(2054)=febanom(end);
anomaly(2055)=maranom(end);

anomaly=rot90(anomaly);

plot(years, anomaly)
xlabel('Year');
ylabel('Temperature Anomaly (Celsius)');
title('Temperature Anomaly at Blue Hills 1836-2006');
grid on;

% Question 1 - Had to hard code it in, but it worked!!

moveaverage = [];
count=0;
sumstart = 0;

for a = 1:60
    count=count+1;
    sumstart=sumstart+anomaly(a);
    moveaverage(a)=sumstart/count;
end


for a = 61:1995
   moveaverage(a)=mean(anomaly(a-60:a+60));
end


for a = 1996:2055
    moveaverage(a)=mean(anomaly(a-60:end));
end

moveaverage=-rot90(moveaverage);

plot(years,moveaverage)
xlim ([1820 2020])
ylim ([-3 3])
xlabel('Year');
ylabel('Temperature Anomaly Running Average (10 Year) (Celsius)');
title('10 Year Temperature Anomaly Running Average at Blue Hills 1836-2006');
grid on;

% Question 2 - Over large periods of time, seeing the general upward trend
% of the temperature anomaly. Especially from 2000 to present

% Question 3 - I took the values at 1900 and 2000, and the change in
% temperature per century was ~1.3 degrees celsius per century

load("aires.tsv")

airesmonths=aires(:,1);
airestemp=aires(:,3);
airesyears = 1960+(airesmonths)/12;

plot(airesyears,airestemp)
xlabel('Year');
ylabel('Temperature (Celsius)');
title('Temperature at Buenos Aires 1856-1991');
grid on;

airjancycle = airestemp(1:12:end);
airfebcycle = airestemp(2:12:end);
airmarcycle = airestemp(3:12:end);
airaprcycle = airestemp(4:12:end);
airmaycycle = airestemp(5:12:end);
airjuncycle = airestemp(6:12:end);
airjulcycle = airestemp(7:12:end);
airaugcycle = airestemp(8:12:end);
airsepcycle = airestemp(9:12:end);
airoctcycle = airestemp(10:12:end);
airnovcycle = airestemp(11:12:end);
airdeccycle = airestemp(12:12:end);

airjanave=mean(airjancycle);
airfebave=mean(airfebcycle);
airmarave=mean(airmarcycle);
airaprave=mean(airaprcycle);
airmayave=mean(airmaycycle);
airjunave=mean(airjuncycle);
airjulave=mean(airjulcycle);
airaugave=mean(airaugcycle);
airsepave=mean(airsepcycle);
airoctave=mean(airoctcycle);
airnovave=mean(airnovcycle);
airdecave=mean(airdeccycle);

airjananom=airjanave-airjancycle;
airfebanom=airfebave-airfebcycle;
airmaranom=airmarave-airmarcycle;
airapranom=airaprave-airaprcycle;
airmayanom=airmayave-airmaycycle;
airjunanom=airjunave-airjuncycle;
airjulanom=airjulave-airjulcycle;
airauganom=airaugave-airaugcycle;
airsepanom=airsepave-airsepcycle;
airoctanom=airoctave-airoctcycle;
airnovanom=airnovave-airnovcycle;
airdecanom=airdecave-airdeccycle;

airanom=[]

for a = 1:length(airnovcycle)
    airanom(12*a-11) = airjananom(a);
    airanom(12*a-10) = airfebanom(a);
    airanom(12*a-9) = airmaranom(a);
    airanom(12*a-8) = airapranom(a);
    airanom(12*a-7) = airmayanom(a);
    airanom(12*a-6) = airjunanom(a);
    airanom(12*a-5) = airjulanom(a);
    airanom(12*a-4) = airauganom(a);
    airanom(12*a-3) = airsepanom(a);
    airanom(12*a-2) = airoctanom(a);
    airanom(12*a-1) = airnovanom(a);
    airanom(12*a) = airdecanom(a);
end

airanom(1621)=airjananom(end);
airanom(1622)=airfebanom(end);
airanom(1623)=airmaranom(end);
airanom(1624)=airapranom(end);
airanom(1625)=airmayanom(end);
airanom(1626)=airjunanom(end);
airanom(1627)=airjulanom(end);
airanom(1628)=airauganom(end);
airanom(1629)=airsepanom(end);
airanom(1630)=airoctanom(end);

airanom=rot90(airanom);

plot(airesyears, airanom)
xlabel('Year');
ylabel('Temperature Anomaly (Celsius)');
title('Temperature Anomaly at Buenos Aires 1856-1991');
grid on;

airmoveaverage = [];
aircount=0;
airsumstart = 0;

for a = 1:60
    aircount=aircount+1;
    airsumstart=airsumstart+airanom(a);
    airmoveaverage(a)=airsumstart/aircount;
end


for a = 61:1569
   airmoveaverage(a)=mean(airanom(a-60:a+60));
end


for a = 1570:length(airanom)
    airmoveaverage(a)=mean(airanom(a-60:end));
end

airmoveaverage=-rot90(airmoveaverage);

plot(airesyears,airmoveaverage)
xlim ([1850 1995])
ylim ([-1.5 1.5])
xlabel('Year');
ylabel('Temperature Anomaly Running Average (10 Year) (Celsius)');
title('10 Year Temperature Anomaly Running Average at Buenos Aires 1856-1991');
grid on;

% Question 4 - Generated graphs for Buenos Aires