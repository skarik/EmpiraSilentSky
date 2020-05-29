for ( var i = 0; i < choose(2,3,4); ++i )
{
    var goo = instance_create( x,y, fxGooSm );
    goo.xspeed = random_range(-100,100);
    goo.yspeed = random_range(-100,10);
    goo.ygrav = random_range(400,400);
    goo.image_blend = c_lime;
}

idelete(this);

