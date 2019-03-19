var val = argument0;
var deadzone = 0.1;
return clamp(
    (abs(val)-deadzone)/(1.0-deadzone*2.0),
    0.0, 1.0 ) * sign(val);
