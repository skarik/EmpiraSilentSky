var ground_type = Motion_CommonGroundtype();
        
var step_sound = sound_play_at( x,y, Sound_Step(ground_type) );
    step_sound.pitch = random_range(1.2,1.4);
    step_sound.gain = random_range(0.8,1.0);
var step_fx = instance_create( x,y, Effect_Step(ground_type) );
    step_fx.image_xscale = image_xscale;

// Create some sparks if we're the tinkerer
if (object_index == objPlayerTinkerer && chMana > 5)
{
    var step_shock = instance_create(x,y, fxSparksG0);
        step_shock.image_xscale = image_xscale;
}

