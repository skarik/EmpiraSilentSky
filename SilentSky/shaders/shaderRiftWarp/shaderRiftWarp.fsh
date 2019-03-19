//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D uSpriteOverride;
uniform vec4 uPulseInfo;

float rand(vec2 co)
{
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void main()
{
    //vec2 rounded_coord = floor(v_vTexcoord * 512.0) / 512.0;
    
    // Create the noise
    float offset_horizontal = (rand(v_vTexcoord.yy + uPulseInfo.xx*0.002) - 0.5)* uPulseInfo.y;
    float offset_random = (rand(v_vTexcoord.yx + uPulseInfo.xx) - 0.5) * uPulseInfo.z;
    
    vec2 texoffset = vec2(offset_horizontal,offset_random);
    
    // Smallify offset
    texoffset *= 0.01;
    // Do final sample
    texoffset += v_vTexcoord;
    texoffset = clamp(texoffset, 0.0, 1.0);
    gl_FragColor = v_vColour * texture2D( uSpriteOverride, texoffset );
}

