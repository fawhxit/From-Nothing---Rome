function sprite_get_window_scale(spr) {
	
	try {
		
		var sprw = sprite_get_width(spr)
		var sprh = sprite_get_height(spr)
		var sclw = ww/sprw
		var sclh = wh/sprh
		
		return max(sclw,sclh)
		
	} catch(_ex) {
		
		show_debug_message("Sprite Scale to Window Err!")
		show_debug_message(_ex)
		
	}
	
	return 1
	
}

function sprite_get_room_scale(spr) {
	
	try {
		
		var sprw = sprite_get_width(spr)
		var sprh = sprite_get_height(spr)
		
		if(sprw >= sprh) {
			
			// Horizontal/Width Scale
			return room_width/sprw
			
		} else {
			
			// Vertical/Height Scale
			return room_height/sprh
			
		}
		
	} catch(_ex) {
		
		show_debug_message("Sprite Scale to Room Err!")
		show_debug_message(_ex)
		
	}
	
	return 1
	
}