
#region Draw World Layers (Actual)
    
    if(isiar(id) and surface_exists(surf2)) {
	        
	        switch(wLayer) {
	            
				case WORLD.WATER:
				    
				    draw_surface_ext(surf2,w.wxy4[0],w.wxy4[1],m.z,m.z,0,c.wht,1)
				    
				break
				
				case WORLD.LAND:
				    
				    draw_surface_ext(surf2,w.wxy4[0],w.wxy4[1],m.z,m.z,0,c.wht,1)
				    
				break
				
				case WORLD.FOG_TERRAIN:
				    
				    if(!m.dbg.on)
				        draw_surface_ext(surf2,w.wxy4[0],w.wxy4[1],m.z,m.z,0,c.wht,1)
				    
				break
				
				case WORLD.SKY:
					
					// Shadows
					if(w.cldMode != GAME_CLOUDS.NONE)
					    draw_surface_ext(surf2,w.wxy4[0]-(m.z*3)+w.cldXO,
					    	w.wxy4[1]+(m.z*3)+w.cldYO,m.z,m.z,0,c.dgry,w.cldA/2)
					
					// Clouds
					if(w.cldMode == GAME_CLOUDS.ALL)
					    draw_surface_ext(surf2,w.wxy4[0]+w.cldXO,
							w.wxy4[1]+w.cldYO,m.z,m.z,0,c.wht,w.cldA)
				
				break
	            
	        }
        
    }
    
#endregion