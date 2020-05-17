

var enemy = other.id;/*collision_rectangle(
    x - sprite_xoffset, y - sprite_yoffset, 
    x - sprite_xoffset + sprite_width, y - sprite_yoffset + sprite_width,
    enemyBase,false,true );*/
if (exists(enemy) && damageCanHit(id,enemy))
{
    // Is it in the burn list?
    var hit = false;
    for (var i = 0; i < burnlist_size; ++i)
    {
        if ( burnlist[i] == enemy )
        {
            hit = true;
        }
    }
    
    if (!hit)
    {
        burnlist[burnlist_size] = enemy;
        burnlist_size++;

        var source = id;
        with (enemy)
        {   // Burn them
            damageTarget(source, 16*source.life+5, true, true);
         
            // Burn the target
            fiBurnTimer = 0;
            isBurning = true;
        }
    }
    
    // Create hit sound
    //var sound_hit = sound_play_at(x,y, Sound_Step(BLOOD_GOO));
    
    // Explode into effect
    event_user(2); 
    delete(this);
    killme = true;
}

/* */
/*  */
