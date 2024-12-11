/// @description Controls

#region New Game Logic
    
    if(isar(id) and m.gstate == META.NEW_GAME) {
		
		#region Init Player
			
			if(mblp and !mo and iso(w.mtrnLyr,oWorldLayer)) {
				
				if(w.mtrnLyr.wLayer == WORLD.LAND) {
					
					startxy2pct = w.mxy2pct
					startxy2 = w.mxy2
					
				} else if(w.mtrnLyr.wLayer == WORLD.WATER
					and ds_list_empty(m.msgL)) {
					
					startxy2pct = noone
					startxy2 = noone
					
					#region Water Message
					    
					    ds_list_add(m.msgL,instance_create_layer(0,0,"Meta",oMsg))
					    var n = list_pop(m.msgL)
					    n.parent = id
					    n.str = "We can't settle here, we must find else where..."
					    n.initd = t
					    n.alarm[0] = 1
					    
					#endregion
					
				}
				
			}
			
		#endregion
        
        #region Confirm
	        
	        if(is(startxy2pct) and is(startxy2)) {
				
		        if((kbEp or kbNTRp) and !mo and fd <= 0) {
		            
		            #region Convert Start
		            	
		            	var rng = 10
		            	tGrid[#startxy2[0],startxy2[1]] = 1
		            	for(var iy = -rng; iy <= rng; iy++) {
		            		
		            		for(var ix = -rng; ix <= rng; ix++) {
		            			
		            			if(ix == 0 and iy == 0) continue // Skip Capital
		            			var dist = max(0,1-(point_distance(startxy2[0],startxy2[1],
		            				startxy2[0]+ix,startxy2[1]+iy)/rng))
		            			if(w.lndLyr.grid[#startxy2[0]+ix,startxy2[1]+iy] != noone)
		            				tGrid[#startxy2[0]+ix,startxy2[1]+iy] = dist
		            			
		            		}
		            		
		            	}
		            	
		            #endregion
		            
		            #region Init Terrain Vars
						
						#region tBounds
							
							tbounds = [startxy2[0]-20,startxy2[1]-20,
								startxy2[0]+20,startxy2[1]+20]
							tbounds[0] = clamp(tbounds[0],0,w.trnWH[0]-1)
							tbounds[1] = clamp(tbounds[1],0,w.trnWH[1]-1)
							tbounds[2] = clamp(tbounds[2],0,w.trnWH[0]-1)
							tbounds[3] = clamp(tbounds[3],0,w.trnWH[1]-1)
							
						#endregion
						
						#region Other Vars
							
							// Territory Iterator
							txy2 = []
							txy2[0] = tbounds[0]
							txy2[1] = tbounds[1]
							
							// Sweep End Coordinate
							tSwpxy2 = []
							tSwpxy2[0] = tbounds[0]
							tSwpxy2[1] = tbounds[1]
							
							// Start w/ Init Sweep
							tSwpCnt = 3
							tSwpDeli = tSwpDel
							
							// Territory Limits
							tVll	= lerp(w.cs.tropical.beach.ll,
								w.cs.tropical.beach.ul,2/3)
							tVul	= lerp(w.cs.tropical.mountain.ll,
								w.cs.tropical.mountain.ul,.1)
							
							// City List [xy2,name,radius,development]
							cityL = ds_list_create()
							var arr_ = []
							arr_[E.xy] = startxy2
							arr_[E.nm] = "Rome"
							arr_[E.rd] = rng
							arr_[E.dv] = 0.2
							ds_list_add(cityL,arr_)
							
						#endregion
						
		            #endregion
		            
		            // End NEW_GAME
		            m.gstate = META.PLAY
		            
		            // End Player Init
		            init = f
		            initd = t
		            
		            // Create First Scene
		            ds_list_add(m.scnL,oScene)
		            
		        }
		        
	        }
	        
        #endregion
        
    }
    
#endregion

#region Cheats
	
	if(isiar(id) and m.gstate == META.PLAY) {
		
		if(mblp) cityL[|0][E.dv] += 0.05
		cityL[|0][E.dv] = clamp(cityL[|0][E.dv],0,1)
		
	}
	
#endregion