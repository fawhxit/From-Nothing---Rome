/// @description Debug & Meta Overlays

#region Window Control Overlay
	
	if(winCtrl) {
		
		// Fade
		var xy4 = [0,0,ww,wh]
		var carr5 = [1/3,c.blk,c.blk,c.blk,c.blk]
		draw_rectangle_ext_color(xy4,0,0,carr5,f)
		
		#region Init Button
			
			if(!iso(winCloseBtn,oButton)) {
				
				winCloseBtn = instance_create_layer(0,0,"Meta",oButton)
				var e = winCloseBtn
				var _w = ww*.05
				e.xy4 = [ww-(_w*2),wh+_w,ww-_w,wh+(_w*2)]
				e.room = noone
				e.action = UI.EXIT
				e.str = "X"
				e.bgc5[0] = 0
				e.active = t
				e.initd = t
				e.alarm[0] = 1
				
			}
			
		#endregion
		
		#region Help Text
			
			// Init
			var _xy4,_str,_carr5,_font,_hva
			_xy4 = [ww*(1/3),wh*(1/3),ww*(2/3),wh*(2/3)]
			if(ss.winMode == WIN.FULL)
				_str = "Fullscreen Mode"
					+"\nPress F11 anytime to Cycle Modes"
			else if(ss.winMode == WIN.BFULL)
				_str = "Borderless Fullscreen Mode"
					+"\nPress F11 anytime to Cycle Modes"
			else if(ss.winMode == WIN.WINDOW)
				_str = "Window Mode"
					+"\nPress F11 anytime to Cycle Modes"
					+"\n\nLeft Click and Drag anywhere to move window."
					+"\n\nLeft click and Drag bottom right corner to resize."
			_carr5 = [2/3,c.lgry,c.lgry,c.wht,c.wht]
			_font = fTechM
			_hva = [fa_center,fa_middle]
			
			// Draw
			draw_text_ext_transformed_color2(_xy4,_str,1,0,_carr5,_font,_hva)
			
		#endregion
		
		#region Arrow
			
			if(ss.winMode == WIN.WINDOW) {
				
				// Init
				var _xy6,_carr4,_carr4_2,_wl,_ws
				_wl = ww*.1
				_ws = ww*.01
				_xy6 = [ww-_wl,wh-_ws,ww-_ws,wh-_wl,ww-_ws,wh-_ws]
				_carr4 = [2/3,c.dgry,c.dgry,c.blk]
				_carr4_2 = [2/3,c.dgry,c.dgry,c.wht]
				
				// Interaction
				if(mouse_in_gui_rectangle([_xy6[0],_xy6[3],_xy6[2],_xy6[1]])) {
					
					// Init
					_carr4[3] = c.wht
					_carr4[0] = 1
					_carr4_2[0] = 1
					
					// Click Fade
					if(mbl) {
						
						_carr4[0] = 1/3
						_carr4_2[0] = 1/3
						
					}
					
					// Flag
					if(mblp) winResize = t
					
				} else if(!mbl) winResize = f // Undo
				
				// Draw Arrow
				draw_triangle_color2(_xy6,_carr4,2,f)
				draw_triangle_color2(_xy6,_carr4_2,2,t)
				
			}
			
		#endregion
		
	} else if(iso(winCloseBtn,oButton)) {
		
		instance_destroy(winCloseBtn)
		winCloseBtn = noone
		
	}
	
#endregion

#region Debug
	
	if(dbg.on) {
		
		#region Global Debug Prints
			
		    dbg.str = string("\FPS/REAL/DT: {0}/{1}/{2}",fps,fps_real,delta_time)
		    dbg.str += string("\nRoom : {0}",room_get_name(room))
		    dbg.str += string("\n")
		    dbg.str += string("\nWindow W/H: {0}/{1}",ww,wh)
		    dbg.str += string("\nRoom W/H: {0}/{1}",room_width,room_height)
		    dbg.str += string("\nASurface W/H: {0}/{1}",
		        surface_get_width(application_surface),
		            surface_get_height(application_surface))
			dbg.str += string("\n")
			dbg.str += string("\nSurface X/Y: {0}/{1}",sxy[0],sxy[1])
			dbg.str += string("\nSurface W/H: {0}/{1}",swh[0],swh[1])
			dbg.str += string("\n")
			dbg.str += string("\nMouse Room X/Y: {0}/{1}",mx,my)
			dbg.str += string("\nMouse Room(PCT) X/Y: {0}/{1}",
				mx/room_width,my/room_height)
			dbg.str += string("\nMouse Window X/Y: {0}/{1}",wmx,wmy)
			dbg.str += string("\nMouse Window(PCT) X/Y: {0}/{1}",
				wmx/ww,wmy/wh)
			dbg.str += string("\nMouse Display X/Y: {0}/{1}",dmx,dmy)
			dbg.str += string("\nMouse Display(PCT) X/Y: {0}/{1}",
				dmx/dw,dmy/dh)
			dbg.str += string("\n")
			dbg.str += string("\nZoom: Current/Old/Delta: {0}/{1}/{2}",
				z,zo,zd)
			dbg.str += string("\nZoom: Min/Max: {0}/{1}",zmn,zmx)
			
			if(dbg.str2 != "") {
				
				dbg.str += dbg.str2
				dbg.str2 = ""
				
			}
			
		#endregion
		
		#region Init
			
			var fo = draw_get_font()
			var ho = draw_get_halign()
			var vo = draw_get_valign()
			draw_set_font(fTechS)
			draw_set_hvalign([fa_left,fa_top])
			
			var sep = fh
			dbg.wd	= ww*.25
			dbg.strw = string_width_ext(dbg.str,sep,dbg.wd)
			
		#endregion
		
		#region BG & Outline
			
			var xy4 = [0,0,dbg.strw+(dbg.strm*2),
				string_height_ext(dbg.str,sep,dbg.wd)+(dbg.strm*2)]
			var carr5 = [2/3,c.dgry,c.dgry,c.blk,c.blk]
			draw_rectangle_ext_color(xy4,0,0,carr5,f)
			var xy4 = [xy4[0]+1,xy4[1]+1,xy4[2]-1,xy4[3]-1]
			var carr5 = [2/3,c.wht,c.wht,c.lgry,c.lgry]
			draw_rectangle_ext_color(xy4,0,1,carr5,t)
			
		#endregion
		
		#region Text
			
			draw_text_ext_color(dbg.strm,dbg.strm,dbg.str,sep,dbg.wd,
				c.wht,c.wht,c.lgry,c.lgry,1)
			
		#endregion
		
		#region Reset Drawing
			
			draw_set_font(fo)
			draw_set_hvalign([ho,vo])
			
		#endregion
		
	} else dbg.str2 = "" // Keep External Debug String Empty (Prevent Mem Leak)
	
#endregion