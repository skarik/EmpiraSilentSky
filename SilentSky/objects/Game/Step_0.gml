///@description Fire Audio & Map Update

// Update the fire loop
{
	faUpdateTime += Time.dt;

	if ( faUpdateTime > 0.5 )
	{
	    faUpdateTime -= 0.5;
    
	    // Find the nearest burning object closest to the player
	    var burning_object = null;
	    var burning_distance = 10000;
	    with ( enemyBase )
	    {
	        if ( isBurning )
	        {
	            var dist = point_distance(x,y,objPlayerMain.x,objPlayerMain.y);
	            if ( dist < burning_distance ) {
	                burning_object = id;
	                burning_distance = dist;
	            }
	        }
	    }
	    with ( splatterGoo )
	    {
	        if ( isBurning )
	        {
	            var dist = point_distance(x,y,objPlayerMain.x,objPlayerMain.y);
	            if ( dist < burning_distance ) {
	                burning_object = id;
	                burning_distance = dist;
	            }
	        }
	    }
	    faFireLoopObject = burning_object;
	}

	if ( iexists(faFireLoopObject) && faFireLoopObject.isBurning )
	{   // Move sound to the closest burning object
	    faFireLoop.x = faFireLoopObject.x;
	    faFireLoop.y = faFireLoopObject.y;
	    faFireLoop.gain = min( 1.0, faFireLoop.gain + Time.dt*3.0 );
	    with (faFireLoop)
	    {
	        audio_emitter_gain(emitter, gain);
	        audio_emitter_position(emitter, x, y, 0);
	    }
	}
	else
	{
	    faFireLoop.gain = max( 0.0, faFireLoop.gain - Time.dt*3.0 ); 
	    with (faFireLoop)
	    {
	        audio_emitter_gain(emitter, gain);
	    }
	}
}

// Update the map visibility
{
	var pl = GetActivePlayer();
	
	// get center of map
	//var room_info = rooms_info[room]; // dangerous. need to make it a list
	if (iexists(pl) && room < array_length_1d(rooms_info))
	{
		var room_info = rooms_info[room];
		if (is_array(room_info) && array_length_1d(room_info) > 0)
		{
			var room_info_min = room_info[0];
			var room_info_max = room_info[1];
	
			// get position of player
			var pl_pos_percent = [
				pl.x / room_width,
				pl.y / room_height
				];
			var pl_pos_grid = [
				room_info_min[0] + (room_info_max[0] - room_info_min[0]) * pl_pos_percent[0],
				room_info_min[1] + (room_info_max[1] - room_info_min[1]) * pl_pos_percent[1]
				];
		
			// mark the current cel as accessed
			var indexer = floor(pl_pos_grid[0]) + floor(pl_pos_grid[1]) * map_width;
			if (map[indexer] == room)
			{
				map_visibility[indexer] = kMapCelVisVisited;
			}
		}
	}
}
