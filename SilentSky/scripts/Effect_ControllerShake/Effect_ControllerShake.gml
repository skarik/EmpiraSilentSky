/// @description Effect_ControllerShake(magnitude,length,fade)
/// @param magnitude
/// @param length
/// @param fade

var screenshake = inew(fxControllershake);
screenshake.magnitude   = argument0;
screenshake.life    = argument1;
screenshake.maxlife = argument1;
screenshake.fade    = argument2;
return screenshake;
