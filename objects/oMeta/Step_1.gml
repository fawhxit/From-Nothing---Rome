/// @description Deltas & Game Controls

#region Game Controls
	
	if(room == rGame and (gstate == META.PLAY
		or gstate == META.NEW_GAME)) {
		
		#region World
			
			if(isioar(world,oWorld)) {
				
				#region Zoom & Update wwh2
					
					if(mwu) {
						
						if(kbSHFT) z += 1
						else z += .5
						
					} else if(mwd) {
						
						if(kbSHFT) z -= 1
						else z -= .5
						
					}
					
					// Clamp and Update Delta
					z = clamp(z,zmn,zmx)
					zd = z-zo
					
					// Init Zoom Position Change
					var wxy2d = [0,0]
					
					// FUCKING FINALLY
					#region Calc Zoom Pos Change (If there is a change)
						
						if(zd != 0 and is(w.winMid2pct)) {
							
							var wWCxy2pre = [
								
								(w.wwh2[0]/zo)*w.winMid2pct[0],
								(w.wwh2[1]/zo)*w.winMid2pct[1]
								
							]
							
							var dx = (wWCxy2pre[0]*zo)-(wWCxy2pre[0]*z)
							var dy = (wWCxy2pre[1]*zo)-(wWCxy2pre[1]*z)
							
							// Keep Map Still
							wxy2d[0] += dx
							wxy2d[1] += dy

						}

					#endregion
					
					// World WH
					w.wwh2 = [w.trnWH[0]*z,w.trnWH[1]*z]
					
					// Clamp World XY
					w.wxy4[0] = clamp(w.wxy4[0]+wxy2d[0],-w.wwh2[0]+(ww*.5),ww*.5)
					w.wxy4[1] = clamp(w.wxy4[1]+wxy2d[1],-w.wwh2[1]+(wh*.5),wh*.5)
					// World XY3/4
					w.wxy4[2] = w.wwh2[0]+w.wxy4[0]
					w.wxy4[3] = w.wwh2[1]+w.wxy4[1]

					
				#endregion
				
				#region Pan & wxy4 Clamp
					
					if(!mwu and !mwd) {
						
						// Pan
						if(mbr) {
							
							w.wxy4[0] += wmxd
							w.wxy4[1] += wmyd
							
						}
						
						// Clamp
						w.wxy4[0] = clamp(w.wxy4[0],-w.wwh2[0]+(ww*.5),ww*.5)
						w.wxy4[1] = clamp(w.wxy4[1],-w.wwh2[1]+(wh*.5),wh*.5)
						
					}
					
				#endregion
				
				#region Cloud Toggle
					
					if(kbCp) {
						
						// Cycle Cloud Modes
						switch(w.cldMode) {
							
							case GAME_CLOUDS.ALL:
								w.cldMode = GAME_CLOUDS.SHADOW
							break
							
							case GAME_CLOUDS.SHADOW:
								w.cldMode = GAME_CLOUDS.NONE
							break
							
							case GAME_CLOUDS.NONE:
								w.cldMode = GAME_CLOUDS.ALL
							break
							
							default:
								w.cldMode = GAME_CLOUDS.ALL
							break
							
						}
						
					}
					
				#endregion
				
			}
			
			#region Debug Controls
				
				if(dbg.on) {
					
					if(kbENDp and isioar(world,oWorld)) {
						
						instance_destroy(world)
						world = noone
						
					} else if(kbHOMEp and world == noone) {
						
					    world = instance_create_layer(0,0,"Meta",oWorld)
					    w.active = t
					    w.init = t
					    w.in_room = rGame
						
					}
					
				}
				
			#endregion
			
		#endregion
		
	}
	
#endregion

#region Mouse
	
	// X/Y Deltas
	mxd = mx-mxo
	myd = my-myo
	dmxd = dmx-dmxo
	dmyd = dmy-dmyo
	wmxd = wmx-wmxo
	wmyd = wmy-wmyo
	
#endregion

#region Keyboard
	
	if(!kbstra) kbstr = "" // Keyboard String Inactive
	else {
		
		// Enter Pressed?
		if(kbNTRp) {
			
			// Clean Input
			kbstr = string_clean(kbstr)
			
			// Pass Input?
			if(kbstr != "") {
				
				kbstrin = kbstr
				kbstr = "" // Reset Keyboard String
				
			}
			
		}
		
	}
	
#endregion