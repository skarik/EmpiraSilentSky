/// @description Motion!

if (m_closing)
{
	var delta = m_angleSpeed * Time.deltaTime;
	if (abs(delta) > abs(m_angle))
	{
		delta = -m_angle;
	}
	m_angle += delta;
	
	// On close
	if (m_angle == 0)
	{
		if (!iexists(m_collider))
		{
			m_collider = instance_create(x, y, blox32x);
			m_collider.image_yscale = 3;
			m_collider.image_xscale = 0.125;
			m_collider.x -= m_collider.sprite_width * 0.5;
		}
		
		Effect_ScreenShake(4.0, 0.5, true);
		
		m_closing = false;
		m_angleSpeed = 0.0;
	}
}
else if (m_opening)
{	
	var delta = m_angleSpeed * Time.deltaTime;
	
	// Check if will hit wall
	if (abs(m_angle + delta) > 90)
	{
		m_opening = false;
		m_angle = sign(m_angle) * 90;
		m_angleSpeed = -m_angleSpeed * 0.2;
		
		delta = 0;
		
		Effect_ScreenShake(2.0, 0.05, false);
	}
	
	// Perform door motion
	m_angle += delta;
}
else
{
	var delta = -sign(m_angleSpeed) * 200 * Time.deltaTime;
	if (abs(delta) > abs(m_angleSpeed))
		delta = -m_angleSpeed;
	m_angleSpeed += delta;
	
	// And rotate the door
	m_angle += m_angleSpeed * Time.deltaTime;
}

// Update the bounding box
image_xscale = sin(degtorad(m_angle)) * 2.0;
// Find nearest character that is moving towards the door
var nearest_char = null;
var nearest_dist = 1024;
var door = id;
with (enemyBase)
{
	var next_dist = (sqr(x - door.x) + sqr(y - door.y)) + (xspeed * sign(x - door.x));;
	if (nearest_char == null || next_dist < nearest_dist)
	{
		nearest_char = id;
		nearest_dist = next_dist;
	}
}
if (iexists(nearest_char))
{
	image_xscale += sign(nearest_char.x - x) * 0.25;
}