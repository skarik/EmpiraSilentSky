/// @description spawn swords

for (var i = 0; i < 2; ++i)
{
	if (!exists(m_sword[i]) && instance_number(o_throwableSword) < 6)
	{
		m_sword[i] = instance_create(x + 4 + 16 * i, y, o_throwableSword);
		m_sword[i].image_angle = 90;
	}
}