/// @description Surface Update

try {
	
	room_width  = ww
	room_height = wh
	surface_resize(application_surface,ww,wh)
	
} catch(_ex) {
	
	show_debug_message("Surface Update Err!"
		+"\nExpected if window minimized.")
	show_debug_message(_ex)
	alarm[1] = room_speed/2
	
}