/// @description  smoothstep_u(x)
/// @param x
//
//  UNLIMITED SMOOTHSTEP PIERCES THE HEAVENS
//
//      a           upper bound, real
//      b           lower bound, real
//      x           value, real
//
/// GMLscripts.com/license
{
    var p;
    p = argument0;
    return (p * p * (3 - 2 * p));
}
