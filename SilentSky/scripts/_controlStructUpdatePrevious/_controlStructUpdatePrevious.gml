/// @func _controlStructUpdatePrevious(DO NOT CALL)
/// @desc This function should not be called directly.
/// @param control {object}
var control = argument0;
var newValue = control.value; // No change to inputs

control.previous = control.value;
control.value = newValue;

var wasDown = control.down;
control.down = abs(control.value) > 0.707;

control.released = wasDown && !control.down;
control.pressed = !wasDown && control.down; // Might break something here. We need a virtual input board for AI to really work properly.