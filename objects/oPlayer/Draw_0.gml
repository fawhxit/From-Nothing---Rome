
if(isiar(id) and m.gstate = META.PLAY) {
	
	#region Draw Territory (Sweep)
		
		// Is Sweep Delay Done?
		if(tSwpDeli >= tSwpDel and tSwpCnt > 0
			and ds_list_empty(m.scnL)) {
			
			// Init
			surface_set_target(tSurf)
			
			#region Initial Surface Clear
				
				if(tSurfI) {
					
					draw_clear_alpha(c.wht,0)
					tSurfI = f
					
				}
				
			#endregion
			
			#region Init Loop Vars
				
				// Set Old Coordinates
				var txo = txy2[0]
				var tyo = txy2[1]
				
			#endregion
			
			#region Cells Growth/Expansion
				
				repeat(50) {
					
					#region Calc Growth/Expansion
						
						if(wc_is_habit(id,txy2)) {
							
							if(is_cwc(id,txy2) and cwc_is_grow(id,txy2)) {
								
								#region Growth/Decay
									
									// Base Growth
									var tmp = wc_adj_cwcv_avg(id,txy2)
									
									if(tmp != noone) { // If Base Growth is Valid...
										
										// Growth Limited By Fullness
										tmp *= (1-get_cwcv_pct(id,txy2))
										
										// Negative Growth? TODO: Factors, Conditions, etc.
										// Limited By Fullness
										if(chance(100/3)) tmp*=-get_cwcv_pct(id,txy2)
										
										// Apply Growth
										set_cwcv(id,txy2,tmp)
										
									}
									
								#endregion
								
							} else if(uwc_is_adj_to_cwc(id,txy2)) {
								
								#region Most Updates
									
									if(!firstDraw) {
										
										if(ltrb[0] == noone)
											ltrb[0] = txy2[0]
										else if(txy2[0] < ltrb[0])
											ltrb[0] = txy2[0]
										if(ltrb[1] == noone)
											ltrb[1] = txy2[1]
										else if(txy2[1] < ltrb[1])
											ltrb[1] = txy2[1]
										if(ltrb[2] == noone)
											ltrb[2] = txy2[0]
										else if(txy2[0] > ltrb[2])
											ltrb[2] = txy2[0]
										if(ltrb[3] == noone)
											ltrb[3] = txy2[1]
										else if(txy2[1] > ltrb[3])
											ltrb[3] = txy2[1]
										
									}
									
									
								#endregion
								
								#region Expand
									
									if(uwc_is_expand(id,txy2)) {
										
										// Base Expansion
										var tmp = wc_adj_cwcv_avg(id,txy2)
										
										if(tmp != noone) { // If Expansion is Valid
											
											// Expansion Limited By Terrain
											tmp *= get_cwcv_ul(id,txy2)
											
											tGrid[#txy2[0],txy2[1]] += random(tmp)
											
											// Apply Growth
											set_cwcv(id,txy2,tmp)
											
										}
										
									}
									
								#endregion
								
							}
							
						}
						
					#endregion
					
					#region Iteration
						
						// txy2[0] Iterate
						txy2[0] += 1
						
						// txy2[0] Loop & txy2[1] Iterate
						if(txy2[0] >= tbounds[2]) {
							
							txy2[0] = tbounds[0]
							txy2[1] += 1
							
							// txy2[1] Loop
							if(txy2[1] >= tbounds[3]) {
								
								txy2[1] = tbounds[1]
								
							}
							
						}
						
						// Break on Repeat or Full Sweep
						if((txy2[0] == txo and txy2[1] == tyo)
							or (txy2[0] == tSwpxy2[0] and txy2[1] == tSwpxy2[1]))
							break
						
					#endregion
					
				}
				
			#endregion
			
			#region Draw Cells
				
				// Init Loop
				txy2[0] = txo
				txy2[1] = tyo
				repeat(50) {
					
					#region Draw Territory
						
						if(w.lndLyr.grid[#txy2[0],txy2[1]] != noone) {
							
							// Init Draw
							var xy4 = [txy2[0]-1,txy2[1]-1,txy2[0],txy2[1]]
							gpu_set_blendmode(bm_subtract)
							draw_rectangle_ext_color(xy4,0,0,[1,c.wht,c.wht,c.wht,c.wht],f)
							gpu_set_blendmode(bm_normal)
							
							if(tGrid[#txy2[0],txy2[1]] > 0.01) {
								
								if(cwc_is_adj_to_uwc(id,txy2))
									draw_rectangle_ext_color(xy4,0,0,
										[1,c.dr,c.dr,c.dr,c.dr],f) // Draw as Border
								else draw_rectangle_ext_color(xy4,0,0,
									[tGrid[#txy2[0],txy2[1]],c.nr,c.nr,c.nr,c.nr],f) // Normal Draw
								
							}
							
						}
						
					#endregion
					
					#region Iteration
						
						// txy2[0] Iterate
						txy2[0] += 1
						
						// txy2[0] Loop & txy2[1] Iterate
						if(txy2[0] >= tbounds[2]) {
							
							txy2[0] = tbounds[0]
							txy2[1] += 1
							
							// txy2[1] Loop
							if(txy2[1] >= tbounds[3]) {
								
								txy2[1] = tbounds[1]
								
							}
							
						}
						
						// Break on Repeat or Full Sweep
						if((txy2[0] == txo and txy2[1] == tyo)
							or (txy2[0] == tSwpxy2[0] and txy2[1] == tSwpxy2[1]))
							break
						
					#endregion
					
				}
				
			#endregion
			
			#region Debug
				
				m.dbg.str2 += string("\n\nTerritory:")
				m.dbg.str2 += string("\n\nBounds: {0}/{1} {2}/{3}",
					tbounds[0],tbounds[1],tbounds[2],tbounds[3])
				m.dbg.str2 += string("\nTX/TY: {0}/{1}",txy2[0],txy2[1])
				
			#endregion
			
			#region End Sweep
				
				if(array_equals(txy2,tSwpxy2)) {
					
					// Update Bounds
					if(ltrb[0] != noone and ltrb[1] != noone
						and ltrb[2] != noone and ltrb[3] != noone) {
						
						tbounds[0] = ltrb[0]-5
						tbounds[1] = ltrb[1]-5
						tbounds[2] = ltrb[2]+5
						tbounds[3] = ltrb[3]+5
						tbounds[0] = clamp(tbounds[0],0,w.trnWH[0]-1)
						tbounds[1] = clamp(tbounds[1],0,w.trnWH[1]-1)
						tbounds[2] = clamp(tbounds[2],0,w.trnWH[0]-1)
						tbounds[3] = clamp(tbounds[3],0,w.trnWH[1]-1)
						
						var ltrbxy2 = [
								[ltrb[0],startxy2[1]],
								[startxy2[0],ltrb[1]],
								[ltrb[2],startxy2[1]],
								[startxy2[0],ltrb[3]]
							]
						tFarDist = point_dist(startxy2,ltrbxy2[0])
						tFarDist = max(tFarDist,point_dist(startxy2,ltrbxy2[1]))
						tFarDist = max(tFarDist,point_dist(startxy2,ltrbxy2[2]))
						tFarDist = max(tFarDist,point_dist(startxy2,ltrbxy2[3]))
						
					}
					
					// Update Sweep Start
					tSwpxy2[0] = tbounds[0]
					tSwpxy2[1] = tbounds[1]
					
					// Update txy2
					txy2[0] = tSwpxy2[0]
					txy2[1] = tSwpxy2[1]
					
					// Loop Swp Counter
					tSwpDeli = 0
					tSwpCnt--
					firstDraw = f
					
				}
				
			#endregion
			
			// End Draw On Surface
			surface_reset_target()
			
		} else if(tSwpCnt > 0) tSwpDeli++
		else tSwpDeli = 0
		
		#region Random Updates
			
			if(tSwpCnt <= 0) {
				
				// Init
				surface_set_target(tSurf)
				var rxy2_ = []
				
				// Get Random Coords
				rxy2_[0] = irandom_range(ltrb[0]-1,ltrb[2]+1)
				rxy2_[1] = irandom_range(ltrb[1]-1,ltrb[3]+1)
				txy2[0] = rxy2_[0]
				txy2[1] = rxy2_[1]
				
				#region Grow/Expand Calcs
					
					if(is_cwc(id,rxy2_)) {
						
						#region Growth/Decay
							
							// Base Growth
							var tmp = wc_adj_cwcv_avg(id,txy2)
							
							if(tmp != noone) { // If Base Growth is Valid...
								
								// Growth Limited By Fullness
								tmp *= (1-get_cwcv_pct(id,txy2))
								
								// Negative Growth? TODO: Factors, Conditions, etc.
								// Limited By Fullness
								if(chance(100/3)) tmp*=-get_cwcv_pct(id,txy2)
								
								// Apply Growth
								set_cwcv(id,txy2,tmp)
								
							}
							
						#endregion
						
					} else if(uwc_is_adj_to_cwc(id,rxy2_)
						and wc_is_habit(id,rxy2_)) {
						
						#region Most Updates
							
							if(!firstDraw) {
								
								if(rxy2_[0] < ltrb[0])
									ltrb[0] = rxy2_[0]
								if(rxy2_[1] < ltrb[1])
									ltrb[1] = rxy2_[1]
								if(rxy2_[0] > ltrb[2])
									ltrb[2] = rxy2_[0]
								if(rxy2_[1] > ltrb[3])
									ltrb[3] = rxy2_[1]
								
							}
							
							
						#endregion
						
						#region Expand
							
							if(uwc_is_expand(id,txy2)) {
								
								// Base Expansion
								var tmp = wc_adj_cwcv_avg(id,txy2)
								
								if(tmp != noone) { // If Expansion is Valid
									
									// Expansion Limited By Terrain
									tmp *= get_cwcv_ul(id,txy2)
									
									tGrid[#txy2[0],txy2[1]] += random(tmp)
									
									// Apply Growth
									set_cwcv(id,txy2,tmp)
									
								}
								
							}
							
						#endregion
						
					}
					
				#endregion
				
				#region Draw Territory
					
					if(w.lndLyr.grid[#rxy2_[0],rxy2_[1]] != noone) {
						
						// Init Draw
						var xy4 = [rxy2_[0]-1,rxy2_[1]-1,rxy2_[0],rxy2_[1]]
						gpu_set_blendmode(bm_subtract)
						draw_rectangle_ext_color(xy4,0,0,[1,c.wht,c.wht,c.wht,c.wht],f)
						gpu_set_blendmode(bm_normal)
						
						if(tGrid[#rxy2_[0],rxy2_[1]] > 0.01) {
							
							if(cwc_is_adj_to_uwc(id,rxy2_))
								draw_rectangle_ext_color(xy4,0,0,
									[1,c.dr,c.dr,c.dr,c.dr],f) // Draw as Border
							else draw_rectangle_ext_color(xy4,0,0,
								[tGrid[#rxy2_[0],rxy2_[1]],c.nr,c.nr,c.nr,c.nr],f) // Normal Draw
							
						}
						
					}
					
				#endregion
				
				#region Debug
					
					m.dbg.str2 += string("\n\nTerritory:")
					m.dbg.str2 += string("\n\LTRB: {0}/{1} {2}/{3}",
						ltrb[0],ltrb[1],ltrb[2],ltrb[3])
					m.dbg.str2 += string("\nTX/TY: {0}/{1}",rxy2_[0],rxy2_[1])
					
				#endregion
				
				#region Bounds and ltrb Updates
					
					// Update Bounds
					if(ltrb[0] != noone and ltrb[1] != noone
						and ltrb[2] != noone and ltrb[3] != noone) {
						
						tbounds[0] = ltrb[0]-5
						tbounds[1] = ltrb[1]-5
						tbounds[2] = ltrb[2]+5
						tbounds[3] = ltrb[3]+5
						tbounds[0] = clamp(tbounds[0],0,w.trnWH[0]-1)
						tbounds[1] = clamp(tbounds[1],0,w.trnWH[1]-1)
						tbounds[2] = clamp(tbounds[2],0,w.trnWH[0]-1)
						tbounds[3] = clamp(tbounds[3],0,w.trnWH[1]-1)
						
						var ltrbxy2 = [
								[ltrb[0],startxy2[1]],
								[startxy2[0],ltrb[1]],
								[ltrb[2],startxy2[1]],
								[startxy2[0],ltrb[3]]
							]
						tFarDist = point_dist(startxy2,ltrbxy2[0])
						tFarDist = max(tFarDist,point_dist(startxy2,ltrbxy2[1]))
						tFarDist = max(tFarDist,point_dist(startxy2,ltrbxy2[2]))
						tFarDist = max(tFarDist,point_dist(startxy2,ltrbxy2[3]))
						
					}
					
				#endregion
				
				// Reset
				surface_reset_target()
				// Update Sweep Start
				tSwpxy2[0] = tbounds[0]
				tSwpxy2[1] = tbounds[1]
				// Update txy2
				txy2[0] = tSwpxy2[0]
				txy2[1] = tSwpxy2[1]
				
			}
			
		#endregion
		
		// 10 Seconds Sweep
		if(fi == 0) tSwpCnt++
		
		// Draw Territory Surface
		draw_surface_ext(tSurf,w.wxy4[0],w.wxy4[1],m.z,m.z,0,c.wht,1)
		
	#endregion
	
}