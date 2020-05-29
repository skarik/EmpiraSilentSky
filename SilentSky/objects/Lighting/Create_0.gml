if (singleton_this()) exit; // Make this object a singleton
// Only enable lighting if shaders supported
if (!shaders_are_supported())
{
    idelete(this);
    exit;
}

// Current lighting settings
ambient = make_color_rgb(100,110,105);//make_color_rgb(128,100,200)
maskbg = false;

// Lighting properties
cel_resolution = 16; // Pixels per cel
cel_count = 5;      // Width of rendering area, in cels
cel_size = 256;     // Width of a single rendering cel

cel_renderX = 0;
cel_renderY = 0;
cel_renderXp = 0;
cel_renderYp = 0;

// Local variables
surf_lighting = -1;
surf_lighting2 = -1;
surf_lighting_tap1 = -1;
surf_lighting_tap2 = -1;
surf_lighting_game = -1;

// Blending info
li_updateTimeInterval = 0.1;
li_updateTimer = li_updateTimeInterval;
li_updateNow = false;
li_blendTimer = 1.0;

// Shader sampler info
uni_samplerLighting = shader_get_sampler_index( shaderLighting, "samplerLighting" );
uni_ambientColor = shader_get_uniform( shaderLighting, "uAmbientColor" );

// Create bg dropper
inew(lightingalphadrop);

