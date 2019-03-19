// Hit collision
instance_create( x,y, splatterGoo );
delete(this);

// Create hit sound
var sound_hit = sound_play_at(x,y, Sound_Step(BLOOD_GOO));
// Create hit effect
var effect_hit = instance_create(x,y, Effect_Step(BLOOD_GOO));

