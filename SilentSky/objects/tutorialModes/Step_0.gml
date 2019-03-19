event_inherited();

var new_count = levelManager.lvCurrentLimit + instance_number(enemyBase) + instance_number(bloxDestroyable) + instance_number(pickupBase) ;
if ( new_count != start_count )
{
    killme = true;
    Game.tuShowModes = false;
}

