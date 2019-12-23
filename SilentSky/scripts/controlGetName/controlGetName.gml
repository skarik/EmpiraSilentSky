/// @description controlGetName(control_type, control)
/// @param control_type
/// @param control

var ctype = argument0;
var c = argument1;

if (ctype == kControlKB)
{
	switch (c)
	{
	    case vk_left:       return "Left";
	    case vk_right:      return "Right";
	    case vk_up:         return "Up";
	    case vk_down:       return "Down";
		
	    case vk_space:      return "Space";
		case vk_return:		return "Enter";
		case vk_escape:		return "Escape";
		case vk_tab:		return "Tab";
		case vk_backspace:	return "Backspace";
		case vk_delete:		return "Delete";
		case vk_pageup:		return "Page Up";
		case vk_pagedown:	return "Page Down";
		
		case vk_lcontrol:	return "Left Control";
		case vk_rcontrol:	return "Right Control";
		case vk_lshift:		return "Left Shift";
		case vk_rshift:		return "Right Shift";
		case vk_lalt:		return "Left Alt";
		case vk_ralt:		return "Right Alt";
    
	    default:        return chr(c);
	}
}
else if (ctype == kControlGamepad)
{
	var generic = (ctrl_type == kGamepadTypeGeneric);
	var ds = (ctrl_type == kGamepadTypeDualshock);
	
	switch (c)
	{
		case gp_face1:		return generic ? "Button 1" : (ds ? "Cross" : "A");
		case gp_face2:		return generic ? "Button 2" : (ds ? "Circle" : "B");
		case gp_face3:		return generic ? "Button 3" : (ds ? "Square" : "X");
		case gp_face4:		return generic ? "Button 4" : (ds ? "Triangle" : "Y");
		
		case gp_shoulderl:	return generic ? "L Shoulder" : (ds ? "L1" : "LB");
		case gp_shoulderr:	return generic ? "R Shoulder" : (ds ? "R1" : "RB");
		case gp_shoulderlb:	return generic ? "L Trigger" : (ds ? "L2" : "LT");
		case gp_shoulderrb:	return generic ? "R Trigger" : (ds ? "R2" : "RT");
		
		case gp_select:		return generic ? "Select" : (ds ? "PS Button" : "Listing");
		case gp_start:		return generic ? "Start" : (ds ? "Option" : "Option");
		
		case gp_stickl:		return generic ? "Left Stick" : (ds ? "L3 (Stick)" : "Left Stick");
		case gp_stickr:		return generic ? "Right Stick" : (ds ? "R3 (Stick)" : "Right Stick");
		case gp_axislh:		return "LS Horizontal";
		case gp_axislv:		return "LS Vertical";
		case gp_axisrh:		return "RS Horizontal";
		case gp_axisrv:		return "RS Vertical";
		
		case gp_padu:		return "D-pad Up";
		case gp_padd:		return "D-pad Down";
		case gp_padl:		return "D-pad Left";
		case gp_padr:		return "D-pad Right";
	}
}
else if (ctype == kControlMouse)
{
	switch (c)
	{
		case mb_left:		return "Left Mouse Button";
		case mb_right:		return "Right Mouse Button";
		case mb_middle:		return "Middle Mouse Button";
		case kMouseWheelUp:	return "Scroll Up";
		case kMouseWheelDown:	return "Scroll Down";
	}
}

return c;