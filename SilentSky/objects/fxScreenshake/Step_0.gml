// Shake at 60 FPS
var shakeRate = 1/60;
shakeTimer += Time.dt;
if (shakeTimer > shakeRate)
{
    shakeTimer = min(shakeRate, shakeTimer - shakeRate);

    // Create screenshake
    var dir = random_range(0,360);
    var len = random_range(0,magnitude);
    // Fade shake over time if wanted
    if ( fade ) len *= life/maxlife;
    // Set actual shake
    Screen.offsetx = lengthdir_x( len,dir );
    Screen.offsety = lengthdir_y( len,dir );
}

// Decrement over lifetime
life -= Time.dt;
if ( life < 0 )
{
    // Reset offset   
    Screen.offsetx = 0;
    Screen.offsety = 0;
    
    // Delete self
    delete(this);
}

