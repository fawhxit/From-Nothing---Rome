/// @description Update Room W/H & Surface

try {
	
	room_width  = ww
	room_height = wh
	surface_resize(application_surface,ww,wh)
	
} catch(_ex) {
	
	show_debug_message("Meta Room Init: Surface Resize Err!"
		+"\nExpected if minimized window.")
	show_debug_message(_ex)
	alarm[1] = 2
	
}