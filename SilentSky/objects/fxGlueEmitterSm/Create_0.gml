for ( var i = 0; i < choose(1,2,3); ++i )
{
    var goo = instance_create( x,y, fxGooSm );
    goo.xspeed = random_range(-80,80);
    goo.yspeed = random_range(-80,10);
    goo.ygrav = random_range(300,300);
    goo.image_blend = c_white;
}

idelete(this);

