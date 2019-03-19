
var sx = argument0;
var sy = argument1;
var nearest_node = null;
var nearest_dist = 10000*10000;
with (aiPathNode)
{
    var sqrdist = sqr(x-sx) + sqr( (y-sy)*4.0 );
    if (sqrdist < nearest_dist)
    {
        nearest_dist = sqrdist;
        nearest_node = id;
    }
}
return nearest_node;

