var pl = objPlayerMain;
var inventory = playerInventory;
var delta, deltaSpeed;

// Updaate canisters values
delta = (max(inventory.ammo_goo - 1, 0) % 100) - uiCanisterGoo;
deltaSpeed = 100 * Time.dt;
if ( abs(delta) < deltaSpeed )
    uiCanisterGoo += delta;
else
    uiCanisterGoo += sign(delta) * deltaSpeed;
    
delta = (max(inventory.ammo_glue - 1, 0) % 100) - uiCanisterGlue;
deltaSpeed = 100 * Time.dt;
if ( abs(delta) < deltaSpeed )
    uiCanisterGlue += delta;
else
    uiCanisterGlue += sign(delta) * deltaSpeed;

// Generate UI's target position
var tx = __view_get( e__VW.XView, 0 );
var ty = __view_get( e__VW.YView, 0 ) + sin(current_time*0.00075);

// Move the UI to that target position
delta = tx - uiPosX;
deltaSpeed = (abs(delta) * 16.0 + 320) * Time.dt;
if ( abs(delta) > __view_get( e__VW.WView, 0 )/2 )
    uiPosX += delta;
else if ( abs(delta) < deltaSpeed)
    uiPosX += delta;
else
    uiPosX += sign(delta) * deltaSpeed;
    
delta = ty - uiPosY;
deltaSpeed = (abs(delta) * 16.0 + 320) * Time.dt;
if ( abs(delta) > __view_get( e__VW.HView, 0 )/2 )
    uiPosY += delta;
else if ( abs(delta) < deltaSpeed)
    uiPosY += delta;
else
    uiPosY += sign(delta) * deltaSpeed;
    
// Fade in
if ( objPlayerMain.chHealth > 0 )
{
    uiAlpha = min( uiAlpha + Time.dt, 1.0 );
}
// Or fade out on death
else
{
    uiAlpha = max( uiAlpha - Time.dt, 0.0 );
}

