//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying float v_vAlpha;

void main()
{
    float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a * v_vAlpha;
    gl_FragColor = vec4(0.5, 0.5, 0.5, alpha);
}

