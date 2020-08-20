% A function describing planetary albedo as a function of temperature.
function a = albedo(T)
a_min = .250;
a_max = .7;
T_min = 258;
T_max = 318;

a = zeros(size(T));

a = a_max - (a_max-a_min) * sqrt((sin((T-T_min)*(pi/2)/(T_max-T_min))));

a(T < T_min) = a_max;
a(T > T_max) = a_min;

end