/// @description AI_NodeReexamine(node)
/// @param node
// Looks at links of a node and makes sure they're all visible

var node = argument0;

for (var i = 0; i < node.links; ++i)
{
    var link = node.link[i];
    if ( !exists(link) )
    {
        // Remove this link
        AI_NodeRemoveLinkIndex(node,i);
        i -= 1;
        continue;
    }

    // Check for vision
    var vision_n1 = AI_HasVisionLine(link.x, link.y - 8, node.x, node.y - 8);
    var vision_0 = AI_HasVisionLine(link.x, link.y, node.x, node.y);
    var vision_p1 = AI_HasVisionLine(link.x, link.y + 8, node.x, node.y + 8);
    
    // Valid link if any are in sight
    if ( vision_n1 || vision_0 || vision_p1 ) continue;
    
    // Otherwise remove this link
    AI_NodeRemoveLinkIndex(node,i);
    i -= 1;
    continue;
}
