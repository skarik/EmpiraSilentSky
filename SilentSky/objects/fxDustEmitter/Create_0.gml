for ( var i = 0; i < choose(2,3,4); ++i )
{
    var dust = instance_create( x,y, fxDustSm );
    dust.xspeed = random_range(-10,10);
    dust.yspeed = random_range(-20,10);
}

idelete(this);

