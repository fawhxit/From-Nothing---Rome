function list_account_inst(l,inst) {
	
	if(!isl(l,f)) {
		
		// Start List w/ Inst
		l = ds_list_create()
		ds_list_add(l,inst)
		
	} else if(!list_has_inst(l,inst))
		ds_list_add(l,inst) // Add to list if not had
	
	// Return List
	return l
	
}

function list_has_inst(l,inst) {
	
	// Incase mismatch or undefined...
	try {
		
		if(isl(l,f)) {
			
			// Init
			var sz = ds_list_size(l)
			
			// Search List for inst...
			for(var i = 0; i < sz; i++) {
				
				// Init
				var e = l[|i]
				
				// Check
				if(e == inst or e.id == inst.id)
					return t // Found
				
			}
			
		}
		
	} catch(_ex) {
		
		// Exception
		show_debug_message("Instance in List Exception!")
		show_debug_message(_ex)
		
	}
	
	// Not Found
	return f
	
}

function list_mv_up_inst(l,inst) {
	
	// Incase mismatch or undefined...
	try {
		
		// Init
		var sz = ds_list_size(l)
		
		// Search List for inst...
		for(var i = 0; i < sz; i++) {
			
			// Init
			var e = l[|i]
			
			// Check
			if(e == inst or e.id == inst.id) {
				
				if(i > 0) {
					
					var eo = l[|i-1]
					l[|i-1] = e
					l[|i] = eo
					return t
					
				}
				
				return f
				
			}
			
		}
		
	} catch(_ex) {
		
		// Exception
		show_debug_message("Move Instance in List Up Exception!")
		show_debug_message(_ex)
		
	}
	
	// Not Found
	return f
	
}

function list_sanity(l) {
	
	if(isl(l,f)) {
		
		// Clean Refs...
		for(var i = 0; i < ds_list_size(l); i++) {
		    
			if(!is(l[|i])) {
			    
				ds_list_delete(l,i)
				i--
				
			}
			
		}
		
		// Empty? Destroy
		if(ds_list_empty(l)){
			
			ds_list_destroy(l)
			l = noone
			
		}
		
		return l
		
	} return noone
	
}

// Get Last Value in List
/// @returns {last_value_in_list}
function list_pop(l) {
	
	return l[|ds_list_size(l)-1]
	
}