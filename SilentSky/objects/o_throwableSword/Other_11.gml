/// @description Deal combat damage

// Get the four corners of the sword
var x1 = x + lengthdir_x(-sprite_xoffset + sprite_get_bbox_left(sprite_index), image_angle);
var x2 = x + lengthdir_x(-sprite_xoffset + sprite_get_bbox_right(sprite_index), image_angle);
var y1 = y + lengthdir_y(-sprite_yoffset + sprite_get_bbox_top(sprite_index), image_angle);
var y2 = y + lengthdir_y(-sprite_yoffset + sprite_get_bbox_bottom(sprite_index), image_angle);

// Swap for min and max
if (x1 > x2)
{
	var temp = x2;
	x2 = x1;
	x1 = temp;
}
if (y1 > y2)
{
	var temp = y2;
	y2 = y1;
	y1 = temp;
}

var enemy = collision_rectangle(x1, y1, x2, y2, enemyBase, false, true);
if (enemy != null && Combat_CanHit(id, enemy))
{
    var source = id;
    with (enemy)
    {
        //Combat_Damage(source, 15, true, true);
		Combat_Damage(source, 45, true, true);
        
        if (source.isShocked)
        {   // Shock the target if the bow is shocked
            fiShockTimer = 0;
            isShocked = true;
        }
    }
    
    // Create hit sound
    //var sound_hit = sound_play_at(x,y, Sound_Step(BLOOD_GOO));
    
    // Explode into effect
    //event_user(2); 
    //delete(this);
    //killme = true;
	
	m_ricochet = true;
	rspeed = choose(-1, 1) * random_range(360, 1200);
	yspeed += random_range(0, -200);
	xspeed *= random_range(-0.5, 0.5) * 0.25;
}

