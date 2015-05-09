// Vertex shader inputs
varying highp vec4 FS_UV;

uniform sampler2D VideoTexture;
uniform sampler2D RampTexture0;
uniform sampler2D RampTexture1;

uniform highp float Alpha;
uniform highp float SharpenStrength;
uniform highp vec2 AspectRatio;
uniform highp vec2 SourceScale;
uniform sampler2D VignetteFalloff;
uniform mediump float UserParam;

void main(void)
{
	lowp vec3 source = sampleSharpened(VideoTexture, FS_UV.xy, SourceScale, SharpenStrength);
	lowp vec3 final = lookup3D_16(RampTexture0, source);
	gl_FragColor = vec4(mix(source, final.xyz, UserParam), compute_alpha(Alpha, FS_UV.z));
}