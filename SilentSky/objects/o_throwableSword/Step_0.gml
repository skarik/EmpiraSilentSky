/// @description Motion or sitting

if (m_flying)
{
	// Apply gravity
	yspeed += (m_ricochet ? ygrav_ricochet : ygrav) * Time.deltaTime;
	
	// Do hitbox
	if (!m_ricochet)
	{
		event_user(1);
	}
	
	// Do ricochet spin
	if (m_ricochet)
	{
		image_angle += rspeed * Time.deltaTime;
	}
	else
	{
		r_additive += rspeed * Time.deltaTime;
		image_angle = point_direction(0, 0, xspeed, yspeed) + r_additive;
	}
	
	// Do collision
	var next_x = x + xspeed * Time.deltaTime;
	var next_y = y + yspeed * Time.deltaTime;
	if (place_meeting(next_x, next_y, bloxBase))
	{
		var push_dir = point_direction(0, 0, xspeed, yspeed);
		var push_max_distance = point_distance(0, 0, xspeed, yspeed);
		var push_total_distance = 0.0;
		var kPushStep = 2.0;
		var push_x = lengthdir_x(kPushStep, push_dir);
		var push_y = lengthdir_y(kPushStep, push_dir);
		
		// Move contact
		while (push_total_distance < push_max_distance + 10 && !place_meeting(x, y, bloxBase))
		{
			x += push_x;
			y += push_y;
			push_total_distance += kPushStep;
		}
		
		// Push into the hit wall a bit
		x += push_x * (8.0 / kPushStep);
		y += push_y * (8.0 / kPushStep);
		
		// No longer flying
		m_flying = false;
		m_ricochet = false;
		m_hitBlox = instance_nearest(next_x, next_y, bloxBase);
		
		// Stop motion
		rspeed = 0.0;
		xspeed = 0.0;
		yspeed = 0.0;
	}
	
	// Apply motion
	x += xspeed * Time.deltaTime;
	y += yspeed * Time.deltaTime;
}
else
{
	// Sword pickup
	event_user(4);
}