/// @description  Combat_Hitbox(source,x1,y1,x2,y2,damage,type)
/// @param source
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param damage
/// @param type
var source = argument0;
var x1 = argument1; var y1 = argument2;
var x2 = argument3; var y2 = argument4;
var damage = argument5;
var type = argument6;

// For debug purposes, draw the bounding box of the hitbox
if (Debug.on)
{
    var dbb = new(debugBox);
        dbb.x1 = x1; dbb.y1 = y1;
        dbb.x2 = x2; dbb.y2 = y2;
        dbb.image_blend = c_gray;
}

// Perform the collision against both enemies and destroyable blox
with (bloxDestroyable)
{
    if (id != source && collision_rectangle(x1,y1,x2,y2, id, true, false) != null)
    {
        chHealth -= damage;
        
        // Generate intersecting BB for the effect spawning
        var c_x1 = max( x1, x-sprite_xoffset );
        var c_y1 = max( y1, y-sprite_yoffset );
        var c_x2 = min( x2, x-sprite_xoffset+sprite_width );
        var c_y2 = min( y2, y-sprite_yoffset+sprite_height );
        
        // Create damage ticker
        //var ticker = instance_create(random_range(c_x1,c_x2), random_range(c_y1,c_y2), floaterDmgTicker);
        //    ticker.value = damage;
        
        // Create hit sound
        var sound_hit = sound_play_at(random_range(c_x1,c_x2), random_range(c_y1,c_y2), Sound_Impact(chBloodtype));
        
        // Create hit effect
        var fx_hit = instance_create(random_range(c_x1,c_x2), random_range(c_y1,c_y2), Effect_Impact(chBloodtype));
        
         // Create knockback
        if (source.moPlayer)
        {
            // Shake the screen for effect
            Effect_ScreenShake( 2, 0.1, true );
            Effect_ControllerShake( 1.0, 0.1, true );
        }
    }
}
with (enemyBase)
{
    if (id != source && ((moTeam & source.moTeam) == 0) && collision_rectangle(x1,y1,x2,y2, id, true, false) != null)
    {
		// Modify damage based on armor
		var actualDamage = Combat_CalculateDamage(damage);
		
		// Perform damage
        chHealth -= actualDamage;
        
        // Generate intersecting BB for the effect spawning
        var c_x1 = max( x1, x-sprite_xoffset );
        var c_y1 = max( y1, y-sprite_yoffset );
        var c_x2 = min( x2, x-sprite_xoffset+sprite_width );
        var c_y2 = min( y2, y-sprite_yoffset+sprite_height );
        
        // Create damage ticker
        //var ticker = instance_create(random_range(c_x1,c_x2), random_range(c_y1,c_y2), floaterDmgTicker);
        //    ticker.value = actualDamage;
        
        // Create hit sound
        var sound_hit = sound_play_at(random_range(c_x1,c_x2), random_range(c_y1,c_y2), Sound_Impact(chBloodtype));
        
        // Create hit effect
        var fx_hit = instance_create(random_range(c_x1,c_x2), random_range(c_y1,c_y2), Effect_Impact(chBloodtype));
        
        // Mark as stunned
        isStunned = true;
        stunTimer = max(0, stunTimer) + (min(damage,50) * 0.025);
        // Add knockback
        var kickback = damage * 8;
        if ( abs(xspeed) < kickback || sign(xspeed) != sign(x - source.x) )
            xspeed = sign(x - source.x) * kickback * 0.5;
        // Push in the air for effect
        yspeed = -80;
        
        // Create knockback
        if (source.moPlayerAvailable)
        {   
            // Set on fire
            if ( isGooed )
            {
                if ( !isBurning )
                {
                    isBurning = true;
                    // Play sound
                    sound_play_at(x,y,sndFireStart);
                }
                else
                {
                    fiTimer = 0; // Refresh the burn timer
                }
            }
        }
        
        if (source.moPlayer)
        {           
            // Shake the screen for effect
            Effect_ScreenShake( 3, 0.15, true );
            Effect_ControllerShake( 1.0, 0.1, true );
        }
    }
}

