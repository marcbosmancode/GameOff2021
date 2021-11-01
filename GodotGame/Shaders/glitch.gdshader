shader_type canvas_item;
render_mode unshaded;

uniform sampler2D displace : hint_albedo;
uniform float dispAmt : hint_range(0, 0.1);
uniform float abberationAmt : hint_range(0, 0.1);

void fragment(){
	vec4 disp = texture(displace, SCREEN_UV);
	vec2 newUV = SCREEN_UV + disp.xy * dispAmt;
	
	COLOR.r = texture(SCREEN_TEXTURE, newUV - abberationAmt).r;
	COLOR.g = texture(SCREEN_TEXTURE, newUV).g;
	COLOR.b = texture(SCREEN_TEXTURE, newUV + abberationAmt).b;
}