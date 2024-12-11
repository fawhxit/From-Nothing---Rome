function watcher_check(inst) {
	
	try {
		
		if(iso_any(inst)) with(inst) {
			
			if(is(wt)) {
				
				if(!is_array(wt)) {
					
					#region Single Watcher
						
						switch(wt) {
							
							case WATCHER.INIT_PARENT:
								if(isi(parent))
									watcher_action(inst,wa)
							break
							
						}
						
					#endregion
					
				} else {
					
					#region Multi-Watcher
						
						// Init Watcher Loop
						var sz = array_length(wt)
						for(var i = 0; i < sz; i++) {
							
							switch(wt[i]) {
								
								case WATCHER.INIT_PARENT:
									if(isi(parent))
										watcher_action(inst,i)
								break
								
							}
							
						}
						
					#endregion
					
				}
				
			}
			
		}
		
	} catch(_ex) {
		
		show_debug_message("Watcher Check Err!")
		show_debug_message(_ex)
		
	}
	
}

function watcher_action(inst,i) {
	
	try {
		
		if(iso_any(inst)) with(inst) {
			
			if(i == wa) {
				
				#region Single Watcher Action(s)
					
					if(!is_array(wa)) {
						
						#region Single Action
							
							switch(wa) {
								
								case ACTION.DESTROY_SELF:
									instance_destroy(id)
								break
								
								case ACTION.DESTROY_WATCHER:
									wt = noone
									wa = noone
								break
								
							}
							
						#endregion
						
					} else {
						
						#region Multi-Action
							
							// Loop Watcher Actions
							var sz = array_length(wa)
							var destroy = f
							for(var i2 = 0; i2 < sz; i2++) {
								
								switch(wa[i2]) {
									
									case ACTION.DESTROY_SELF:
										instance_destroy(id)
									break
									
									case ACTION.DESTROY_WATCHER:
										destroy = t
									break
									
									
								}
								
							}
							
							// Delayed destroy so Watcher can finish other actions
							if(destroy) {
								
								wt = noone
								wa = noone
								
							}
							
						#endregion
						
					}
					
				#endregion
				
			} else {
				
				#region Multi-Watcher Action(s)
					
					if(!is_array(wa[i])) {
						
						#region Single Action
							
							switch(wa[i]) {
								
								case ACTION.DESTROY_SELF:
									instance_destroy(id)
								break
								
								case ACTION.DESTROY_WATCHER:
									wt = noone
									wa = noone
								break
								
							}
							
						#endregion
						
					} else {
						
						#region Multi-Action
							
							// Loop Watcher Actions
							var sz = array_length(wa[i])
							var destroy = f
							for(var i2 = 0; i2 < sz; i2++) {
								
								switch(wa[i][i2]) {
									
									case ACTION.DESTROY_SELF:
										instance_destroy(id)
									break
									
									case ACTION.DESTROY_WATCHER:
										destroy = t
									break
									
								}
								
								// Delayed destroy so Watcher can finish other actions
								if(destroy) {
									
									wt[i] = noone
									wa[i] = noone
									
								}
								
							}
							
						#endregion
					}
					
				#endregion
				
			}
			
		}
		
	} catch(_ex) {
		
		show_debug_message("Watcher Action Err!")
		show_debug_message(_ex)
		
	}
	
}