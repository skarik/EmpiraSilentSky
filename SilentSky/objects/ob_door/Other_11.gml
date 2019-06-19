/// @description Shut door or kick it open

if (!m_closing && !m_opening)
{
	if (m_angle != 0)
	{
		// If player on same side of the door
		if (sign(m_angle) == sign(user.x - x))
		{
			// Closing. Set the speed where we slam that door
			m_closing = true;
		
			m_angleStart = m_angle;
			m_angleSpeed = -sign(m_angle) * 600.0;
		}
	}
	else
	{
		// Kick the door open
		m_opening = true;
		m_angleSpeed = sign(user.x - x) * -600.0;
		
		// Shake on kick open
		Effect_ScreenShake(4.0, 0.05, false);
		
		// Delete any collider
		if (exists(m_collider))
		{
			delete(m_collider);
		}
	}
}