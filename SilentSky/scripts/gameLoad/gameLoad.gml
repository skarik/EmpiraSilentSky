if (!file_exists(SAVE_FILE))
{
    return false;
}
// Load buffer from file
var buf = buffer_load(SAVE_FILE);

// Read out the players:
if (buffer_read(buf, buffer_bool))
    if (!exists(objPlayerPaladin)) new(objPlayerPaladin);
if (buffer_read(buf, buffer_bool))
    if (!exists(objPlayerPrincess)) new(objPlayerPrincess);
if (buffer_read(buf, buffer_bool))
    if (!exists(objPlayerTinkerer)) new(objPlayerTinkerer);
// Make them active
with (objPlayerMain)
{
    moPlayerAvailable = true;
    moPlayer = false;
}

// Read in the current player state:
var pl = buffer_read(buf, buffer_u32);
if (pl == 0)
{   // Check for valid file
    show_error("INVALID SAVE", true);
    delete(objPlayerMain);
    return false;
}
else
{   // Set the new player as the player
    pl.moPlayer = true; 
}
var target_room = buffer_read(buf, buffer_u32);
pl.x            = buffer_read(buf, buffer_u32);
pl.y            = buffer_read(buf, buffer_u32);
pl.facingDir    = buffer_read(buf, buffer_f32);

// Read in Game's flags
with (Game)
{
    Flags_Load(buf);
	mapVisibilityLoad(buf);
}

// Free resources
buffer_delete(buf);

// Move all player objects to the main object
with (objPlayerMain)
{
    x = pl.x;
    y = pl.y;
    facingDir = sign(facingDir);
    if (facingDir == 0) facingDir = 1.0;
}
// Now go to the target room
global._transition_source = null;
transition_to(target_room); 

// Return a successful load
return true;

