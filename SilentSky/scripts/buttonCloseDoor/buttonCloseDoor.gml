var door = argument0;
with (door)
{
	m_closing = false;
	m_opening = false;
	m_angleSpeed = 0;
	m_angle = 0;
	
	if (!exists(m_collider))
	{
		m_collider = instance_create(x, y, blox32x);
		m_collider.image_yscale = 3;
		m_collider.image_xscale = 0.125;
		m_collider.x -= m_collider.sprite_width * 0.5;
	}
}