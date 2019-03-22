/// @description Combat_Damage(source,damage,bool hitparticles,bool hitfx)
/// @param source
/// @param damage
/// @param bool hitparticles
/// @param bool hitfx
var source = argument0;
var damage = argument1;
var do_hitparticles = argument2;
var do_hitfx = argument3;

// Modify damage based on armor
var actualDamage = Combat_CalculateDamage(damage);
		
// Perform damage
chHealth -= actualDamage;
        
// Generate intersecting BB for the effect spawning
var c_x1 = x-sprite_xoffset;
var c_y1 = y-sprite_yoffset;
var c_x2 = x-sprite_xoffset+sprite_width;
var c_y2 = y-sprite_yoffset+sprite_height;

// Create damage ticker
var ticker = instance_create(random_range(c_x1,c_x2), random_range(c_y1,c_y2), floaterDmgTicker);
    ticker.value = actualDamage;

if (do_hitparticles)
{
    // Create hit sound
    var sound_hit = sound_play_at(random_range(c_x1,c_x2), random_range(c_y1,c_y2), Sound_Impact(chBloodtype));
    
    // Create hit effect
    var fx_hit = instance_create(random_range(c_x1,c_x2), random_range(c_y1,c_y2), Effect_Impact(chBloodtype));
}

// Create knockback
if (source.moPlayerAvailable)
{
    // Mark as stunned
    isStunned = true;
    stunTimer = max(0, stunTimer) + (min(damage,50) * 0.015);
    // Add knockback
    var kickback = damage * 8;
    if ( abs(xspeed) < kickback || sign(xspeed) != sign(x - source.x) )
        xspeed = sign(x - source.x) * kickback * 0.5;
    // Push in the air for effect
    yspeed = -40;
}

if (do_hitfx && source.moPlayer)
{           
    // Shake the screen for effect
    Effect_ScreenShake( 3, 0.15, true );
    Effect_ControllerShake( 1.0, 0.1, true );
}
