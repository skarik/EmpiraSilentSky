var xstep = xspeed * Time.dt;
var ystep = yspeed * Time.dt;

if ( position_meeting(x + xstep, y, bloxBase ) )
{
    xspeed = 0;
    xstep = 0;
}
if ( position_meeting(x + xstep, y + ystep, bloxBase ) )
{
    yspeed = 0;

    var corpse = instance_create(x,y, corpseNpc);
    corpse.sprite_index = sprite_index;
    corpse.image_xscale = image_xscale;
    corpse.blend_fade = 1.0;
    with (corpse)
    {
        while (!position_meeting(x,y,bloxBase) && y > room_height)
        {
            y += 1;
        }
    }
    
    delete(this);
    exit;
}

x += xstep;
y += ystep;
yspeed += ygrav * Time.dt;

