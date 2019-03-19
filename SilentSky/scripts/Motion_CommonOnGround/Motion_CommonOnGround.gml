// Update the check if on the ground or not
isOnGround = (yspeed >= -10) && (place_meeting(x, y + 1.5, bloxBase));

// If on the ground, check ground for a moving platform
var mover = collision_rectangle(x - 4, y, x + 4, y + 8, moverBase, false, true);
if (exists(mover))
{
    x += (mover.x - mover.xprev);
    y += (mover.y - mover.yprev);
}

