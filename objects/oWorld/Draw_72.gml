
#region Init World Layers and Draw Base Surfaces (surf1)

if(isar(id) and init) {
    
    // Start Init, World Layer's WH and Noise Grids
	world_init([800,450])
    
    #region Noise Grids Generation
	    
	    // Terrain Gen
	    fawhNoise2_centered(trnGrid,24,64,4,-50,100,255,64,f,f,noone,0.1,0.2,t)
	    fawhNoise2_percentize(trnGrid,255,undefined)
	    
	    // Desert Gen
	    /* TODO TODO TODO TODO
	    dstGrid = ds_grid_create(dstWH[0],dstWH[1])	
	    dstCGrid = ds_grid_create(dstWH[0],dstWH[1])
	    fawhNoise2_centered(dstGrid,24,64,4,-50,100,255,64,f,f,noone,0.1,0.2,t)
	    fawhNoise2_percentize(dstGrid,255,undefined)
	    
	    // Snow Gen
	    snwGrid = ds_grid_create(snwWH[0],snwWH[1])	
	    snwCGrid = ds_grid_create(snwWH[0],snwWH[1])
	    fawhNoise2_centered(snwGrid,24,64,4,-50,100,255,64,f,f,noone,0.1,0.2,t)
	    fawhNoise2_percentize(snwGrid,255,undefined)
	    */
	    
	    // Terrain Fog
	    fawhNoise2_centered(trnfGrid,2,32,3,-.2,1,255,16,f,f,noone,0.1,0.2,t)
	    fawhNoise2_percentize(trnfGrid,255,undefined)
	    
	    // Cloud Gen
	    fawhNoise2(skyGrid,24,64,4,-.2,1,255,160,f,f,noone,0.1,0.2,t)
	    fawhNoise2_percentize(skyGrid,255,undefined)
	    
    #endregion
    
    #region World Layers Draw
        
        // Init Loop
        var prvx = -1
        var prvy = -1
        
        #region Generation Loop
	        
	        // Y Loop
	        for(var iy = 0; iy < trnWH[1]; iy++) {
	            
	            // X Loop
	            for(var ix = 0; ix < trnWH[0]; ix++) {
	                
	    			#region Terrain Coloring & Traits
	    				
	    				// Init
		                var xy4 = [prvx,prvy,ix,iy]
		                var v = trnGrid[#ix,iy]
	                    var carr5 = [1,c.nr,c.nr,c.nr,c.nr]
	                    
	                    // Set Color
	    				if(v <= cs.tropical.sea.ul) {
	    				    
	    					carr5[1] = fawhNoise2_color_cell(v,cs.tropical.sea,c.nr)
	    					carr5[2] = fawhNoise2_color_cell(v,cs.tropical.sea,c.nr)
	    					carr5[3] = fawhNoise2_color_cell(v,cs.tropical.sea,c.nr)
	    					carr5[4] = fawhNoise2_color_cell(v,cs.tropical.sea,c.nr)
		    				// Save to World Layer (Water)
		    				wtrLyr.grid[#ix,iy] = [xy4,carr5]
	    					
	    				} else if(v <= cs.tropical.beach.ul) {
	    				    
	    					carr5[1] = fawhNoise2_color_cell(v,cs.tropical.beach,c.nr)
	    					carr5[2] = fawhNoise2_color_cell(v,cs.tropical.beach,c.nr)
	    					carr5[3] = fawhNoise2_color_cell(v,cs.tropical.beach,c.nr)
	    					carr5[4] = fawhNoise2_color_cell(v,cs.tropical.beach,c.nr)
	    					
		    				// Save to World Layer (Land)
		    				lndLyr.grid[#ix,iy] = [xy4,carr5]
	    					
	    				} else if(v <= cs.tropical.land.ul) {
	    				    
	    					carr5[1] = fawhNoise2_color_cell(v,cs.tropical.land,c.nr)
	    					carr5[2] = fawhNoise2_color_cell(v,cs.tropical.land,c.nr)
	    					carr5[3] = fawhNoise2_color_cell(v,cs.tropical.land,c.nr)
	    					carr5[4] = fawhNoise2_color_cell(v,cs.tropical.land,c.nr)
		    				// Save to World Layer (Land)
		    				lndLyr.grid[#ix,iy] = [xy4,carr5]
	    					
	    				} else if(v <= cs.tropical.mountain.ul) {
	    				    
	    					carr5[1] = fawhNoise2_color_cell(v,cs.tropical.mountain,c.nr)
	    					carr5[2] = fawhNoise2_color_cell(v,cs.tropical.mountain,c.nr)
	    					carr5[3] = fawhNoise2_color_cell(v,cs.tropical.mountain,c.nr)
	    					carr5[4] = fawhNoise2_color_cell(v,cs.tropical.mountain,c.nr)
		    				// Save to World Layer (Land)
		    				lndLyr.grid[#ix,iy] = [xy4,carr5]
	    					
	    				}
	    				
	    			#endregion
	                
	                #region Terrain Fog Coloring
		                
		                // Init
		                var xy4 = [prvx,prvy,ix,iy]
		                var v = trnfGrid[#ix,iy]
	                    var carr5 = [1,c.nr,c.nr,c.nr,c.nr]
	                    
	                    // Set Color
	    				if(v <= cs.fog.normal.ul) {
	    				    
	    					carr5[1] = fawhNoise2_color_cell(v,cs.fog.normal,c.nr)
	    					carr5[2] = fawhNoise2_color_cell(v,cs.fog.normal,c.nr)
	    					carr5[3] = fawhNoise2_color_cell(v,cs.fog.normal,c.nr)
	    					carr5[4] = fawhNoise2_color_cell(v,cs.fog.normal,c.nr)
		    				// Save to World Layer (Fog)
		    				trnFLyr.grid[#ix,iy] = [xy4,carr5]
	    					
	    				}
		    			
	    			#endregion
	                
	    			#region Cloud Coloring
		                
		                // Init
		                var xy4 = [prvx,prvy,ix,iy]
		                var v = skyGrid[#ix,iy]
	                    var carr5 = [1,c.nr,c.nr,c.nr,c.nr]
	                    
	                    // Set Color
	    				if(v <= cs.cloud.normal.ul and v > 0) {
	    				    
	    					carr5[1] = fawhNoise2_color_cell(v,cs.cloud.normal,c.nr)
	    					carr5[2] = fawhNoise2_color_cell(v,cs.cloud.normal,c.nr)
	    					carr5[3] = fawhNoise2_color_cell(v,cs.cloud.normal,c.nr)
	    					carr5[4] = fawhNoise2_color_cell(v,cs.cloud.normal,c.nr)
		    				// Save to World Layer (Sky)
		    				skyLyr.grid[#ix,iy] = [xy4,carr5]
	    					
	    				}
	    				
	    			#endregion
	                
	                // Update previous x coordinate
	                prvx = ix
	                
	            }
	            
	            // Update previous y coordinate
	            prvy = iy
	            
	        }
	        
        #endregion
        
        #region Layer Draws
	        
	        #region Water Layer Draw
		        
		        // TODO add !i checks i.e isoar
				if(iso(wtrLyr,oWorldLayer)) {
					
					// Init & Draw Water Layer
			        surface_set_target(wtrLyr.surf1)
			        draw_world_layer(wtrLyr)
					
					// Reset
			        surface_reset_target()
			        
				}
				
			#endregion
	        
	        #region Land Layer Draw
		        
		        // TODO add !i checks i.e isoa
				if(iso(lndLyr,oWorldLayer)) {
					
					// Init & Draw Land Layer
			        surface_set_target(lndLyr.surf1)
			        draw_world_layer(lndLyr)
					
					// Reset
			        surface_reset_target()
			        
				}
				
			#endregion
		    
	        #region Terrain Fog Layer Draw
		        
		        // TODO add !i checks i.e isoa
				if(iso(trnFLyr,oWorldLayer)) {
					
					// Init & Draw Layer
			        surface_set_target(trnFLyr.surf1)
			        draw_world_layer(trnFLyr)
					
					// Reset
			        surface_reset_target()
			        
				}
				
			#endregion
	        
	        #region Sky Layer Draw
		        
		        // TODO add !i checks i.e isoa
				if(iso(skyLyr,oWorldLayer)) {
			        
			        // Cloud/Sky Layer Draw
			        surface_set_target(skyLyr.surf1)
			        draw_world_layer(skyLyr)
					
					// Reset
			        surface_reset_target()
			        
				}
				
			#endregion
	        
        #endregion
        
        // Set Init Done State
        init = f
        initd = t
	    
    #endregion

}

#endregion

#region Draw Base Surfaces onto FX Surfaces (surf2)
    
    if(isiar(id)) {
	        
	        #region Water Layer
		        
		        if(isioar(wtrLyr,oWorldLayer)) {
		        	
		        	// Init & Draw Base
		        	/*
		        	if(surface_exists(wtrLyr.surf2)) surface_free(wtrLyr.surf2)
		        	wtrLyr.surf2 = surface_create(trnWH[0],trnWH[1])
		        	*/
		        	if(!surface_exists(wtrLyr.surf2))
		        		wtrLyr.surf2 = surface_create(trnWH[0],trnWH[1])
		        	surface_set_target(wtrLyr.surf2)
		        	draw_clear_alpha(c.blk,0)
		            draw_surface(wtrLyr.surf1,0,0)
				        
					#region Water Layer Effects
						
						with(wtrLyr) {
							
							if(wLayer == WORLD.WATER) {
								
						        #region Subtractive Effects
						            
						            // Set Blendmode
						            gpu_set_blendmode(bm_subtract)
						            
						        #endregion
					            
					            // Reset Blendmode
					            gpu_set_blendmode(bm_normal)
								
							}
							
						}
						
					#endregion
		            
					// Reset
					surface_reset_target()
		            
		        }
		        
	        #endregion
	        
	        #region Land Layer
		        
		        if(isioar(lndLyr,oWorldLayer)) {
		        	
		        	// Init & Draw Base
		        	/*
		        	if(surface_exists(lndLyr.surf2)) surface_free(lndLyr.surf2)
		        	lndLyr.surf2 = surface_create(trnWH[0],trnWH[1])
		        	*/
		        	if(!surface_exists(lndLyr.surf2))
		        		lndLyr.surf2 = surface_create(trnWH[0],trnWH[1])
		        	surface_set_target(lndLyr.surf2)
		        	draw_clear_alpha(c.blk,0)
		            draw_surface(lndLyr.surf1,0,0)
				        
					#region Land Layer Effects
						
						with(lndLyr) {
							
							if(wLayer == WORLD.LAND) {
								
						        #region Subtractive Effects
						            
						            // Set Blendmode
						            gpu_set_blendmode(bm_subtract)
						            
						        #endregion
					            
					            // Reset Blendmode
					            gpu_set_blendmode(bm_normal)
								
							}
							
						}
						
					#endregion
		            
					// Reset
					surface_reset_target()
		        	
		        }
		        
	        #endregion
	        
	        #region Terrain Fog Layer
		        
		        if(isioar(trnFLyr,oWorldLayer) and !m.dbg.on) {
		        	
		        	// Init & Draw Base
		        	/*
		        	if(surface_exists(trnFLyr.surf2)) surface_free(trnFLyr.surf2)
		        	trnFLyr.surf2 = surface_create(trnfWH[0],trnfWH[1])
		        	*/
		        	if(!surface_exists(trnFLyr.surf2))
		        		trnFLyr.surf2 = surface_create(trnfWH[0],trnfWH[1])
		        	surface_set_target(trnFLyr.surf2)
		        	draw_clear_alpha(c.blk,0)
		            draw_surface(trnFLyr.surf1,0,0)
	            	
					#region Fog Layer Effects
						
						if(trnFLyr.wLayer == WORLD.FOG_TERRAIN) {
							
					        #region Subtractive Effects
					            
					            // Set Blendmode
					            gpu_set_blendmode(bm_subtract)
					            
					            #region New Game Reveal
					                
					                if(m.gstate == META.NEW_GAME
					                	and is(wmxy2)) {
					                    
					                    // Set New Game Reveal to 5% of Map Size
					                    var xy2 = wmxy2
					                    var scl = (wwh2[1]/sprite_get_height(sprLightSource))*.05
					                    draw_sprite_ext(sprLightSource,0,xy2[0],xy2[1],scl,scl,0,c.wht,1)
					                    
					                }
					                
					            #endregion
					            
					            #region Capital Reveal
					                
					                if(m.gstate == META.PLAY and is(p.startxy2pct)) {
					                    
					                    // Set New Game Reveal to 5% of Map Size
					                    var xy2 = [(wwh2[0]*p.startxy2pct[0])/m.z,
								            (wwh2[1]*p.startxy2pct[1])/m.z]
					                    var scl = (wwh2[1]/sprite_get_height(sprLightSource))*.05
					                    draw_sprite_ext(sprLightSource,0,xy2[0],xy2[1],scl,scl,0,c.wht,1)
					                    
					                }
					                
					            #endregion
					            
					            // Reset Blendmode
					            gpu_set_blendmode(bm_normal)
					            
					        #endregion
							
						}
						
					#endregion
					
					// Reset
					surface_reset_target()
					
		        }
		        
	        #endregion
	        
	        #region Sky Layer
		        
		        if(isioar(skyLyr,oWorldLayer) and cldMode == GAME_CLOUDS.ALL) {
		        	
		        	// Init & Draw Base
		        	/*
		        	if(surface_exists(skyLyr.surf2)) surface_free(skyLyr.surf2)
		        	skyLyr.surf2 = surface_create(skyWH[0],skyWH[1])
		        	*/
		        	if(!surface_exists(skyLyr.surf2))
		        		skyLyr.surf2 = surface_create(skyWH[0],skyWH[1])
		        	surface_set_target(skyLyr.surf2)
		        	draw_clear_alpha(c.blk,0)
	            	draw_surface(skyLyr.surf1,0,0)
				        
					#region Sky Layer Effects
						
						with(skyLyr) {
							
							if(wLayer == WORLD.SKY) {
				            	
					            #region Subtractive  Effects
						            
						            // Set Blendmode
						            gpu_set_blendmode(bm_subtract)
					                
					            #endregion
					            
					            // Reset Blendmode
					            gpu_set_blendmode(bm_normal)
								
							}
							
						}
						
					#endregion
		            
					// Reset
					surface_reset_target()
					
		        }
		        
	        #endregion
        
    }
    
#endregion