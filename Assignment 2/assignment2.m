clear

format long

circx=[]; % Making a circle, this will get plotted later
circy=[];

for a = 1:1:2*pi*100+1
    circx(a) = sin(a/100);
    circy(a) = cos(a/100);
end

circx=rot90(circx);
circy=rot90(circy);

plot(circx,circy);

fname = "coastlines.mat";

load(fname);

plot (coastlon,coastlat);

xlim ( [-180 180]);
ylim ( [-90 90]);
xlabel Longitude ; 
ylabel Latitude ; 

% Question 1 above

[x,y,z] = polarConv(coastlat,coastlon);

q3x=x;
q3y=y;
q3z=z;
q3x(q3z<0)=NaN;
q3y(q3z<0)=NaN;

plot (q3x,q3y);

% Question 2 and 3 above

q4x=x;
q4y=y;
q4z=z;
xlam = -25; %The amounts rotated in each direction
ylam = 35;
zlam = 45;
[q4x,q4y,q4z] = rotate(xlam,ylam,zlam,q4x,q4y,q4z);

q4x(q4z<0)=NaN;
q4y(q4z<0)=NaN;
q4z(q4z<0)=NaN;

plot(q4x,q4y);

% Question 4 above

[file,date,lat,lon,ocean,prof_type,institution,date_update] = ...
textread('ar_index_global_prof.txt','%s%n%n%n%c%s%s%n',...
'headerlines',9,'delimiter',',');

% Question 5 - The text file is a .csv (that's why the delimiter is ',')
% The first parameter is the filename ('ar_index_global_prof_sample.txt')
% 9 denotes the number of headerlines (one more than the number of data we
% read in)
% The '%s%n%n%n%c%s%s%n' gives the types of data that is read in to the
% header lines

% Question 7 in this little blurb above

lat(date<20180909000000) = NaN;
lon(date<20180909000000) = NaN;

lat(abs(lat)>90) = NaN;
lon(abs(lat)>90) = NaN;
lat(abs(lon)>180) = NaN;
lon(abs(lon)>180) = NaN;

% Question 7 is the latitude and longitude filter here

[q6x,q6y,q6z] = polarConv(lat,lon) ;
[q6x,q6y,q6z] = rotate(xlam,ylam,zlam,q6x,q6y,q6z);

q6x(q6z<0) = NaN;
q6y(q6z<0) = NaN;
q6z(q6z<0) = NaN;

plot(q4x,q4y,q6x,q6y,'.');

% Question 6 - dates read as a single integer - the first four characters
% are year, the next two are month, the next two are day, the next two are
% hours, the next two are minutes, the next two are seconds. The date
% 20180909000000 is midnight ten days before sep 19th, or sep 9th at
% midnight.

hold all 
plot(q4x,q4y,'color','black')
plot(circx,circy,'color','black')
plot(q6x,q6y,'.','color','blue')
title ("Positions of floats over the past 10 days")
axis equal

% Question 8 above