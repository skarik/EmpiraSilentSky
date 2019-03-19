/// @description  Combat_Raycast(source,x1,y1,dir,dist,damage,type)
/// @param source
/// @param x1
/// @param y1
/// @param dir
/// @param dist
/// @param damage
/// @param type
var source = argument0;
var x1 = argument1; var y1 = argument2;
var dir = argument3; var dist = argument4;
var damage = argument5;
var type = argument6;

var dx = x1 + lengthdir_x(dist,dir);
var dy = y1 + lengthdir_y(dist,dir);

// For debug purposes, draw the bounding box of the hitbox
if (Debug.on)
{
    var dbb = new(debugLine);
        dbb.x1 = x1; dbb.y1 = y1;
        dbb.x2 = dx; dbb.y2 = dy;
        dbb.image_blend = c_gray;
}

// Perform the collision against both enemies and destroyable blox
// Unlike a hitbox, there can only be one result, so they are checked concurrently

var sx = dx - x1;
var sy = dy - y1;
var blox_saved = null;  var enme_saved = null; var brek_saved = null;

while ( true )
{
    var blox_result = null; var enme_result = null; var brek_result = null;

    // Need to do three possible casts for each result
    enme_result = collision_line( x1,y1, dx,dy, enemyBase,false, true );
    if ( enme_result == source || (enme_result.moTeam & source.moTeam) ) enme_result = null; // Ignore source on these attacks
    
    if ( enme_result == null )
        brek_result = collision_line( x1,y1, dx,dy, bloxDestroyable,false, true );
    
    if ( brek_result == null && enme_result == null )
        blox_result = collision_line( x1,y1, dx,dy, bloxBase,false, true );
        
    // If there was a result for something, then we save that and clear the rest
    if ( blox_result != null )
    {
        blox_saved = blox_result;
        enme_saved = null; brek_saved = null;
    }
    else if ( enme_result != null )
    {
        enme_saved = enme_result;
        blox_saved = null; brek_saved = null;
    }
    else if ( brek_result != null )
    {
        brek_saved = brek_result;
        blox_saved = null; enme_saved = null;
    }
    
    // Halve the distance until we don't hit shit
    sx /= 2;
    sy /= 2;

    if (abs(sx) > 2 || abs(sy) > 2)
    {
        // If this cast hit, then we search the former half
        if ( blox_result != null || enme_result != null || brek_result != null )
        {
            dx -= sx;
            dy -= sy;
        }
        // Else we search the latter half
        else
        {
            dx += sx;
            dy += sy;
        }
    }
    else
    {
        // For debug purposes, draw the bounding box of the hitbox
        if (Debug.on)
        {
            var dbb = new(debugLine);
                dbb.x1 = x1; dbb.y1 = y1;
                dbb.x2 = dx; dbb.y2 = dy;
                dbb.image_blend = c_red;
                dbb.depth = -2;
        }
        /*var dbb = new(debugLine);
            dbb.x1 = x1; dbb.y1 = y1;
            dbb.x2 = dx; dbb.y2 = dy;
            dbb.image_blend = c_white;
        var dbb = new(debugLine);
            dbb.x1 = x1; dbb.y1 = y1;
            dbb.x2 = dx; dbb.y2 = dy;
            dbb.image_blend = c_gray;*/
    
        // dx, dy is the hit position
        break;
    }
}

// We hit an enemy?
if ( enme_saved != null )
{
    with ( enme_saved )
    {
        chHealth -= damage;
        
        // Create damage ticker
        var ticker = instance_create(dx,dy, floaterDmgTicker);
            ticker.value = damage;
        
        // Create hit sound
        var sound_hit = sound_play_at(dx,dy, Sound_Impact(chBloodtype));
        
        // Create hit effect
        var fx_hit = instance_create(dx,dy, Effect_Impact(chBloodtype));
        
        // Create knockback/do status effects
        if (source.moPlayer)
        {
            // Mark as stunned
            isStunned = true;
            stunTimer = max(0, stunTimer) + (damage * 0.06);
            // Add knockback
            var kickback = damage * 12;
            if ( abs(xspeed) < kickback || sign(xspeed) != sign(x - source.x) )
                xspeed = sign(x - source.x) * kickback;
                
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
    }
}
// We hit a breakable wall?
else if ( brek_saved != null )
{
    with ( brek_saved )
    {
        chHealth -= damage;
        
        // Create damage ticker
        var ticker = instance_create(dx,dy, floaterDmgTicker);
            ticker.value = damage;
        
        // Create hit sound
        var sound_hit = sound_play_at(dx,dy, Sound_Impact(chBloodtype));
        
        // Create hit effect
        var fx_hit = instance_create(dx,dy, Effect_Impact(chBloodtype));
    }
}
// We hit a wall?
else if ( blox_saved )
{
    // Create hit sound
    var sound_hit = sound_play_at(dx,dy, Sound_Impact(BLOOD_DUST));
    // Create hit effect
    var fx_hit = instance_create(dx,dy, Effect_Impact(BLOOD_DUST));
    
    // Check for goo there
    if ( type == DAMAGE_FIRE )
    {
        var goo_hit = collision_circle(dx,dy, 4, splatterGoo, false,true );
        if ( exists(goo_hit) )
        {
            if ( !goo_hit.isBurning )
            {
                // Do a check to see if it should light on fire
                if ( inventory.torch || true )
                {
                    goo_hit.isBurning = true;
                }
            }
            // Play light on fire sound
            var sound = sound_play_at(dx,dy,sndFireStart);
                sound.pitch = random_range(0.9,1.1);
        }
    }
}

