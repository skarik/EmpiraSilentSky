// Stop music
if ( audioMusic.targetTrack == Game.muEncounterTrack )
{
    audioMusic.targetTrack = null;
}

// Create corpse
var corpse = instance_create(x,y,corpseMonster0);
    corpse.image_xscale = image_xscale;
    
// Create goo blood
for (var i = 0; i < choose(1,2,3); ++i)
{
    var blood = instance_create(
        x - sprite_xoffset + random_range(0,sprite_width),
        y - sprite_yoffset + random_range(0,sprite_height),
        gameBlooddrop);
        blood.xspeed += random_range(-50,50);
        blood.image_blend = c_green;
}
    
delete(this);

