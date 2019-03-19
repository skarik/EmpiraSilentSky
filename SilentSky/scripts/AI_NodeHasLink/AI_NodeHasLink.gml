/// @description AI_NodeHasLink(node_to_check,node_link)
/// @param node_to_check
/// @param node_link

var node1 = argument0;
var node2 = argument1;

for (var k = 0; k < node1.links; ++k)
{
    if (node1.link[k] == node2)
    {
        return true;
    }
}
return false;

