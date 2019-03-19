/// @description AI_Pathfind_NNearestNode(x,y,N)
/// @param x
/// @param y
/// @param N
var priority = ds_priority_create();

var sx = argument0;
var sy = argument1;
with (aiPathNode)
{
    var sqrdist = sqr(x-sx) + sqr( (y-sy)*4.0 );
    ds_priority_add(priority, id, sqrdist);
}

var N = argument2;
for (var i = 0; i < N; ++i)
{
    ds_priority_delete_min(priority);
}
var result = ds_priority_find_min(priority);
ds_priority_destroy(priority);

return result;
