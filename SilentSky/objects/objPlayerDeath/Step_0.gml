restartTimer += Time.dt;

// Fade the screen out...
if ( restartTimer > 5.0 && !exists(fxScreenFadeOut) )
{
    new(fxScreenFadeOut);
}
// And restart the game after showing them dead for a bit
if ( restartTimer > 6.5 )
{
    game_restart();
}

chHealth = -1;

// Stop xspeed
xspeed = 0;
// Update gravity
Motion_CommonGravity();
// Do collision
Motion_Common();
// Perform velocity-based motion
x += xspeed * Time.dt;
y += yspeed * Time.dt;

