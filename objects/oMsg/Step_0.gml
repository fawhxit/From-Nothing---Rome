
if(isia(id)) {
    
    // Update xy4 (pct based)
    if(is(xy4pct))
        xy4 = [ww*xy4pct[0],wh*xy4pct[1],ww*xy4pct[2],wh*xy4pct[3]]
    
    // Fade In/Out & Delay Controls
    if(fade != noone and del != noone) {
    	
	    if(fadei < fade and deli < del) fadei++
	    else if(deli < del) deli++
	    else if(fadei > 0) fadei--
	    else instance_destroy(id)
	    
    } else if(fade != noone) {
    	
    	if(!fadeD and fadei < fade) fadei++
    	else if(fadeD and fadei > 0) fadei--
    	else if(fadeD and fadei <= 0) instance_destroy(id)
    	
    } else if(del != noone) {
    	
	    if(deli < del) deli++
	    else instance_destroy(id)
    	
    }
    
}