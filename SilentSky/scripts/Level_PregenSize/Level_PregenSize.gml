// Sets the variables "width" and "height" for the level

width = 5;
height = 4;

width += choose(-2,-1,0,+1,+2);
height += choose(-2,-1,0,+1,+2);
if ( width > 5 )
{   // The wider it is, the shorter it is
    height = min(height, 4 - (width-5));
}

