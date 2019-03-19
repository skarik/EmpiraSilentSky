if (exists(doodadClouds0))
{
    // Shake screen
    Effect_ScreenShake(3, 7.0, true);
    Effect_ControllerShake(1.0, 4.0, true);
    
    
    var effect = instance_create(doodadClouds0.x, doodadClouds0.y, fxCircleExpandSlow);
        effect.image_blend = c_riftgreen;
        effect.maxRadius = 130;
        effect.radius = 8;
        effect.depth = 9998;
        
    doodadClouds0.fxWarpT += 1.0;
    /*repeat (12)
    {
        var ofx = random_range(-10,10);
        var ofy = random_range(2,-2) * (10 - abs(ofx));
        var fx = instance_create( doodadClouds0.x + ofx, doodadClouds0.y + ofy + 16, fxBgVoidParticle);
            fx.xspeed = -ofx;
            fx.yspeed = -ofy;
    }*/
    new(fxBgVoidParticleEmitter);
    
    var sfx = sound_play_at(room_width / 2, room_height, sndThundershake);
        sfx.pitch = 0.8;
        sfx.gain = 1.4;
        sfx.falloff_end = 12000;
        sfx.falloff_start = 4000;
}
else
{
    // Shake screen
    Effect_ScreenShake(2, 7.0, true);
    Effect_ControllerShake(0.8, 2.0, true);
}

var sfx = sound_play_at(room_width / 2, room_height, sndThundershake);
    sfx.pitch = 0.25;
    sfx.gain = 1.5;
    sfx.falloff_end = 12000;
    sfx.falloff_start = 4000;
