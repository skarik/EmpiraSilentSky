/// @description AI_HasVisionLine(x1,y1,x2,y2)
/// @param x1
/// @param y1
/// @param x2
/// @param y2

var col = collision_line(argument0,argument1,argument2,argument3, bloxBase, false, true);
if (iexists(col)) return false;
return true;

