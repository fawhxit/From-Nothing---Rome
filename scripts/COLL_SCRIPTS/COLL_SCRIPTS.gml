function touching(inst1,inst2) {
	
	try {
		
		// False if either instance doesn't exist
		if(!instance_exists(inst1)
			or !instance_exists(inst2))
			return f
		
		// Any Bounds overlapping?
		if((inst1.bbox_right >= inst2.bbox_left and inst1.bbox_left <= inst2.bbox_right)
			and (inst1.bbox_bottom >= inst2.bbox_top and inst1.bbox_top <= inst2.bbox_bottom))
			return t
		
	} catch(_ex) {
		
		show_debug_message("Touch Exception!")
		show_debug_message(_ex)
		
	}
	
	return f
	
}

function touching_xy4(inst1,inst2) {
	
	try {
		
		// False if either instance doesn't exist
		if(!instance_exists(inst1)
			or !instance_exists(inst2))
			return f
		
		// Any Bounds overlapping?
		if((inst1.xy4[2] >= inst2.xy4[0] and inst1.xy4[0] <= inst2.xy4[2])
			and (inst1.xy4[3] >= inst2.xy4[1] and inst1.xy4[1] <= inst2.xy4[3]))
			return t
		
	} catch(_ex) {
		
		show_debug_message("Touch (xy4) Exception!")
		m.dbg.str += "\nTouch (xy4) Exception!"
		show_debug_message(_ex)
		
	}
	
	return f
	
}