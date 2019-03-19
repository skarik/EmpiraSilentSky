var pl = objPlayerMain;

// If going beyond end of current room, generate another room
if ( pl.x >= lvCurrentLimit )
{
    // Do area checks:
    if ( !exists(doorOnewayLevel) )
    {   // We have a new room!
        lvNewRoom = true;
    }
    else
    {
        // Reset area count when we gen with a new door
        lvAreaSize = 0;
        // Increment current area id
        lvAreaCount += 1;
        
        // We possibly might have a new area to go to!
        if ( Level_NextAreaNow() )
        {
            // Update tileset
            lvTileset = Level_NextTileset();
            // Not a new room, so we instantly move to it
            lvNewRoom = false;
            
            // New area, so let's make a floater for it
            var floater = new(floaterArea);
                floater.text = Level_NextAreaName(lvTileset);
        }
        else
        {
            lvTileset = lvLimitType[lvLimitListSize-1];
            lvNewRoom = true;
            
            // New area, so let's make a floater for it
            var floater = new(floaterArea);
                floater.text = "AREA " + string(lvAreaCount);
        }
    }
    
    // Create floater for area name
    if (instance_number(levelGenerator) == 0)
    {
        var floater = new(floaterArea);
            floater.text = "DJEHUT CAMPLE";
    }

    // Save old limit
    lvOldLimit = lvCurrentLimit;
    
    // Create the generator now
    var generator = instance_create(lvCurrentLimit, y, levelGenerator);
        
    // Move the current game limit to the end of the new room
    lvCurrentLimit += generator.width * 32 * 8;
    y = generator.y; // Set y to be the next generator's Y
    
    // Save the list of limits
    lvLimitList[lvLimitListSize] = lvCurrentLimit;
    lvLimitType[lvLimitListSize] = lvTileset;
    lvLimitAmbient[lvLimitListSize] = Level_GenerateAmbient(lvLimitType[lvLimitListSize]);
    lvLimitListSize += 1;
    
    // Increment size of the current area
    lvAreaSize += 1;
}

// If going to a new room, then we smoothly lerp to it
if ( lvNewRoom && pl.x >= lvLimitList[lvLimitListSize-2] )
{
    // Set limit for the x as we go to the next room
    var delta, deltaSpeed;
    deltaSpeed = 512 * Time.dt;
    // The minscreen should go to hide the previous room
    Screen.minx = max( Screen.minx, lvOldLimit - __view_get( e__VW.WView, 0 ) );
    delta = lvOldLimit - Screen.minx;
    if ( abs(delta) < deltaSpeed)
    {
        Screen.minx += delta;
    }
    else
    {
        Screen.minx += sign(delta) * deltaSpeed;
    }
    // Maxscreen should be the end of the current room
    delta = lvCurrentLimit - Screen.maxx;
    if ( abs(delta) < deltaSpeed)
    {
        Screen.maxx += delta;
    }
    else
    {
        Screen.maxx += sign(delta) * deltaSpeed;
    }
    
    // Update the tileset accordingly
    lvTileset = lvLimitType[lvLimitListSize - 1];
    // Save current limit
    lvLimitTarget = lvLimitListSize - 1;
}
else
{
    lvNewRoom = false;
    
    // Find the two values we're at
    var vi = lvLimitListSize-1; // Start at the right of the current room (player will be to the left of the border)
    
    // While player is to the left, we decrement
    while ( vi > 0 && pl.x < lvLimitList[vi] ) --vi;
    // Player is now to the right of the current border.
    
    // We just snap the view immediately
    Screen.minx = lvLimitList[vi + 0];
    Screen.maxx = lvLimitList[vi + 1];
    
    // Update the tileset accordingly
    lvTileset = lvLimitType[vi + 0];
    // Save current limit
    lvLimitTarget = vi + 0;
}

