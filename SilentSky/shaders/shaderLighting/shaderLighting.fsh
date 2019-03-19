//
// Scene lighting fragment shader
//
varying vec2 v_vTexcoord;

// Input needed is the lighting sampler
uniform sampler2D samplerLighting;
uniform vec4 uAmbientColor;

void main()
{
    // Sample both the scene and the lighting
    vec4 color_scene    = texture2D( gm_BaseTexture, v_vTexcoord );
    vec4 color_lighting = texture2D( samplerLighting, v_vTexcoord );

    // Pull scene's alpha to keep the alpha-masking for effects
    color_lighting.rgb = mix((uAmbientColor.rgb + vec3(0.5,0.5,0.5)) * 0.5, color_lighting.rgb, color_scene.a);

    // Use soft lighting type color blending
    //color_scene += (color_scene + 0.5) * (color_lighting - 0.5) * 2.0;
    // That lighting is incorrect.
    // We need lighting that:
    //     smallifies the lighting offset if the starting color is close to the target color
    vec4 lighting_biased = (color_lighting - 0.5) * 2.0;
    vec4 color_biased = (color_scene - 0.5) * 2.0;
    
    float lighting_pos = (lighting_biased.x + lighting_biased.y + lighting_biased.z) / 3.0;
    float color_pos = (color_biased.x + color_biased.y + color_biased.z) / 3.0;
    
    //color_scene += (color_scene + 0.5) * lighting_biased;
    //color_scene += (color_scene + 0.5) * lighting_biased * (1.0 - max(color_biased * lighting_biased, 0.0));
    color_scene += (color_scene + 0.5) * lighting_biased * clamp(1.0 - 2.0 * lighting_pos * color_pos, 0.0, 1.0);
    
    // Clamp and set proper alpha
    gl_FragColor.rgb = clamp(color_scene.rgb, 0.0, 1.0);
    gl_FragColor.a = 1.0;
}

