#macro kControlKB		0
#macro kControlMouse	1 
#macro kControlGamepad	2

#macro kMouseWheelUp	0x101
#macro kMouseWheelDown	0x102

#macro kGamepadTypeXbox			0
#macro kGamepadTypeDualshock	1
#macro kGamepadTypeGeneric		2

with (Settings)
{
    ctJump          = [kControlKB, ord("Z"),	kControlGamepad, gp_face1];
    ctMelee         = [kControlKB, ord("X"),	kControlGamepad, gp_face3];
	ctInteract      = [kControlKB, ord("X"),	kControlGamepad, gp_face3];
    ctDodge         = [kControlKB, ord("A"),	kControlGamepad, gp_face2];
    ctSpecial       = [kControlKB, ord("S"),	kControlGamepad, gp_face4];
    ctSwapLeft      = [kControlKB, ord("Q"),	kControlGamepad, gp_shoulderl];
    ctSwapRight     = [kControlKB, ord("W"),	kControlGamepad, gp_shoulderr];
    
    ctMoveLeft      = [kControlKB, vk_left,		kControlGamepad, -gp_axislh];
    ctMoveRight     = [kControlKB, vk_right,	kControlGamepad, gp_axislh];
    ctMoveUp        = [kControlKB, vk_up,		kControlGamepad, -gp_axislv];
    ctMoveDown      = [kControlKB, vk_down,		kControlGamepad, gp_axislv];
}

