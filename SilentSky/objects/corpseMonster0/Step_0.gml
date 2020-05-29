prevDeadTimer = deadTimer;
deadTimer += Time.dt;
if (deadTimer >= 0.4 && prevDeadTimer < 0.4)
{
    for (var i = 0; i < choose(1,2); ++i)
    {
        var blood = instance_create(
            x + random_range(-16,16),
            y + random_range(-64,0),
            gameBlooddrop);
            blood.xspeed += random_range(-100,100);
    }
    sound_play_at(x,y,sndStepGravel);
}
if (deadTimer > 0.8)
{
    /*for (var i = 0; i < choose(3,4); ++i)
    {
        var blood = instance_create(
            x - sprite_xoffset + random_range(0,sprite_width),
            y - sprite_yoffset + random_range(0,sprite_height),
            gameBlooddrop);
            blood.xspeed += random_range(-100,100);
    }*/
    for (var i = 0; i < 11; ++i)
    {
        var effect = instance_create(
            x + random_range(-16,16),
            y + random_range(-64,0),
            choose(fxGooEmitterSm,fxBloodRedEmitter));
    }
    
    sound_play_at(x,y,sndHitMeatSoft);
    
    // Make a goo pickup
    if ( sprite_index == sprMonster0Stun )
    {
        if ( playerInventory.canister_goo )
        {
            var pickup = instance_create(x+random_range(-2,2),y,pickupGoo);
        }
    }
    else
    {
        if ( playerInventory.canister_glue )
        {
            var pickup = instance_create(x+random_range(-2,2),y,pickupGlue);
        }
    }
    
    idelete(this);
}

/* */
/*  */
