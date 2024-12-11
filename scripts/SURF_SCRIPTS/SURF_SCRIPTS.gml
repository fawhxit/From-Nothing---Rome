// surfL element is array: [surface,xy4,wh] == sArr
function open_surface(inst,xy4) {
	
	// Sanity
	if(!isl(inst.surfL,f))
		inst.surfL = ds_list_create()
		
	// Init wh
	var wd,ht
	wd = xy4[2]-xy4[0]
	ht = xy4[3]-xy4[1]
	
	// Make Surface Array (sArr: surface,xy4,wh)
	ds_list_add(inst.surfL,[surface_create(max(wd,1),max(ht,1)),xy4,[wd,ht]])
	var ret = list_pop(inst.surfL)
	
	// Set Target + Return
	surface_set_target(ret[0])
	return ret
	
}

function apply_surface(inst,sArr) {
	
	try {
		
		// Draw Surface to Application Surface
		surface_reset_target()
		draw_set_alpha(1)
		draw_surface(sArr[0],sArr[1][0],sArr[1][1])
		
		// Free and Finish
		surface_free(sArr[0])
		return t
		
	} catch(_ex) {
		
		try {
			
			// Ensure Surface Freed
			surface_free(sArr[0])
			
		} catch(_ex) {}
		
		// Exception Print
		show_debug_message("Unable to apply surface!")
		show_debug_message(_ex)
		return f
		
	}
	
}

function surface_list_destroy(surfL) {
	
	if(isl(surfL,f)) {
		
		var sz = ds_list_size(surfL)
		for(var i = 0; i < sz; i++)
			try { surface_free(surfL[|i]) }
			catch (_ex) { show_debug_message("Couldn't Destroy Surface in List!",string(_ex)) }
		ds_list_destroy(surfL)
		
	}
	
}