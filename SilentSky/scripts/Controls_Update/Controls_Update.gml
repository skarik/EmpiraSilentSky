var isPlayer = argument0;

// Update previous state
xAxisPrev = xAxis;
yAxisPrev = yAxis;

zButtonPrev = zButton;
xButtonPrev = xButton;
aButtonPrev = aButton;
sButtonPrev = sButton;
//altButtonPrev = altButton;
lButtonPrev = lButton;
rButtonPrev = rButton;
tabButtonPrev = tabButton;
escButtonPrev = escButton;

if ( !isPlayer )
{
    //Controls_Init();
    // Nothing.
}
else if ( window_has_focus() )
{
    // Keyboard input:
    xAxis = keyboard_check(Settings.ctMoveRight) - keyboard_check(Settings.ctMoveLeft) +
            keyboard_check(vk_right) - keyboard_check(vk_left);
    yAxis = keyboard_check(Settings.ctMoveDown) - keyboard_check(Settings.ctMoveUp) +
            keyboard_check(vk_down) - keyboard_check(vk_up);
    
    zButton = keyboard_check(Settings.ctJump);
    xButton = keyboard_check(Settings.ctMeleeInteract);
    aButton = keyboard_check(Settings.ctDodge);
    sButton = keyboard_check(Settings.ctSpecial);
    
    //altButton = keyboard_check(vk_alt);
    lButton = keyboard_check(Settings.ctSwapLeft);
    rButton = keyboard_check(Settings.ctSwapRight);
    tabButton = keyboard_check(vk_tab);
    escButton = keyboard_check(vk_escape);
    
    // Added Xbox input:
    var gp_index = 0;
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
    }
    
    // And limit the axis values
    xAxis = clamp(xAxis,-1,+1);
    yAxis = clamp(yAxis,-1,+1);
}
else
// No window focus?
{   // Reset the controls
    Controls_Init();
}
