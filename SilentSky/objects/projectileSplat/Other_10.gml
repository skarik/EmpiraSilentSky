// Hit collision
instance_create( x,y, splatterBase );
delete(this);

// Create hit sound
var sound_hit = sound_play_at(x,y, Sound_Step(BLOOD_GOO));

