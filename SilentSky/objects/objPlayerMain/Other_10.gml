//delete(this);
// Player has died.
//room_restart();

// Play death music
/*audio_play_sound(musDeath, 90, false);

// Create restart timer
restartTimer = false;
instance_change(objPlayerDeath,false);
// Create death
new(floaterDead);

// Shake screen for keks
Effect_ScreenShake(
        5,
        1.8,
        true);*/
        
// Shake screen for keks
Effect_ScreenShake(
    6,
    0.8,
    true);
// Select valid character
moPlayer = false;
//moPlayerAvailable = false;
moDead = true;
with (objPlayerMain)
{
    if (!moDead)
    {
        moPlayer = true;
        break;
    }
}
        
// If everybody is dead
var not_dead = false;
with (objPlayerMain)
{
    // If there is anything not dead, then not game over
    if (!moDead)
    {
        not_dead = true;
    }
}
if (not_dead == false)
{
    if (!exists(floaterDead))
    {
        new(floaterDead);
        // Shake screen for keks
        Effect_ScreenShake(
                5,
                1.8,
                true);
    }
}

/* */
/*  */
