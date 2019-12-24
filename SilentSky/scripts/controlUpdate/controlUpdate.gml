/// @func controlUpdate(pollInputs)
/// @desc Updates all input from keyboard or what have you
/// @param pollInputs {boolean}
var pollInputs = argument0;

//// Update previous state
//xAxisPrev = xAxis;
//yAxisPrev = yAxis;
//
//jumpButtonPrev = jumpButton;
//atkButtonPrev = atkButton;
//dodgeButtonPrev = dodgeButton;
//specialButtonPrev = specialButton;
////altButtonPrev = altButton;
//prevCharButtonPrev = prevCharButton;
//nextCharButtonPrev = nextCharButton;
//tabButtonPrev = tabButton;
//escButtonPrev = escButton;

if ( !pollInputs )
{
    //controlInit();
    // Nothing.
	
	// Track previous values
	_controlStructUpdatePrevious(xAxis);
	_controlStructUpdatePrevious(yAxis);
	
	_controlStructUpdatePrevious(jumpButton);
	_controlStructUpdatePrevious(atkButton);
	_controlStructUpdatePrevious(useButton);
	_controlStructUpdatePrevious(dodgeButton);
	_controlStructUpdatePrevious(specialButton);
	
	_controlStructUpdatePrevious(prevCharButton);
	_controlStructUpdatePrevious(nextCharButton);
	_controlStructUpdatePrevious(tabButton);
	_controlStructUpdatePrevious(escButton);
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
    
    //jumpButton = keyboard_check(Settings.ctJump);
    //atkButton = keyboard_check(Settings.ctMeleeInteract);
    //dodgeButton = keyboard_check(Settings.ctDodge);
    //specialButton = keyboard_check(Settings.ctSpecial);
	
	_controlStructUpdate(jumpButton, controlParseAndPoll(Settings.ctJump));
	_controlStructUpdate(atkButton, controlParseAndPoll(Settings.ctMelee));
	_controlStructUpdate(useButton, controlParseAndPoll(Settings.ctInteract));
	_controlStructUpdate(dodgeButton, controlParseAndPoll(Settings.ctDodge));
	_controlStructUpdate(specialButton, controlParseAndPoll(Settings.ctSpecial));
    
    //altButton = keyboard_check(vk_alt);
    //prevCharButton = keyboard_check(Settings.ctSwapPrev);
    //nextCharButton = keyboard_check(Settings.ctSwapNext);
    //tabButton = keyboard_check(vk_tab);
    //escButton = keyboard_check(vk_escape);
    
	_controlStructUpdate(prevCharButton, controlParseAndPoll(Settings.ctSwapPrev));
	_controlStructUpdate(nextCharButton, controlParseAndPoll(Settings.ctSwapNext));
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
        
        jumpButton += gamepad_button_value(gp_index, gp_face1);
        atkButton += gamepad_button_value(gp_index, gp_face3);
        dodgeButton += gamepad_button_value(gp_index, gp_face2);
        specialButton += gamepad_button_value(gp_index, gp_face4);
        
        //altButton += gamepad_button_value(gp_index, gp_shoulderr) + gamepad_button_value(gp_index, gp_shoulderl);
        prevCharButton += gamepad_button_value(gp_index, gp_shoulderl);
        nextCharButton += gamepad_button_value(gp_index, gp_shoulderr);
        tabButton += gamepad_button_value(gp_index, gp_select);
        escButton += gamepad_button_value(gp_index, gp_start);
    }*/
    
    // And limit the axis values
    //xAxis = clamp(xAxis,-1,+1);
    //yAxis = clamp(yAxis,-1,+1);
}
// Is player and no window focus? 
else
{   // Reset the controls
	_controlStructUpdate(xAxis, 0.0);
	_controlStructUpdate(yAxis, 0.0);
	
	_controlStructUpdate(jumpButton, 0.0);
	_controlStructUpdate(atkButton, 0.0);
	_controlStructUpdate(useButton, 0.0);
	_controlStructUpdate(dodgeButton, 0.0);
	_controlStructUpdate(specialButton, 0.0);
	
	_controlStructUpdate(prevCharButton, 0.0);
	_controlStructUpdate(nextCharButton, 0.0);
	_controlStructUpdate(tabButton, 0.0);
	_controlStructUpdate(escButton, 0.0);
}
