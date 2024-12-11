
// Init World
if(m.gstate == META.NEW_GAME
	and !m.resumeOverride) {
    
    #region Create World
	    
	    if(iso(w,oWorld)) instance_destroy(w)
	    w = instance_create_layer(0,0,"Meta",oWorld)
	    w.active = t
	    w.init = t
	    w.in_room = rGame
	    
    #endregion
    
    #region Create Player
    	
	    if(iso(p,oPlayer)) instance_destroy(p)
	    p = instance_create_layer(0,0,"LandFG",oPlayer)
	    p.active = t
	    p.init = t
	    p.in_room = rGame
	    
    #endregion
    
    if(ss.basic_help) {
        
		ds_list_add(m.notifL,instance_create_layer(0,0,"Meta",oNotify))
		var n = list_pop(m.notifL)
		n.str = "Use 'Mouse wheel' to Zoom In/Out."
		    +"\n'Right Click and Drag' to Pan the Map."
		n.initd = t
		n.alarm[0] = 1
        
		ds_list_add(m.notifL,instance_create_layer(0,0,"Meta",oNotify))
		var n = list_pop(m.notifL)
		n.str = "You can also hold 'Shift' to zoom faster."
		n.initd = t
		n.alarm[0] = 1
        
		ds_list_add(m.notifL,instance_create_layer(0,0,"Meta",oNotify))
		var n = list_pop(m.notifL)
		n.str = "Press 'C' to cycle Cloud Modes."
		    +"\n(All, Shadows, None)"
		n.initd = t
		n.alarm[0] = 1
        
    }
    
}