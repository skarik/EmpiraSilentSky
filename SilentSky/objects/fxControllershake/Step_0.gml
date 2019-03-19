
var shake = magnitude;
// Fade shake over time if wanted
//if ( fade ) shake *= life/maxlife;
// Set actual shake
gamepad_set_vibration(0, shake,shake);


// Decrement over lifetime
life -= Time.dt;
if ( life < 0 )
{
    // Reset offset   
    gamepad_set_vibration(0, 0,0);
    
    // Delete self
    delete(this);
}

