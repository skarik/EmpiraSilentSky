// Need to first move this object to be sitting right on top of the ground.
/*if ( place_meeting(x,y, bloxBase) )
{

}*/

// Set up local variables
drHeightLimit = random_range(3,15);
drParent = null;
drFlip = choose(1,-1);

// Set up drips (generate them now)
drCount = floor(random(4));
for (var i = 0; i < drCount; ++i)
{
    drOffset[i] = round(random_range(3,28));
    drHeight[i] = 0;
    drMaxHeight[i] = round(random_range(-drHeightLimit*0.9,0) + drHeightLimit);
    drSpeed[i] = random_range(3,10);
}

// Select an image to use to draw
image_speed = 0;
image_index = floor(random(image_number));

// First grab the normal of the surface we hit
var normal = collision_normal( x,y, bloxBase );
normal = round(normal/90)*90;
image_angle = normal - 90;

var iteration_limit = 0;

// Now pull ourselves halfway up to center
var dx = lengthdir_x(1,image_angle);
var dy = lengthdir_y(1,image_angle);
x -= dx * 16;
y -= dy * 16;

// Push our position onto the wall by checking "up"
var nx = lengthdir_x(1,normal);
var ny = lengthdir_y(1,normal);
// Offset out of wall
x = round(x) + nx * 8;
y = round(y) + ny * 8;
// Now pull it back down
iteration_limit = 0;
while (!position_meeting(x + dx*16, y + dy*16, bloxBase) && (++iteration_limit < 31))
{   // Check up and move down
    x -= nx; y -= ny;
}

// Check for edges by checking "left" and "right" to make sure we are completely on the edge
iteration_limit = 0;
while (!position_meeting(x + dx*32 - nx, y + dy*32 - ny, bloxBase) && (++iteration_limit < 31))
{   // Check right and move left
    x -= dx; y -= dy;
}
iteration_limit = 0;
while (!position_meeting(x - dx*0 - nx, y - dy*0 - ny, bloxBase) && (++iteration_limit < 31))
{   // Check left and move right
    x += dx; y += dy;
}

// But also check to make sure the space above the splat is open
iteration_limit = 0;
while (position_meeting(x + dx*2 + nx*2, y + dy*2 + ny*2, bloxBase) && (++iteration_limit < 31))
{   // Collision over left, move right
    x += dx; y += dy;
}
iteration_limit = 0;
while (position_meeting(x + dx*29 + nx*2, y + dy*29 + ny*2, bloxBase) && (++iteration_limit < 31))
{   // Collision over right, move left
    x -= dx; y -= dy;
}

// Offset slightly if on the back-side of a normal
x += max(0, nx);
y += max(0, ny);

// Pull parent at the current position now
drParent = collision_circle(x + dx*16 - nx*16, y + dy*16 - ny*16, 2, bloxBase, false,true);
if (!exists(drParent))
{
    delete(this);
}

/* */
/*  */
