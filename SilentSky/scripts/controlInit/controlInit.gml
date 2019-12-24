#macro kControlUvStyle_Mouse 0
#macro kControlUvStyle_FakeMouse 1 
#macro kControlUvStyle_Unused 2

#macro kControlGamepad_XInput 0
#macro kControlGamepad_Playstation 1
#macro kControlGamepad_Generic 2

#macro kControlChoice_Margin 0.33

xAxis	= _controlStructCreate();
yAxis	= _controlStructCreate();

jumpButton	= _controlStructCreate();
atkButton	= _controlStructCreate();
dodgeButton	= _controlStructCreate();
useButton	= _controlStructCreate();
specialButton	= _controlStructCreate();
prevCharButton	= _controlStructCreate();
nextCharButton	= _controlStructCreate();
tabButton	= _controlStructCreate();
escButton	= _controlStructCreate();

lastControlType = kControlKB;
lastGamepadName = gamepad_get_description(0);
lastGamepadType = (string_count("xinput", string_lower(lastGamepadName)) > 0) ? kControlGamepad_XInput : kControlGamepad_Generic;