// Do effect!

if (type == POTION_FIRE)
{
    for (var i = 0; i < 4; ++i)
    {
        var fx = instance_create(x + random_range(-16,16), y, fxFire0);
    }
    var fire_wall = instance_create(x,y, projectileFireWall);
        fire_wall.moTeam = moTeam;
        fire_wall.moPlayerAvailable = moPlayerAvailable;
        fire_wall.moPlayer = moPlayer;
}
else if (type == POTION_TAR)
{
    for (var i = -2; i <= 2; ++i)
    {
        // Hit collision
        instance_create( x+ 32*i,y, splatterGlue );
    }
}
else if (type == POTION_SMOKE)
{
    
}

