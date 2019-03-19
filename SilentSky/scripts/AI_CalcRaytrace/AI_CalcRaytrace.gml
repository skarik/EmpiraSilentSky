/// @description AI_CalcRaytrace(angleoffset)
/// @param angleoffset
var dir = argument0;
var ofx = sprite_width * 0.125;
pos_finder( x+ofx,y-24, 90 + (-90+dir)*image_xscale, 192, bloxBase, true, true);
