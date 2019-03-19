/// @description AI_NodeRemoveLinkIndex(node, index)
/// @param node
/// @param  index
var node = argument0;
var index = argument1;

for (var i = index; i < node.links-1; ++i)
{
    node.link[i] = node.link[i+1];
}
node.links--;

