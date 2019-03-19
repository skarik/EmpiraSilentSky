pkTimer = 0;
pkTimerPrev = 0;
pkInRange = true;
pkUiPosX = x - __view_get( e__VW.XView, 0 );
pkUiPosY = y - __view_get( e__VW.YView, 0 ) + 32;
pkUiAlpha = 0;
pkBigItem = true;

// Move the object out of the ground
while ( place_meeting(x,y,bloxBase) )
{
    y -= 1;
}

depth = 1;

pkPickupLoop = null;
pkPickupLoopVolume = 0;

