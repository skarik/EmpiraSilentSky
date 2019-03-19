
varying vec2 v_vTexcoord;
varying vec2 v_vWorldCoord;

uniform sampler2D usTexNoise;

uniform vec4 uViewInfo;
uniform vec2 uTexNoiseSize;
uniform vec4 uFadeoutStrength;
uniform vec4 uBlendColor;

void main()
{
    // Sample the warp texture using gl_FragCoord and view offset
    vec4 noise_tex = texture2D( usTexNoise, v_vWorldCoord / uTexNoiseSize );
    noise_tex.r = sin(v_vWorldCoord.x * 0.067) + cos(v_vWorldCoord.y * 0.053)
                + sin(v_vWorldCoord.y * 0.167) + cos(v_vWorldCoord.x * 0.093);
    noise_tex.r = (noise_tex.r * 0.125) + 0.5;
    noise_tex.g = sin(v_vWorldCoord.x * 0.052) + cos(v_vWorldCoord.y * 0.064)
                + sin(v_vWorldCoord.y * 0.089) + cos(v_vWorldCoord.x * 0.113);
    noise_tex.g = (noise_tex.g * 0.125) + 0.5;
    
    noise_tex = noise_tex * 0.9 + 0.05;
    
    // Now we need the fadeout amount
    float fade_strength = uFadeoutStrength.x - noise_tex.r;
    if (fade_strength > 0.0) discard;
    
    float dispel_strength = uFadeoutStrength.y - noise_tex.g;
    if (dispel_strength > 0.0) discard;
    
    // Set up non-effected spell gfx
    vec4 pixelColor = texture2D( gm_BaseTexture, v_vTexcoord );
    pixelColor.rgb *= uBlendColor.rgb;
    float pixelAlpha = uBlendColor.a * pixelColor.a;
    
    // Set up dispel glow effect
    pixelColor.rgb = mix(
        pixelColor.rgb, vec3(1.0, 0.4, 0.0),
        clamp(1.0 + (dispel_strength + 0.05) * 64.0, 0.0, 1.0) );
        
    // Set up fade effect
    pixelAlpha = mix(
        pixelAlpha, 0.0,
        clamp(1.0 + fade_strength * 16.0, 0.0, 1.0) );
    
    // Alpha blending:
    pixelColor.rgb *= pixelAlpha;
    // Final color:
    gl_FragColor = vec4(pixelColor.rgb, pixelAlpha);
}

