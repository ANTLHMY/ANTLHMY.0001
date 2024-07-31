shader_type canvas_item;


void fragment() {
	vec4 texture_color = texture(TEXTURE,UV);
	if (texture_color.a>0.5){
		if (texture_color.r>0.5){
			if (texture_color.g>0.5){
				if (texture_color.b>0.5){
					COLOR.a=0.0;
				}
			}
		}
	}

}


