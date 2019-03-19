var c = argument0;
switch (c)
{
    case vk_left:       return "Left";
    case vk_right:      return "Right";
    case vk_up:         return "Up";
    case vk_down:       return "Down";
    case vk_space:      return "Space";
    
    default:        return chr(c);
}

