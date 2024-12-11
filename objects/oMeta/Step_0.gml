/// @description Meta Controls & List Updates

#region Window Controls
	
	#region Fullscreen Toggle & Room/Surface Update
		
		if(kbF11p) {
			
			switch(ss.winMode) {
				
				case WIN.BFULL	: ss.winMode = WIN.FULL;		break;
				case WIN.FULL	: ss.winMode = WIN.WINDOW;		break;
				case WIN.WINDOW	: ss.winMode = WIN.BFULL;		break;
				
			}
			
			// Setup Modes
			if(ss.winMode == WIN.FULL) window_set_fullscreen(t)
			else if(window_get_fullscreen()) window_set_fullscreen(f)
			if(ss.winMode == WIN.BFULL) window_set_size(dw,dh)
			else if(ss.winMode == WIN.WINDOW) window_set_size(dw*.75,dh*.75)
			
			// Center Window if Needed
			alarm[0] = room_speed/2
			
		} else if((room_width != ww or room_height != wh
			or surface_get_width(application_surface) != ww
			or surface_get_height(application_surface) != wh)
			and alarm[1] <= -1) {
			
			// Update Room & Surface?
			alarm[1] = 1
			
		}
		
	#endregion
	
	#region Windowed Controls
		
		if(kbCTRL and kbALT) winCtrl = t
		else winCtrl = f
		
		if(ss.winMode == WIN.WINDOW and winCtrl) {
			
			if(mbl) {
				
				if(winResize) {
					
					// Resize Window (Min 1/4 of Display)
					window_set_size(max(ceil(ww+dmxd),dw*(1/3)),
						max(ceil(wh+dmyd),dh*(1/3)))
					
				} else {
					
					// Drag Window
					var wxy = [window_get_x(),window_get_y()]
					window_set_position(wxy[0]+dmxd,wxy[1]+dmyd)
					
				}
				
			}
			
		}
		
	#endregion
	
#endregion

#region Lists Updates
	
	#region Iterate Notifcation List
		
		if(!ds_list_empty(notifL)) {
			
			var n = notifL[|0]
			
			if(iso(n,oNotify)) {
				
				if(!isa(n)) n.active = t
				
			} else ds_list_delete(notifL,0)
			
		}
		
	#endregion
	
	#region Iterate Message List
		
		if(!ds_list_empty(notifL)) {
			
			var n = notifL[|0]
			
			if(iso(n,oNotify)) {
				
				if(!isa(n)) n.active = t
				
			} else ds_list_delete(notifL,0)
			
		}
		
	#endregion
	
	#region Iterate Scene List
		
		if(!ds_list_empty(scnL)) {
			
			if(scnLDel == noone
				or scnLDeli >= scnLDel) {
				
				var n = scnL[|0]
			
				if(iso(n,oScene)) {
				
					if(!isa(n)) n.active = t
				
				} else ds_list_delete(scnL,0)
				
				if(scnLDel != noone) scnLDeli = 0
				
			} else if(scnLDel != noone) scnLDeli++
			
			
		}
		
	#endregion
	
#endregion

#region Controls
	
	#region Debug Toggle
		
		if(kbDELp) dbg.on = !dbg.on
		
	#endregion
	
	#region Toggle Menu
		
		if(kbESCp) {
			
			if(gstate == META.PLAY or gstate == META.NEW_GAME) {
				
				gstateo = gstate
				gstate = META.PAUSE
				global.obj_menu.main.cmpArr[0].active2 = t
				room_goto(rMenu)
				
			} else if(gstate == META.PAUSE
				and global.obj_menu.main.active
				and iso(world,oWorld)) {
				
				// TODO CHANGE TO PLAY
				gstate = gstateo
				room_goto(rGame)
				
			}
			
		}
		
	#endregion
	
#endregion