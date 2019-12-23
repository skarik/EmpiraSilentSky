// Do pickup music
// Get nearest pickup to player
/*var nearest_pickup = null;
with ( objPlayerMain ) nearest_pickup = instance_nearest(x,y, pickupBase);
if ( nearest_pickup == this && (audioMusic.targetTrack != Game.muEncounterTrack || audioMusic.targetGain <= 0) )
{
    var pickup_distance = point_distance(x,0,objPlayerMain.x,(y-objPlayerMain.y) * 4.0);
    var pickup_music_strength = (300 - pickup_distance)/300;
    if (pickup_music_strength > 0 && playerInventory.cloak && pkBigItem)
    {   // But only do pickup music if not the first item
        audioMusic.targetTrack = musItemGet;
        audioMusic.targetGain = pickup_music_strength * 0.70;
    }
    else
    {
        audioMusic.targetTrack = null;
    }
}*/

pkTimerPrev = pkTimer;
// Increase timer if player is using it
if ( place_meeting(x,y, objPlayerMain) )
{
    pkInRange = true;
    // Pick up shit
    if ( objPlayerMain.xButton.value > 0.5 )
    {   // Pickup item in 2 seconds
        pkTimer += Time.dt * (2.2 + (!pkBigItem * 2.0));
    }
    else
    {   // Decrease pick timer slowly
        pkTimer = max(0.0, pkTimer - Time.dt);
    }
}
else
{
    pkInRange = false;
    // Decrease pickup timer quickly
    pkTimer = max(0.0, pkTimer - Time.dt * 3.0);
}

// Play sounds for the timer incrementing
if ( pkTimer > pkTimerPrev )
{
    if ( pkPickupLoop == null )
    {
        pkPickupLoop = audio_play_sound(sndUiChargeLoop, 90, true);    
    }
    pkPickupLoopVolume = min( pkPickupLoopVolume + 6.0 * Time.dt, 0.7 );
    audio_sound_gain(pkPickupLoop, pkPickupLoopVolume, 0);
    audio_sound_pitch(pkPickupLoop, 0.7 + pkTimer*0.05);

    if ( pkBigItem ) 
    {
        // Play beeps at each tick of the item pickup
        if ((pkTimerPrev < 1.0 && pkTimer >= 1.0) ||
            (pkTimerPrev < 2.0 && pkTimer >= 2.0) ||
            (pkTimerPrev < 3.0 && pkTimer >= 3.0) ||
            (pkTimerPrev < 4.0 && pkTimer >= 4.0))
        {
            var sound = sound_play_at( x,y, sndUiBlip1);
                sound.gain = 0.2;
        }
    }
}
else
{
    // Fade out the chargeup sound
    if ( pkTimer > 0.3 )
        pkPickupLoopVolume = max(0, pkPickupLoopVolume - Time.dt * 0.25 );
    else
        pkPickupLoopVolume = max(0, pkPickupLoopVolume - Time.dt * 1.00 );
    // Set the volume & pitch, or stop sound if volume below zero
    if ( pkPickupLoopVolume <= 0.0 )
    {
        audio_stop_sound(pkPickupLoop);
        pkPickupLoop = null;
    }
    else if ( pkPickupLoop != null )
    {
        audio_sound_gain(pkPickupLoop, pkPickupLoopVolume, 0);
        audio_sound_pitch(pkPickupLoop, 0.7 + pkTimer*0.05);
    }
}

// If pickup timer is in time, then we pick up the item
if ( pkTimer > 4.3 )
{
    // Disable pickup tutorial
    Game.tuShowPickup = false;
    // Stop the music
    if ( audioMusic.targetTrack == musItemGet )
        audioMusic.targetTrack = null;
    // Play fanfare
    if ( pkBigItem ) {
        var audio = audio_play_sound(musItemFanfare, 85, false);
            audio_sound_gain(audio,0.75,0.0);   
    }
    // Stop pickup sound
    if ( pkPickupLoop != null )
    {
        audio_stop_sound(pkPickupLoop);
        pkPickupLoop = null;
    }
    // Play final loop
    audio_play_sound(sndUiChargeDone, 90, false);   
    // Perform user event
    event_user(0);
    // Delete self
    if ( pkBigItem )
        delete(object_index);
    else
        delete(this);
}

// Fade in and out the UI bit
if ( pkInRange )
{  
    pkUiAlpha = min( 1.0, pkUiAlpha + Time.dt * 3.0 );
}
else
{
    pkUiAlpha = max( 0.5, pkUiAlpha - Time.dt * 2.0 );
}

// Set the target position on the screen to move to
var tx = x - __view_get( e__VW.XView, 0 );
var ty = y - __view_get( e__VW.YView, 0 ) + 32 + sin(current_time*0.015);

// Move the UI to that target position
var delta, deltaSpeed;

delta = tx - pkUiPosX;
deltaSpeed = (abs(delta) * 7.0 + 160) * Time.dt;
if ( abs(delta) < deltaSpeed)
    pkUiPosX += delta;
else
    pkUiPosX += sign(delta) * deltaSpeed;
    
delta = ty - pkUiPosY;
deltaSpeed = (abs(delta) * 7.0 + 160) * Time.dt;
if ( abs(delta) < deltaSpeed)
    pkUiPosY += delta;
else
    pkUiPosY += sign(delta) * deltaSpeed;

/* */
/*  */
