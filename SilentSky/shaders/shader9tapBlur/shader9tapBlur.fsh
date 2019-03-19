//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;

void main()
{
    vec2 pixelSize = vec2(0.0125,0.0125);
    /*vec2 blurOffset [9] = {
        vec2(-1.0,-1.0) * pixelSize,
        vec2( 0.0,-1.0) * pixelSize,
        vec2(+1.0,-1.0) * pixelSize,
        vec2(-1.0, 0.0) * pixelSize,
        vec2( 0.0, 0.0) * pixelSize,
        vec2(+1.0, 0.0) * pixelSize,
        vec2(-1.0,+1.0) * pixelSize,
        vec2( 0.0,+1.0) * pixelSize,
        vec2(+1.0,+1.0) * pixelSize
    };
    float blurStrength [9] = {
        0.707, 1.0,  0.707,
        1.0,   1.41, 1.0,
        0.707, 1.0,  0.707
    };*/
    
    vec2 blurOffset [9];
    blurOffset[0] = vec2(-1.0,-1.0) * pixelSize;
    blurOffset[1] = vec2( 0.0,-1.0) * pixelSize;
    blurOffset[2] = vec2(+1.0,-1.0) * pixelSize;
    blurOffset[3] = vec2(-1.0, 0.0) * pixelSize;
    blurOffset[4] = vec2( 0.0, 0.0);
    blurOffset[5] = vec2(+1.0, 0.0) * pixelSize;
    blurOffset[6] = vec2(-1.0,+1.0) * pixelSize;
    blurOffset[7] = vec2( 0.0,+1.0) * pixelSize;
    blurOffset[8] = vec2(+1.0,+1.0) * pixelSize;
    
    float blurStrength [9];
    blurStrength[0] = 0.707;
    blurStrength[1] = 1.0;
    blurStrength[2] = 0.707;
    blurStrength[3] = 1.0;
    blurStrength[4] = 1.414;
    blurStrength[5] = 1.0;
    blurStrength[6] = 0.707;
    blurStrength[7] = 1.0;
    blurStrength[8] = 0.707;
    
    vec4 col = vec4(0,0,0,0);
    
    for (float i = 0.0; i < 2.2; i += 1.0)
    {
        float mul_dist = 1.0 + i;
        float mul_str = 1.0 / pow(2.0, i);
        col += texture2D( gm_BaseTexture, v_vTexcoord + blurOffset[0]*mul_dist ) * blurStrength[0] * mul_str;
        col += texture2D( gm_BaseTexture, v_vTexcoord + blurOffset[1]*mul_dist ) * blurStrength[1] * mul_str;
        col += texture2D( gm_BaseTexture, v_vTexcoord + blurOffset[2]*mul_dist ) * blurStrength[2] * mul_str;
        col += texture2D( gm_BaseTexture, v_vTexcoord + blurOffset[3]*mul_dist ) * blurStrength[3] * mul_str;
        col += texture2D( gm_BaseTexture, v_vTexcoord + blurOffset[4]*mul_dist ) * blurStrength[4] * mul_str;
        col += texture2D( gm_BaseTexture, v_vTexcoord + blurOffset[5]*mul_dist ) * blurStrength[5] * mul_str;
        col += texture2D( gm_BaseTexture, v_vTexcoord + blurOffset[6]*mul_dist ) * blurStrength[6] * mul_str;
        col += texture2D( gm_BaseTexture, v_vTexcoord + blurOffset[7]*mul_dist ) * blurStrength[7] * mul_str;
        col += texture2D( gm_BaseTexture, v_vTexcoord + blurOffset[8]*mul_dist ) * blurStrength[8] * mul_str;
    }
    col /= col.a; // Average out the samples now
    
    gl_FragColor = col;
}

