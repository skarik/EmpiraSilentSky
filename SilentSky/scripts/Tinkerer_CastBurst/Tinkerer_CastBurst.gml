
// Create a shock flash effect
instance_create(x, y - 32, fxPlayerShockFlash);

// Create a buncha ground sparks
var step_shock;
step_shock = instance_create(x - 36,y, fxSparksG0);
step_shock.image_xscale = image_xscale;
step_shock = instance_create(x - 8,y, fxSparksG0);
step_shock.image_xscale = image_xscale;
step_shock = instance_create(x + 8,y, fxSparksG0);
step_shock.image_xscale = -image_xscale;
step_shock = instance_create(x + 36,y, fxSparksG0);
step_shock.image_xscale = -image_xscale;
