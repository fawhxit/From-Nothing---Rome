
// Basic
parent = noone
active  = f
init = f
initd = f
in_room = room

#region Init World WH/Grid Vars
	
    // Base Terrain Grid
    trnWH   = noone
    trnGrid = noone
    
    // Desert Biome Grid
    dstWH   = noone
    dstGrid = noone
    
    // Snow Biome Grid
    snwWH   = noone
    snwGrid = noone
    
    // Terrain Fog Grid
    trnfWH   = noone
    trnfGrid = noone
    
    // Cloud Grid
    skyWH   = noone
    skyGrid = noone
	
#endregion

#region Init World Layers
	
	// Water
	wtrLyr = noone
	
	// Land
	lndLyr = noone
	
	// Terrain Fog (Terrain = Water + Land Layers)
	trnFLyr = noone
	
	// Sky
	skyLyr = noone
	
#endregion

#region Color Struct
    
    cs = {
        
        #region Tropical
            
            tropical: {
                
            	#region Sea
            		
            		sea: {
            			
            			// Lower/Upper relRngit for Range
            			ll : 0.0,
            			ul : 0.5,
            			// Red
            			r1 : 0.0,
            			r2 : 96,
            			r_pct1Off: 0.67, // Lower Offset Percentage (When to start gradient from 1st color value, within UL range)
            			r_pct2Off: 0.975, // Upper Offset Percentage (When to end gradient at 2nd color value, within UL range)
            			// Green
            			g1 : 0.0,
            			g2 : 192,
            			g_pct1Off: 0.67,
            			g_pct2Off: 0.975,
            			// Blue
            			b1 : 64,
            			b2 : 255,
            			b_pct1Off: 0.0,
            			b_pct2Off: 1.0
            		
            		},
            		
            	#endregion
            	
            	#region Beach
            		
            		beach: {
            			
            			// Upper relRngit for Range
            			ll : 0.5,
            			ul : 0.55,
            			// Red
            			r1 : 255,
            			r2 : 120,
            			r_pct1Off: 0.4,
            			r_pct2Off: 0.9,
            			// Green
            			g1 : 240,
            			g2 :  80,
            			g_pct1Off: 0.4,
            			g_pct2Off: 0.9,
            			// Blue
            			b1 : 182,
            			b2 :  20,
            			b_pct1Off: 0.4,
            			b_pct2Off: 0.9
            			
            		},
            		
            	#endregion
            	
            	#region Land
            		
            		land: {
            			
            			// Upper relRngit for Range
            			ll : 0.55,
            			ul : 0.8,
            			// Red
            			r1 : 156,
            			r2 : 64,
            			r_pct1Off: 0.1,
            			r_pct2Off: 0.67,
            			// Green
            			g1 : 216,
            			g2 : 128,
            			g_pct1Off: 0.1,
            			g_pct2Off: 0.67,
            			// Blue
            			b1 : 90,
            			b2 : 24,
            			b_pct1Off: 0.1,
            			b_pct2Off: 0.67
            			
            		},
            		
            	#endregion
            	
            	#region Mountain
            		
            		mountain: {
            			
            			// Upper relRngit for Range
            			ll : 0.8,
            			ul : 1.0,
            			// Red
            			r1 : 96,
            			r2 : 255,
            			r_pct1Off: 0.33,
            			r_pct2Off: 0.9,
            			// Green
            			g1 : 96,
            			g2 : 255,
            			g_pct1Off: 0.33,
            			g_pct2Off: 0.9,
            			// Blue
            			b1 : 96,
            			b2 : 255,
            			b_pct1Off: 0.33,
            			b_pct2Off: 0.9
            			
            		}
            		
            	#endregion
            	
            },
        	
    	#endregion
	    
	    #region Cloud
            
            cloud: {
            
            	#region Normal
            		
            		normal: {
            			
            			// Lower/Upper relRngit for Range
            			ll : 0.0,
            			ul : 1.0,
            			// Red
            			r1 : 255,
            			r2 : 128,
            			r_pct1Off: 2/3, // Lower Offset Percentage (When to start gradient from 1st color value, within UL range)
            			r_pct2Off: 1.0, // Upper Offset Percentage (When to end gradient at 2nd color value, within UL range)
            			// Green
            			g1 : 255,
            			g2 : 128,
            			g_pct1Off: 2/3,
            			g_pct2Off: 1.0,
            			// Blue
            			b1 : 255,
            			b2 : 128,
            			b_pct1Off: 2/3,
            			b_pct2Off: 1.0
            		
            		}
            		
            	#endregion
	    	
            },
	    	
	    #endregion
	    
	    #region Fog
            
            fog: {
            
            	#region Normal
            		
            		normal: {
            			
            			// Lower/Upper relRngit for Range
            			ll : 0.0,
            			ul : 1.0,
            			// Red
            			r1 : 12,
            			r2 : 36,
            			r_pct1Off: 0.0, // Lower Offset Percentage (When to start gradient from 1st color value, within UL range)
            			r_pct2Off: 1.0, // Upper Offset Percentage (When to end gradient at 2nd color value, within UL range)
            			// Green
            			g1 : 12,
            			g2 : 36,
            			g_pct1Off: 0.0,
            			g_pct2Off: 1.0,
            			// Blue
            			b1 : 12,
            			b2 : 36,
            			b_pct1Off: 0.0,
            			b_pct2Off: 1.0
            		
            		}
            		
            	#endregion
	    	
            }
	    	
	    #endregion
	    
    }
	
#endregion

#region World Variables
    
    // World Relative
    wwh2 = noone
    wxy4 = noone
    
    // Window Relative
    winMid2pct = noone
    
    // Mouse Relative
    mxy2pct = noone
    mxy2	= noone
    wmxy2   = noone
    mtrnLyr	= noone
    mtrnxy2 = noone
    
    #region Cloud/Sky Layer Vars
    	
    	// Drawing
	    cldMode = noone
	    cldA	= noone // (Clouds Alpha)
	    
	    // Mouse Relative
	    mskyxy2pct = noone
	    mskyxy2    = noone
	    
	    // Offsets (For moving the clouds around)
	    cldXOD = noone // Cloud Offset Deltas (Rate of Iteration)
	    cldYOD = noone
	    cldXOR = noone // Cloud Offset Ranges (Distance Max)
	    cldYOR = noone
	    cldXOI = noone // Cloud Offset Iterators
	    cldYOI = noone
	    cldXO  = noone // Cloud Offsets (In Pixels)
	    cldYO  = noone
	    
    #endregion
    
#endregion

#region Map BG Vars
	
	/*
	mapbgi = 0
	mapbgid = 1/(room_speed/10)
	mapbgip = 1
	mapbgimx = sprite_get_number(sprMapBG)-1
	*/
	
#endregion