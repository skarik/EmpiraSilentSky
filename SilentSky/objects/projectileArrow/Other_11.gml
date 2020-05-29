var enemy = collision_circle(x,y,4, enemyBase,false,true);
if (enemy != null && damageCanHit(id,enemy))
{
    //enemy.isGlued = true;
    //enemy.guTimer = 0; // Refresh the burn timer
    var source = id;
    with (enemy)
    {
        damageTarget(source, 15, true, true);
        
        if (source.isShocked)
        {   // Shock the target if the bow is shocked
            fiShockTimer = 0;
            isShocked = true;
        }
    }
    
    // Create hit sound
    //var sound_hit = sound_play_at(x,y, Sound_Step(BLOOD_GOO));
    
    // Explode into effect
    event_user(2); 
    idelete(this);
    killme = true;
}

