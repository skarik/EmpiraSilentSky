/// @description Set initial step

m_angle = radtodeg(arcsin(clamp(image_xscale * 0.5, -1.0, 1.0)));

m_closing = false;
m_opening = false;
m_angleStart = 0;
m_angleSpeed = 0;

m_collider = null;