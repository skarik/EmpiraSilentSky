event_inherited();

if ( isBurning )
{
    // Emit flames when burning
    fiSpawnCount += 70 * Time.dt;
    while ( fiSpawnCount > 1 )
    {
        var dist = random(32);
        var burn = instance_create(
            x+lengthdir_x(dist,image_angle),
            y+lengthdir_y(dist,image_angle),
            fxBurnParticle
            );
        fiSpawnCount -= 1;
        
        // Have a 1% chance to make an ember
        if ( random(1) < 0.01 )
        {
            instance_create(
                burn.x + lengthdir_x(4,image_angle+90),
                burn.y + lengthdir_y(4,image_angle+90),
                gameEmber );
        }
    }
    
    // Stop burning when dead
    fiLifetime -= Time.dt;
    if ( fiLifetime < 0.0 )
    {
        // Play sound
        var sound = sound_play_at(x,y,sndFireStop);
            sound.pitch = random_range(0.9,1.1);
            sound.gain = random_range(0.7,0.8);
                
        // Delete self
        delete(this);
    }
}

