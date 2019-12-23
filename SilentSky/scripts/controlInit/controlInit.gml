#macro kControlUvStyle_Mouse 0
#macro kControlUvStyle_FakeMouse 1 
#macro kControlUvStyle_Unused 2

#macro kControlGamepad_XInput 0
#macro kControlGamepad_Playstation 1
#macro kControlGamepad_Generic 2

#macro kControlChoice_Margin 0.33

xAxis = _controlStructCreate();
yAxis = _controlStructCreate();

zButton = _controlStructCreate();
xButton = _controlStructCreate();
aButton = _controlStructCreate();
sButton = _controlStructCreate();
lButton = _controlStructCreate();
rButton = _controlStructCreate();
tabButton = _controlStructCreate();
escButton = _controlStructCreate();

lastControlType = kControlKB;
lastGamepadName = gamepad_get_description(0);
lastGamepadType = (string_count("xinput", string_lower(lastGamepadName)) > 0) ? kControlGamepad_XInput : kControlGamepad_Generic;