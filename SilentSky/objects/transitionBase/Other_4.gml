if (global._transition_source != null)
{
    // Find matching room
    if (target == global._transition_source)
    {
        var pos = x;
        var pos_y = y+96;
        with (objPlayerMain)
        {   
            // Skip invalid players
            if (moPlayerAvailable == false) continue;
            
            if (pos <= 0) {
                x = pos + 32 + 2;
            }
            else if (pos >= room_width) {
                x = pos - 2;
            }
            else {
                x = pos;
            }
            y = pos_y + global._transition_dy;
            
            persistent = false;
            inventory.persistent = false;
        }
        with (playerHud)
        {
            persistent = false;
        }
        
        global._transition_source = null;
    }
}

