// Offset the grav dir
grav_dir += Time.dt * random_range(-20,20);

// Add to the speed
xspeed += lengthdir_x(grav_val,grav_dir) * Time.dt;
yspeed += lengthdir_y(grav_val,grav_dir) * Time.dt;

// Move
x += xspeed * Time.dt;
y += yspeed * Time.dt;

// Decay hotness over time
hotness -= Time.dt;
// Set color based on it
image_blend = merge_color( c_black, c_red, clamp(hotness,0.0,1.0) );

// Kill on hit something
if ( place_meeting(x,y,bloxBase) )
{
    delete(this);
}
else // Possibility to set things on fire
{
    // Check enemies
    var enemy = collision_circle(x,y,3, enemyBase,false,true);
    if (enemy != null )
    {
        if ( random(1) < hotness )
        {   // Set on fire
            if ( !enemy.isBurning )
            {
                enemy.isBurning = true;
                // Play sound
                sound_play_at(x,y,sndFireStart);
            }
            else
            {
                enemy.fiTimer = 0; // Refresh the burn timer
            }
            // Kill self
            delete(this);
        }
    }
    
    // Check other splats
    var goo = collision_circle(x,y,5, splatterGoo,false,true);
    if (goo != null && !goo.isBurning)
    {
        if ( random(1) < hotness )
        {   // Set on fire
            goo.isBurning = true;
            // Play sound
            sound_play_at(x,y,sndFireStart);
            // Kill self
            delete(this);
        }
    }
}

// Kill on too dark
if ( hotness < 0 )
{
    delete(this);
}

