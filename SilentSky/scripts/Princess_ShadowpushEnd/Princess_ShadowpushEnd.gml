
sound_play_at(x,y, sndPrincessShadowpush);
visible = true;

if ( chMana > 10 )
{
    // push enemies away
    // find all enemies in range, and apply push if not on the same team
    var source = id;
    with (enemyBase)
    {
        if (damageCanHit(source, id))
        {
            if (point_distance(x,y, source.x,source.y) < 160)
            {
                // Deal damage
                //damageTarget(source, 7, true,true);
                var dir = point_direction(source.x,source.y, x,y);
                xspeed += lengthdir_x(250, dir);
                yspeed += lengthdir_y(250, dir) - 100;
                
                // Mark as stunned
                var damage = 9;
                isStunned = true;
                stunTimer = max(0, stunTimer) + (damage * 0.06);
            }
        }
    }
    
    chMana -= 10;
}

