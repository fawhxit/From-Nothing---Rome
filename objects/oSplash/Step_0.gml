
if(isiar(id)) {
    
    if(kbANYp) {
        
        // Next Splash; Key Press
        spri++
        deli = 0
        
    } else if(deli > del) {
        
        // Next Splash; Delay Timer
        spri++
        deli = 0
        
    } else deli++ // Delay Iterate
    
    #region Queue Basic Help Notifications
    	
		if(spri == 0 and deli == 0
			and ss.basic_help) {
			
			ds_list_add(m.notifL,instance_create_layer(0,0,"Meta",oNotify))
			var n = list_pop(m.notifL)
			n.str = "Press any key to skip splash screens."
			    +"\n\nClick on these notifications to close them."
			    +" They will close automatically after 7 seconds."
			n.initd = t
			n.alarm[0] = 1
			
			ds_list_add(m.notifL,instance_create_layer(0,0,"Meta",oNotify))
			var n = list_pop(m.notifL)
			n.str = "Press F11 to toggle fullscreen."
				+"\n\nHold Ctrl+Alt to access window controls."
			n.initd = t
			n.alarm[0] = 1
			
			ds_list_add(m.notifL,instance_create_layer(0,0,"Meta",oNotify))
			var n = list_pop(m.notifL)
			n.str = "Disable basic help notifications like"
				+" this in the settings menu."
			n.initd = t
			n.alarm[0] = 1
			
		}
		
    #endregion
    
    // Splash Done
    if(spri >= array_length(sprArr))
        room_goto(rMenu)
    
}