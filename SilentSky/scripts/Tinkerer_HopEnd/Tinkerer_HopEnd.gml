
// find all enemies in range, and apply damage if not on the same team
if ( chMana > 15 )
{
    var source = id;
    with (enemyTest)
    {
        if (damageCanHit(source, id))
        {
            if (point_distance(x,y, source.x,source.y) < 128)
            {
                // Deal damage
                damageTarget(source, 7, true,true);
                // Shock them
                fiShockTimer = 0;
                isShocked = true;
                // Deal a ministun
                var damage = 3;
                isStunned = true;
                stunTimer = max(0, stunTimer) + (damage * 0.06);
            }
        }
    }
    
    // make shock effect
    var fx = instance_create(x,y, fxCircleExpand);
        fx.maxRadius = 128;
        fx.image_blend = c_electricity;
    var fx = instance_create(x,y, fxCircleExpand);
        fx.maxRadius = 128;
        fx.radius = fx.maxRadius * 0.8;
        fx.image_blend = c_electricity;
        
    sound_play_at(x,y, sndFireStop);
    
    // decrease mana
    chMana -= 15;
}
else
{
    // NOTHING
}

