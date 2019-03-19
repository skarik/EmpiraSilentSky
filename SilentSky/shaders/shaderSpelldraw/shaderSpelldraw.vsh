
attribute vec3 in_Position;                  // (x,y,z)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec2 v_vWorldCoord;

uniform vec4 uViewInfo;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    v_vTexcoord = in_TextureCoord;
    v_vWorldCoord = ((gl_Position.xy + vec2(1.0,1.0)) * 0.5 * uViewInfo.zw) + uViewInfo.xy;
}

