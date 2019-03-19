/// @description AI_NodeCombine(node1,node2)
/// @param node1
/// @param node2

var node1 = argument0;
var node2 = argument1;

if (node1 == node2) return node1;

node1.type |= node2.type;
for (var i = 0; i < node2.links; ++i)
{
    if (!AI_NodeHasLink(node1,node2.link[i]))
    {
        node1.link[node1.links] = node2.link[i];
        node1.links++;
    }
}
node1.x = (node1.x + node2.x) / 2;
node1.y = (node1.y + node2.y) / 2;

delete(node2);
return node1;

