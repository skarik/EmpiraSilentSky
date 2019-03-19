if (PowerFlag_Get(target))
{
    with (moverBase)
    {
        moving_up_delay -= Time.dt;
        if (stop_point_count > 0 && moving_up_delay <= 0.0)
        {
            if (moving_up)
            {
                // Move up
                ty -= Time.dt * 48.0;
            
                // Check for the target
                var target_inst = stop_point[stop_point_target];
                if (ty < target_inst.y)
                {
                    moving_up_delay = 2.0;
                    ty = target_inst.y;
                    // Go to next highest point in list
                    do {
                        stop_point_target += 1;
                    }
                    until (stop_point_target >= stop_point_count || ty > stop_point[stop_point_target].y);
                    // Hit max point count?
                    if (stop_point_target >= stop_point_count)
                    {
                        stop_point_target = 0;
                        moving_up = false;
                    }
                    
                    // if player on it, shake screen
                    if (place_meeting(x,y - 2,objPlayerMain))
                    {
                        Effect_ScreenShake(2,0.4,true);
                    }
                    var sfx = sound_play_at(x + sprite_width/2, y, sndBigstop);
                        sfx.pitch = random_range(1.1,1.3);
                }
        
            }
            else
            {   
                // Move down
                ty += Time.dt * 48.0;
                
                // Hit bottom? Go back up
                if ( ty > ystart )
                {
                    ty = ystart;
                    moving_up = true;
                    moving_up_delay = 2.0;
                    
                    // if player on it, shake screen
                    if (place_meeting(x,y - 2,objPlayerMain))
                    {
                        Effect_ScreenShake(2,0.4,true);
                    }
                    var sfx = sound_play_at(x + sprite_width/2, y, sndBigstop);
                        sfx.pitch = random_range(1.1,1.3);
                }
            }
        }
    }
}

