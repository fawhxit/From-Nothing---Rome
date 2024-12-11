function ui_container_button_create(xy4,cmpArr,cols,wmpct,hmpct) {
    
    // Init
    var sz = array_length(cmpArr)
    var rtnArr = []
    var rtnArr2 = []
    var i2 = 0
    
    // Setup Components
    for(var i = 0; i < sz; i++) {
        
        var e = cmpArr[i]
        rtnArr[i] = ui_component_setup(e)
        var e2 = rtnArr[i]
        if(is(e2)) rtnArr2[array_length(rtnArr2)] = e2
        
    }
    
    // Format Buttons
    sz = array_length(rtnArr2)
    var wd = ((xy4[2]-xy4[0]))/cols
    var wm = wd*wmpct
    var ht = ((xy4[3]-xy4[1]))/ceil(sz/cols)
    var hm = ht*hmpct
    var i = 0
    var iw = wm
    for(var ic = 0; ic < cols; ic++) {
        
        var i2 = i
        var ih = hm
        
        for(var ir = i; ir < i2+ceil(sz/cols); ir++) {
            
            if(i == sz) break
            
            var e = rtnArr2[i]
            e.xy4 = [xy4[0]+iw,xy4[1]+ih,
                xy4[0]+iw+wd-(wm*2),xy4[1]+ih+ht-(hm*2)]
            e.initd = t
            e.alarm[0] = 1
            
            ih = ih+ht
            i++
            
        }
        
        iw = iw+wd
        
    }
    
    return rtnArr2
    
}

function ui_component_setup(cmp) {
    
    var rtn = noone
    
    switch(cmp) {
        
        #region Buttons
            
            #region Main Menu
                
                case UI.RESUME: {
                    
                    rtn = instance_create_layer(0,0,"Meta",oButton)
                    rtn.action = cmp
                    rtn.in_room = rMenu
                    rtn.str = "Resume"
                    rtn.strf = fDefaultM
                    if(m.gstate == META.PAUSE)
                        rtn.active2 = t
                    break
                    
                }
                
                case UI.NEW_GAME: {
                    
                    rtn = instance_create_layer(0,0,"Meta",oButton)
                    rtn.action = cmp
                    rtn.in_room = rMenu
                    rtn.str = "New Game"
                    rtn.strf = fDefaultM
                    rtn.active2 = t
                    break
                    
                }
                
                case UI.LOAD_GAME: {
                    
                    rtn = instance_create_layer(0,0,"Meta",oButton)
                    rtn.action = cmp
                    rtn.in_room = rMenu
                    rtn.str = "Load"
                    rtn.strf = fDefaultM
                    rtn.active2 = f // TODO: IMPLEMENT
                    break
                    
                }
                
                case UI.SAVE_GAME: {
                    
                    rtn = instance_create_layer(0,0,"Meta",oButton)
                    rtn.action = cmp
                    rtn.in_room = rMenu
                    rtn.str = "Save"
                    rtn.strf = fDefaultM
                    rtn.active2 = f // TODO: IMPLEMENT
                    break
                    
                }
                
                case UI.SETTINGS: {
                    
                    rtn = instance_create_layer(0,0,"Meta",oButton)
                    rtn.action = cmp
                    rtn.in_room = rMenu
                    rtn.str = "Settings"
                    rtn.strf = fDefaultM
                    rtn.active2 = t
                    break
                    
                }
                
                case UI.EXIT: {
                    
                    rtn = instance_create_layer(0,0,"Meta",oButton)
                    rtn.action = cmp
                    rtn.in_room = rMenu
                    rtn.str = "Exit"
                    rtn.strf = fDefaultM
                    rtn.active2 = t
                    break
                    
                }
                
            #endregion
            
            #region Settings Menu
                
                case UI.SET_BASIC_HELP: {
                    
                    rtn = instance_create_layer(0,0,"Meta",oButton)
                    rtn.action = cmp
                    rtn.in_room = rMenu
                    rtn.str = "Basic Help"
                    if(ss.basic_help) rtn.str += " On"
                    else rtn.str += " Off"
                    rtn.strf = fDefaultM
                    rtn.active2 = t
                    rtn.hide = t
                    break
                    
                }
                
                case UI.SET_FULLSCREEN: {
                    
                    rtn = instance_create_layer(0,0,"Meta",oButton)
                    rtn.action = cmp
                    rtn.in_room = rMenu
                    rtn.str = "Cycle Fullscreen Mode"
                    rtn.strf = fDefaultM
                    rtn.active2 = t
                    rtn.hide = t
                    break
                    
                }
                
                case UI.SETTINGS_SAVE: {
                    
                    rtn = instance_create_layer(0,0,"Meta",oButton)
                    rtn.action = cmp
                    rtn.in_room = rMenu
                    rtn.str = "Save Settings"
                    rtn.strf = fDefaultM
                    rtn.active2 = t
                    rtn.hide = t
                    break
                    
                }
                
                case UI.SETTINGS_BACK: {
                    
                    rtn = instance_create_layer(0,0,"Meta",oButton)
                    rtn.action = cmp
                    rtn.in_room = rMenu
                    rtn.str = "Back"
                    rtn.strf = fDefaultM
                    rtn.active2 = t
                    rtn.hide = t
                    break
                    
                }
                
            #endregion
            
        #endregion
        
        #region Sliders
            
            #region Settings Menu
                
                case UI.VOL_ALL: {
                    
                    rtn = instance_create_layer(0,0,"Meta",oSlider)
                    rtn.action = cmp
                    rtn.in_room = rMenu
                    rtn.valmn = 0
                    rtn.val = ss.vall
                    rtn.valmx = 1
                    rtn.str = "Master Volume"
                    rtn.strf = fDefaultS
                    rtn.active = t
                    rtn.hide = t
                    break
                    
                }
                
                case UI.VOL_SFX: {
                    
                    rtn = instance_create_layer(0,0,"Meta",oSlider)
                    rtn.action = cmp
                    rtn.in_room = rMenu
                    rtn.valmn = 0
                    rtn.val = ss.vsfx
                    rtn.valmx = 1
                    rtn.str = "Sound Effects Volume"
                    rtn.strf = fDefaultS
                    rtn.active = t
                    rtn.hide = t
                    break
                    
                }
                
                case UI.VOL_AMX: {
                    
                    rtn = instance_create_layer(0,0,"Meta",oSlider)
                    rtn.action = cmp
                    rtn.in_room = rMenu
                    rtn.valmn = 0
                    rtn.val = ss.vamx
                    rtn.valmx = 1
                    rtn.str = "Ambient Volume"
                    rtn.strf = fDefaultS
                    rtn.active = t
                    rtn.hide = t
                    break
                    
                }
                
                case UI.VOL_MUX: {
                    
                    rtn = instance_create_layer(0,0,"Meta",oSlider)
                    rtn.action = cmp
                    rtn.in_room = rMenu
                    rtn.valmn = 0
                    rtn.val = ss.vmux
                    rtn.valmx = 1
                    rtn.str = "Music Volume"
                    rtn.strf = fDefaultS
                    rtn.active = t
                    rtn.hide = t
                    break
                    
                }
                
            #endregion
            
        #endregion
        
        default: return noone
        
    }
    
    return rtn
    
}

function ui_draw_button(inst) {
	
	with(inst) {
		
		// Init
		var bgao  = bgc5[0]
		var fgao  = fgc5[0]
		var strao = strc5[0]
		if(iso(parent,oUIContainer)) {
			
			bgc5[0]  *= parent.childa
			fgc5[0]  *= parent.childa
			strc5[0] *= parent.childa
			
		}
		
		// BG
		if(!active2) bgc5[0]/=2
		draw_rectangle_ext_color(xy4,0,0,bgc5,f)
		bgc5[0] = bgao
		
		// Highlight & Action (Adjust for Current Surface)
		var xy4_2 = [m.sxy[0]+xy4[0],m.sxy[1]+xy4[1],
			m.sxy[0]+xy4[2],m.sxy[1]+xy4[3]]
		
		// Interaction	
		if(mouse_in_gui_rectangle(xy4_2)
			and (active and active2)
			and !m.winCtrl and fd <= 0
			and !touching_xy4(id,m.notifL[|0])) {
			
			// Hilight
			if(mbl) fgc5[0]*=.1
			else fgc5[0]*=(1/3)
			draw_rectangle_ext_color(xy4,0,0,fgc5,f)
			fgc5[0]=fgao
			
			if(mblr) {
				
				button_action(id)
				fd += 1
				
			}
			
		}
		
		// FG1
		if(!active2) fgc5[0]/=2
		draw_rectangle_ext_color(xy4,0,1,fgc5,t)
		fgc5[0] = fgao
		
		// Text
		if(!active2) strc5[0]/=2
		var xy4_2 = xy4
		xy4_2[0]+=strm
		xy4_2[1]+=strm
		xy4_2[2]-=strm
		xy4_2[3]-=strm
		draw_text_ext_transformed_color2(xy4,str,1,0,strc5,strf,strhva)
		strc5[0] = strao
		
	}
	
}

function ui_draw_notification(inst) {
	
	with(inst) {
		
		// Init
		var bgao = bgc5[0]
		var fgao = fgc5[0]
		var strao = strc5[0]
		var bga = bgao*(fadei/fade)
		var fga = fgao*(fadei/fade)
		var stra = strao*(fadei/fade)
		bgc5[0] = bga
		fgc5[0] = fga
		strc5[0] = stra
		
		// BG
		if(!active) bgc5[0] = bga/2
		draw_rectangle_ext_color(xy4,0,0,bgc5,f)
		bgc5[0] = bga
		
		// Highlight & Action (Adjust for Current Surface)
		var xy4_2 = [m.sxy[0]+xy4[0],m.sxy[1]+xy4[1],
			m.sxy[0]+xy4[2],m.sxy[1]+xy4[3]]
		
		// Flash
		if(flashi < 2 and fi <= room_speed/2
			and fadei >= fade) {
			
			if(fi == room_speed/2) flashi++
			
			fgc5[0] = fga*(1/3)
			draw_rectangle_ext_color(xy4,0,0,fgc5,f)
			fgc5[0] = fga
			
		}
		
		// Interaction	
		if(mouse_in_gui_rectangle(xy4_2) and active
			and !m.winCtrl and fd <= 0) {
			
			// Cancel Flash
			flashi = 2
			
			// Deiterate Delay/Fade
			deli--
			fadei = fade
			
			// Hilight
			if(mbl) fgc5[0] = fga*.1
			else fgc5[0] = fga*(1/3)
			draw_rectangle_ext_color(xy4,0,0,fgc5,f)
			fgc5[0] = fga
			
			if(mblr) {
				
				instance_destroy(id)
				fd += 1
				
			}
			
		}
		
		// FG1
		if(!active) fgc5[0] = fga/2
		draw_rectangle_ext_color(xy4,0,2,fgc5,t)
		fgc5[0] = fga
		
		// Text
		if(!active) strc5[0] = stra/2
		var xy4_2 = xy4
		xy4_2[0]+=strm
		xy4_2[1]+=strm
		xy4_2[2]-=strm
		xy4_2[3]-=strm
		draw_text_ext_transformed_color2(xy4_2,str,1,0,strc5,strf,strhva)
		
		// Reset
		bgc5[0] = bgao
		fgc5[0] = fgao
		strc5[0] = strao
		
	}
	
}

function ui_draw_message(inst) {
	
	with(inst) {
		
		// Init
		var apct = 1
		if(fade != noone) apct = fadei/fade
		var fgao  = fgc5[0]
		var bgao  = bgc5[0]
		var strao = strc5[0]
		fgc5[0]  *= apct
		bgc5[0]  *= apct
		strc5[0] *= apct
		
		// BG
		draw_rectangle_ext_color(xy4,0,0,bgc5,f)
		
		// Interaction
		if(active and !m.winCtrl and fd <= 0) {
			
			// Acknowledge
			if(kbNTRp or kbEp) {
				
				if(fadei >= fade) fadeD = t
				else if(fadeD) instance_destroy(id)
				fadei = fade
				fd += 2
				
			}
			
		}
		
		// FG1
		draw_rectangle_ext_color(xy4,0,2,fgc5,t)
		
		// Text
		var str2 = prestr+"\n"+str
		var xy4_2 = xy4
		xy4_2[0] += strm
		xy4_2[1] += strm
		xy4_2[2] -= strm
		xy4_2[3] -= strm
		draw_text_ext_transformed_color2(xy4_2,str2,1,0,strc5,strf,strhva)
		
		// Reset Alphas
		fgc5[0]	 = fgao
		bgc5[0]  = bgao
		strc5[0] = strao
		
	}
	
}

function ui_draw_tooltip(bgc5,fgc5,str,mar) {
	
	// Init
	var ao = draw_get_alpha()
	draw_set_font(fTechS)
	var xx,yy
	xx = wmx
	yy = wmy
	var strw,strh
	strw = string_width(str)
	strh = string_height(str)
	var xy4 = [xx,yy,xx+100,yy+100] // Debug Init
	
	#region Tooltip Alignment
		
		#region XX Align
			
			var off = 20
			// Tooltip would go off screen? (XX + (Off)set)
			if(xx+off+strw+(mar*2) >= ww*.99) {
				
				// Tooltip <-
				xx -= off/4
				xy4[2] = xx-strw-(mar*2)
				xy4[0] = xx
				draw_set_halign(fa_right)
				
			} else {
				
				// Tooltip ->
				xx += off
				xy4[0] = xx
				xy4[2] = xx+strw+(mar*2)
				draw_set_halign(fa_left)
				
			}
			
		#endregion
		
		#region YY Align
			
			// Tooltip would go off screen?
			if(yy+strh+(mar) >= wh*.99) {
				
				// Tooltip ^
				xy4[3] = yy-strh-(mar)
				xy4[1] = yy
				draw_set_valign(fa_bottom)
				
			} else {
				
				// Tooltip v
				xy4[1] = yy
				xy4[3] = yy+strh+(mar)
				draw_set_valign(fa_top)
				
			}
			
		#endregion
		
	#endregion
	
	#region Draw Tooltip BG
	    
		// BG
        draw_set_alpha(bgc5[0])
        draw_rectangle_color(xy4[0],xy4[1],xy4[2],xy4[3],
        bgc5[1],bgc5[2],bgc5[3],bgc5[4],f)
		
		// Outline
        draw_set_alpha(fgc5[0])
        draw_rectangle_color(xy4[0],xy4[1],xy4[2],xy4[3],
            fgc5[1],fgc5[2],fgc5[3],fgc5[4],t)
		
	#endregion
	
	#region Draw Tooltip Text
	
		var marx,mary
		if(draw_get_halign() == fa_right) marx = -mar
		else marx = mar
		if(draw_get_valign() == fa_bottom) mary = -mar
		else mary = mar
		draw_text_color(xy4[0]+marx,xy4[1]+mary,str,fgc5[1],fgc5[2],fgc5[3],fgc5[4],fgc5[0])
		
	#endregion
	
	// Reset Alpha
	draw_set_alpha(ao)
	
}

// TODO TODO TODO Update Nested Draw Functions?
function ui_slider_draw(inst) {
	
	// Set Old Alpha (For Reset)
	var ao = draw_get_alpha()
	
	#region Draw Body
		
        // Outline (BG)
        if(!inst.active) draw_set_alpha(inst.bgc5[0]/2)
        else draw_set_alpha(inst.bgc5[0])
        draw_rectangle_color(inst.xy4[0],inst.xy4[1],inst.xy4[2],inst.xy4[3],
            inst.fgc5[1],inst.fgc5[2],inst.fgc5[3],inst.fgc5[4],t)
		
	#endregion
	
	#region Init
        
        var pct = inst.val/inst.valmx
        var pct_min = inst.valmn/inst.valmx
        var adj = round2(((inst.xy4[2]-inst.xy4[0])*pct_min)
            -(((inst.xy4[2]-inst.xy4[0])*pct_min)*pct),1)
        var x2 = (inst.xy4[0]+((inst.xy4[2]-inst.xy4[0])*pct))-adj
        
	#endregion
	
	#region Interaction/Hilight Logic
		
        var in_inst = t // Used to return if mouse is inside button
        if(mouse_in_gui_rectangle(inst.xy4) and inst.active) {
			
            // Draw
            if(mbl) draw_set_alpha(inst.fgc5[0]*.34)
            else draw_set_alpha(inst.fgc5[0]*.5)
            draw_rectangle_color(inst.xy4[0],inst.xy4[1],x2,inst.xy4[3],inst.fgc5[1],
                inst.fgc5[2],inst.fgc5[3],inst.fgc5[4],f)
			
            // Update Val
            if(mbl) {
				
                var xpct = round2((wmx-inst.xy4[0]+adj)/(inst.xy4[2]-inst.xy4[0]+adj),2)
                inst.val = clamp(round2(inst.valmx*xpct,2),inst.valmn,inst.valmx)
                if(abs(inst.val - round(inst.val)) <= 0.05) inst.val = clamp(round(inst.val),inst.valmn,inst.valmx)
				
            }
			
            // Current Value; (Displayed under bar only when hovering)
            var a = 0
            if(!inst.active) a = inst.fgc5[0]/2
            else a = inst.fgc5[0]
            draw_set_font(inst.strf)
            draw_set_hvalign([fa_center,fa_middle])
            draw_text_color(x2,inst.xy4[3],string("{0}{1}",inst.val*100,inst.sym),
                inst.fgc5[1],inst.fgc5[2],inst.fgc5[3],inst.fgc5[4],a)
			
	    } else {
			
	        in_inst = f
			
	        draw_set_alpha(inst.fgc5[0]*.75)
	        draw_rectangle_color(inst.xy4[0],inst.xy4[1],x2,inst.xy4[3],inst.fgc5[1],
	            inst.fgc5[2],inst.fgc5[3],inst.fgc5[4],f)
			
	    }
		
	    // Apply Changes
	    slider_action(inst)
		
	#endregion
	
	#region Ticks
		
	    // 1/5s
	    if(!inst.active) draw_set_alpha(inst.bgc5[0]/2)
	    else draw_set_alpha(inst.bgc5[0])
	    for(var i = 1; i < 20; i++) {
			
			// Init
	        var tx = inst.xy4[0]+((inst.xy4[2]-inst.xy4[0])*(i*.05))
	        var ty = inst.xy4[3]
	        if(i == 10) ty -= 10
	        else if(i%2 == 0) ty -= 5
	        else ty -= 2
	        var tw = 1
	        if(i%10 == 0) tw = 2
			
	        if(ceil(x2) >= floor(tx)) draw_line_width_color(tx,inst.xy4[3],tx,ty,tw,inst.bgc5[1],inst.bgc5[3])
	        else draw_line_width_color(tx,inst.xy4[3],tx,ty,tw,inst.fgc5[1],inst.fgc5[3])
			
	    }
		
	#endregion
	
	#region Text
		
	    // Label
	    var a
	    if(!inst.active) a = inst.fgc5[0]/2
	    else a = inst.fgc5[0]
	    draw_set_font(inst.strf)
        draw_set_hvalign([fa_left,fa_bottom])
	    var l_str = string("{0} : {1}{2}", inst.str,inst.val*100,inst.sym)
	    draw_text_color(inst.xy4[0],inst.xy4[1],l_str,inst.fgc5[1],
	        inst.fgc5[2],inst.fgc5[3],inst.fgc5[4],a)
		
	    // Min Value
	    if(!inst.active) a = inst.fgc5[0]/2
	    else a = inst.fgc5[0]
        draw_set_hvalign([fa_right,fa_middle])
	    draw_text_color(inst.xy4[0]-fh,inst.xy4[1]+((inst.xy4[3]-inst.xy4[1])/2),
	        string("{0}{1}",inst.valmn*100,inst.sym),inst.fgc5[1],
	        inst.fgc5[2],inst.fgc5[3],inst.fgc5[4],a)
		
	    // Max Value
	    if(!inst.active) a = inst.fgc5[0]/2
	    else a = inst.fgc5[0]
        draw_set_hvalign([fa_left,fa_middle])
	    draw_text_color(inst.xy4[2]+fh,inst.xy4[1]+((inst.xy4[3]-inst.xy4[1])/2),
	        string("{0}{1}",inst.valmx*100,inst.sym),inst.fgc5[1],
	        inst.fgc5[2],inst.fgc5[3],inst.fgc5[4],a)
		
	#endregion
	
	// Reset Alpha
	draw_set_alpha(ao)
	
	// Return whether or not mouse inside btn
	return in_inst
	
}