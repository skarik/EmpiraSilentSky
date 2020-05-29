/// @description Sword pickup check

if (place_meeting(x, y, objPlayerPaladin))
{
	if (objPlayerPaladin.chSwordCount < objPlayerPaladin.chSwordCountMax)
	{
		objPlayerPaladin.chSwordCount += 1;
		idelete(this);
	}
}