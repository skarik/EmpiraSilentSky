/// @func controlUpdate(isPlayer)
/// @desc Updates all input from keyboard or what have you
/// @param isPlayer {boolean}
var isPlayer = argument0;

//// Update previous state
//xAxisPrev = xAxis;
//yAxisPrev = yAxis;
//
//zButtonPrev = zButton;
//xButtonPrev = xButton;
//aButtonPrev = aButton;
//sButtonPrev = sButton;
////altButtonPrev = altButton;
//lButtonPrev = lButton;
//rButtonPrev = rButton;
//tabButtonPrev = tabButton;
//escButtonPrev = escButton;

if ( !isPlayer )
{
    //controlInit();
    // Nothing.
}
// Is player and has focus?
else if ( window_has_focus() )
{
    // Keyboard input:
    //xAxis = keyboard_check(Settings.ctMoveRight) - keyboard_check(Settings.ctMoveLeft) +
    //        keyboard_check(vk_right) - keyboard_check(vk_left);
	_controlStructUpdate(xAxis, -controlParseAndPoll(Settings.ctMoveLeft) + controlParseAndPoll(Settings.ctMoveRight));
    //yAxis = keyboard_check(Settings.ctMoveDown) - keyboard_check(Settings.ctMoveUp) +
    //        keyboard_check(vk_down) - keyboard_check(vk_up);
	_controlStructUpdate(yAxis, -controlParseAndPoll(Settings.ctMoveUp) + controlParseAndPoll(Settings.ctMoveDown));
    
    //zButton = keyboard_check(Settings.ctJump);
    //xButton = keyboard_check(Settings.ctMeleeInteract);
    //aButton = keyboard_check(Settings.ctDodge);
    //sButton = keyboard_check(Settings.ctSpecial);
	
	_controlStructUpdate(zButton, controlParseAndPoll(Settings.ctJump));
	_controlStructUpdate(xButton, controlParseAndPoll(Settings.ctMeleeInteract));
	_controlStructUpdate(aButton, controlParseAndPoll(Settings.ctDodge));
	_controlStructUpdate(sButton, controlParseAndPoll(Settings.ctSpecial));
    
    //altButton = keyboard_check(vk_alt);
    //lButton = keyboard_check(Settings.ctSwapLeft);
    //rButton = keyboard_check(Settings.ctSwapRight);
    //tabButton = keyboard_check(vk_tab);
    //escButton = keyboard_check(vk_escape);
    
	_controlStructUpdate(lButton, controlParseAndPoll(Settings.ctSwapLeft));
	_controlStructUpdate(rButton, controlParseAndPoll(Settings.ctSwapRight));
	_controlStructUpdate(tabButton, keyboard_check(vk_tab));
	_controlStructUpdate(escButton, keyboard_check(vk_escape));
	
    // Added Xbox input:
    /*var gp_index = 0;
    if ( gamepad_is_supported() && gamepad_is_connected(gp_index) )
    {
        xAxis += deadzone_bias(gamepad_axis_value(gp_index, gp_axislh)) +
                 gamepad_button_value(gp_index, gp_padr) - gamepad_button_value(gp_index, gp_padl);
        yAxis += deadzone_bias(gamepad_axis_value(gp_index, gp_axislv)) +
                 gamepad_button_value(gp_index, gp_padd) - gamepad_button_value(gp_index, gp_padu);
        
        zButton += gamepad_button_value(gp_index, gp_face1);
        xButton += gamepad_button_value(gp_index, gp_face3);
        aButton += gamepad_button_value(gp_index, gp_face2);
        sButton += gamepad_button_value(gp_index, gp_face4);
        
        //altButton += gamepad_button_value(gp_index, gp_shoulderr) + gamepad_button_value(gp_index, gp_shoulderl);
        lButton += gamepad_button_value(gp_index, gp_shoulderl);
        rButton += gamepad_button_value(gp_index, gp_shoulderr);
        tabButton += gamepad_button_value(gp_index, gp_select);
        escButton += gamepad_button_value(gp_index, gp_start);
    }*/
    
    // And limit the axis values
    xAxis = clamp(xAxis,-1,+1);
    yAxis = clamp(yAxis,-1,+1);
}
// Is player and no window focus? 
else
{   // Reset the controls
	_controlStructUpdate(xAxis, 0.0);
}
