function world_init(wh2) {
    
    if(iso(w,oWorld)) {
        
        with(w) {
            
            #region Init World Grids
                
                // Base Terrain Grid
                trnWH = [wh2[0],wh2[1]]
                if(ds_exists(trnGrid,ds_type_grid))
                    ds_grid_destroy(trnGrid)
                trnGrid = ds_grid_create(trnWH[0],trnWH[1])
				
				// Set Zoom Min (Based on window/map heights)
				m.zmn = (wh/trnWH[1])*4/5
				m.z = m.zmn
                
                // Desert Biome Grid
                /* TODO TODO TODO
                dstWH = [trnWH[0]/2,trnWH[1]/2]
                if(ds_exists(dstGrid,ds_type_grid))
                    ds_grid_destroy(dstGrid)
                dstGrid = ds_grid_create(dstWH[0],dstWH[1])
                
                // Snow Biome Grid
                snwWH = [trnWH[0]/2,trnWH[1]/2]
                if(ds_exists(snwGrid,ds_type_grid))
                    ds_grid_destroy(snwGrid)
                snwGrid = ds_grid_create(snwWH[0],snwWH[1])
                */
                
                // Terrain Fog Grid
                trnfWH = trnWH
                if(ds_exists(trnfGrid,ds_type_grid))
                    ds_grid_destroy(trnfGrid)
                trnfGrid = ds_grid_create(trnfWH[0],trnfWH[1])
                
                // Cloud Grid
                skyWH = trnWH
                if(ds_exists(skyGrid,ds_type_grid))
                    ds_grid_destroy(skyGrid)
                skyGrid = ds_grid_create(skyWH[0],skyWH[1])
                
            #endregion
            
            #region Init World Layers
            	
            	// Water
            	if(iso(wtrLyr,oWorldLayer)) instance_destroy(wtrLyr)
            	wtrLyr = instance_create_layer(0,0,"WaterBG",oWorldLayer)
            	wtrLyr.parent = id
            	wtrLyr.wLayer = WORLD.WATER
        		wtrLyr.grid = ds_grid_create(trnWH[0],trnWH[1])
        		wtrLyr.surf1 = surface_create(trnWH[0],trnWH[1])
        		ds_grid_clear(wtrLyr.grid,noone)
            	
            	// Land
            	if(iso(lndLyr,oWorldLayer)) instance_destroy(lndLyr)
            	lndLyr = instance_create_layer(0,0,"LandBG",oWorldLayer)
            	lndLyr.parent = id
            	lndLyr.wLayer = WORLD.LAND
        		lndLyr.grid = ds_grid_create(trnWH[0],trnWH[1])
        		lndLyr.surf1 = surface_create(trnWH[0],trnWH[1])
        		ds_grid_clear(lndLyr.grid,noone)
            	
            	// Terrain Fog (Terrain = Water + Land Layers)
            	if(iso(trnFLyr,oWorldLayer)) instance_destroy(trnFLyr)
            	trnFLyr = instance_create_layer(0,0,"TerrainFade",oWorldLayer)
            	trnFLyr.parent = id
            	trnFLyr.wLayer = WORLD.FOG_TERRAIN
        		trnFLyr.grid = ds_grid_create(trnfWH[0],trnfWH[1])
        		trnFLyr.surf1 = surface_create(trnfWH[0],trnfWH[1])
        		ds_grid_clear(trnFLyr.grid,noone)
            	
            	// Sky
            	if(iso(skyLyr,oWorldLayer)) instance_destroy(skyLyr)
            	skyLyr = instance_create_layer(0,0,"SkyBG",oWorldLayer)
            	skyLyr.parent = id
            	skyLyr.wLayer = WORLD.SKY
        		skyLyr.grid = ds_grid_create(skyWH[0],skyWH[1])
        		skyLyr.surf1 = surface_create(skyWH[0],skyWH[1])
        		ds_grid_clear(skyLyr.grid,noone)
            	
            #endregion
            
            #region World Variables
					
					// World Relative
					wwh2 = [trnWH[0]*m.z,trnWH[1]*m.z]
					
					// Start Map Centered
					var wm = ww-wwh2[0]
					var hm = wh-wwh2[1]
					wxy4 = [wm/2,hm/2,(wm/2)+wwh2[0],(hm/2)+wwh2[1]]
					
					// Mouse Relative
					mxy2pct = noone
					mxy2 = noone
					
					#region Cloud/Sky Vars
						
						// Drawing
						cldMode = GAME_CLOUDS.ALL
						cldA    = 1 // (Clouds Alpha)
						
						// Mouse Relative
						mskyxy2pct  = noone
						mskyxy2     = noone
						
						// Offsets (For moving the clouds around)
						cldXOR = random_range(-50,50)
						cldYOR = random_range(-50,50)
						cldXOD = random_range(-.1,.1)/max(cldXOR,1)
						cldYOD = random_range(-.1,.1)/max(cldYOR,1)
						cldXOI = random(359.999)
						cldYOI = random(359.999)
						cldXO  = cos2(cldXOI,cldXOR*m.z)
						cldYO  = sin2(cldYOI,cldYOR*m.z)
					
					#endregion
					
            #endregion
            
            #region Player Variables
            	
				p.tGrid = ds_grid_create(trnWH[0],trnWH[1])
				ds_grid_clear(p.tGrid,0)
				p.tSurf = surface_create(trnWH[0],trnWH[1])
            	
            #endregion
            
        }
        
    }
    
}

/*  Legend/Help:
 *  
 *	wc == world cell
 *	cwc == claimed world cell
 *  uwc == unclaimed world cell
 *  
*/

#region Is Scripts
	
	function is_wc(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			return ((txy2_[0] >= 0 and txy2_[0] < w.trnWH[0])
				and (txy2_[1] >= 0 and txy2_[1] < w.trnWH[1]))
			
		}
		
		return f
		
	}
	
	function is_cwc(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			if(is_wc(inst,txy2_))
				return (tGrid[#txy2_[0],txy2_[1]] > 0.01)
			
		}
		
		return f
		
	}
	
	function is_uwc(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			return (is_wc(inst,txy2_) and !is_cwc(inst,txy2_))
			
		}
		
		return f
		
	}
	
	function wc_is_land(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			if(is_wc(inst,txy2_))
				return is(w.lndLyr.grid[#txy2_[0],txy2_[1]])
			
		}
		
		return f
		
	}
	
	function wc_is_habit(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			if(is_wc(inst,txy2_)) {
				
				var wcv = get_wcv(inst,txy2_)
				return (wc_is_land(inst,txy2_)
					and wcv >= tVll and wcv <= tVul)
					
			}
			
		}
		
		return f
		
	}
	
	function cwc_is_grow(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			if(is_cwc(inst,txy2_)) {
				
				// TODO: Add Factors, Conditions, ect.
					return (chance(100/3))
				
			}
			
		}
		
		return f
		
	}
	
	function uwc_is_expand(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			if(is_uwc(inst,txy2_)) {
				
				// TODO: Add Factors, Conditions, ect.
				return (chance(100/1.5))
				
			}
			
		}
		
		return f
		
	}
	
	function cwc_is_adj_to_uwc(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			if(is_cwc(inst,txy2_)) {
				
				var txy2a = get_uwc_adjs(inst,txy2_)
				return (txy2a[0] != noone
					or  txy2a[1] != noone
					or  txy2a[2] != noone
					or  txy2a[3] != noone)
				
			}
			
		}
		
		return f
		
	}
	
	function uwc_is_adj_to_cwc(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			if(is_uwc(inst,txy2_)) {
				
				var txy2a = get_cwc_adjs(inst,txy2_)
				return (txy2a[0] != noone
					or  txy2a[1] != noone
					or  txy2a[2] != noone
					or  txy2a[3] != noone)
				
			}
			
		}
		
		return f
		
	}
	
#endregion

#region Get Scripts
	
	function get_wc_adjs(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			var txy2a = [noone,noone,noone,noone]
			
			if(is_wc(inst,[txy2_[0]-1,txy2_[1]]))
				txy2a[0] = [txy2_[0]-1,txy2_[1]]
				
			if(is_wc(inst,[txy2_[0]+1,txy2_[1]]))
				txy2a[1] = [txy2_[0]+1,txy2_[1]]
				
			if(is_wc(inst,[txy2_[0],txy2_[1]-1]))
				txy2a[2] = [txy2_[0],txy2_[1]-1]
				
			if(is_wc(inst,[txy2_[0],txy2_[1]+1]))
				txy2a[3] = [txy2_[0],txy2_[1]+1]
			
			return txy2a
			
		}
		
		return [noone,noone,noone,noone]
		
	}
	
	function get_cwc_adjs(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			var txy2a = [noone,noone,noone,noone]
			
			if(is_cwc(inst,[txy2_[0]-1,txy2_[1]]))
				txy2a[0] = [txy2_[0]-1,txy2_[1]]
				
			if(is_cwc(inst,[txy2_[0]+1,txy2_[1]]))
				txy2a[1] = [txy2_[0]+1,txy2_[1]]
				
			if(is_cwc(inst,[txy2_[0],txy2_[1]-1]))
				txy2a[2] = [txy2_[0],txy2_[1]-1]
				
			if(is_cwc(inst,[txy2_[0],txy2_[1]+1]))
				txy2a[3] = [txy2_[0],txy2_[1]+1]
			
			return txy2a
			
		}
		
		return [noone,noone,noone,noone]
		
	}
	
	function get_uwc_adjs(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			var txy2a = [noone,noone,noone,noone]
			
			if(is_uwc(inst,[txy2_[0]-1,txy2_[1]]))
				txy2a[0] = [txy2_[0]-1,txy2_[1]]
				
			if(is_uwc(inst,[txy2_[0]+1,txy2_[1]]))
				txy2a[1] = [txy2_[0]+1,txy2_[1]]
				
			if(is_uwc(inst,[txy2_[0],txy2_[1]-1]))
				txy2a[2] = [txy2_[0],txy2_[1]-1]
				
			if(is_uwc(inst,[txy2_[0],txy2_[1]+1]))
				txy2a[3] = [txy2_[0],txy2_[1]+1]
			
			return txy2a
			
		}
		
		return [noone,noone,noone,noone]
		
	}
	
	function get_wcv(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			if(is_wc(inst,txy2_))
				return (w.trnGrid[#txy2_[0],txy2_[1]])
			
		}
		
		return noone
		
	}
	
	function get_wcv_mod(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			if(is_wc(inst,txy2_))
				return get_cwcv_ul(inst,txy2_)
			
		}
		
		return noone
		
	}
	
	function get_cwcv(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			if(is_cwc(inst,txy2_))
				return (tGrid[#txy2_[0],txy2_[1]])
			
		}
		
		return noone
		
	}
	
	function get_cwcv_ul(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			var cty = get_cwc_city(inst,txy2_)
			
			if(is(cty) and is_wc(inst,txy2_)) {
				
				// Base UL, Based on Terrain to Territory Range
				var base = rng_lopct(get_wcv(inst,txy2_),tVll,tVul)
				
				// CWC's Urban Percentage
				var pct = get_cwc_urban_pct(inst,txy2_)
				
				// City Limit; 1 - City Development
				var cl = get_cwc_city_lim(inst,txy2_)
				
				
				/***************************************
				 *  TODO Closer to City; More Dense    *
				 *  TODO Farther from City; More Rural *
				 ***************************************/
				
				// BROKEN
				// Set Out of City Pct based on dist from city
				var dpct = cty[E.dv]
				var dpct2 = 0 // ul percent to city limit
				if(is(tFarDist)) {
					dpct = 1-(point_dist(cty[E.xy],txy2_)/tFarDist) // From City To Border 
					dpct2 = min(1,(cty[E.rd]*cty[E.dv])/tFarDist) // From 
				}
				
				// If In City Limit, Base UL to Max based on Development
				// If Not, 0 to Base UL based on City Development
				if(pct > cl) return lerp(base,1,cty[E.dv])
				else return lerp(
					lerp(0.02,base,dpct2),
					lerp(base,lerp(base,1,cty[E.dv]),dpct2),
					dpct)
				
			}
			
		}
		
		return noone
		
	}
	
	function get_cwc_city(inst,txy2_) {
		
		var rtn = noone
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			if(isl(cityL,t)) {
				
				var sz = ds_list_size(cityL)
				for(var i = 0; i < sz; i++)
					if(rtn == noone) rtn = cityL[|i]
					else if(low_dist(txy2_,rtn[|i][E.xy],cityL[|i][E.xy]))
						rtn = cityL[|i]
				
			}
			
		}
		
		return rtn
		
	}
	
	function get_cwc_city_lim(inst,txy2_) {
		
		var rtn = noone
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			var cty = get_cwc_city(inst,txy2_)
			
			if(is(cty)) rtn = 1-cty[E.dv]
			
		}
		
		return rtn
		
	}
	
	function get_cwc_urban_pct(inst,txy2_) {
		
		var rtn = noone
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			var cty = get_cwc_city(inst,txy2_)
			
			if(is(cty)) rtn = dist_lopct(cty[E.xy],txy2_,cty[E.rd])
			
		}
		
		return rtn
		
	}
	
	function get_cwc_rural_pct(inst,txy2_) {
		
		var rtn = noone
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			var cty = get_cwc_city(inst,txy2_)
			
			if(is(cty)) rtn = dist_hipct(cty[E.xy],txy2_,cty[E.rd])
			
		}
		
		return rtn
		
	}
	
	function get_cwcv_pct(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			if(is_cwc(inst,txy2_))
				return (get_cwcv(inst,txy2_)/get_cwcv_ul(inst,txy2_))
			
		}
		
		return noone
		
	}
	
#endregion

#region Set Scripts
	
	function set_cwcv(inst,txy2_,val) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			if(is_wc(inst,txy2_))
				tGrid[#txy2[0],txy2[1]] = clamp(get_cwcv(id,txy2)+val,0,get_cwcv_ul(id,txy2))
			
		}
		
	}
	
#endregion

#region Adjacent Scripts
	
	function wc_adj_cwc_sum(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			// Init
			var cnt = 0
			var txy2a = get_cwc_adjs(inst,txy2_)
			
			// Add em' up
			if(txy2a[0] != noone) cnt++
			if(txy2a[1] != noone) cnt++
			if(txy2a[2] != noone) cnt++
			if(txy2a[3] != noone) cnt++
			
			// Return Sum
			return cnt
			
		}
		
		return noone
		
	}
	
	function wc_adj_cwcv_sum(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			// Init
			var sum = 0
			var txy2a = get_cwc_adjs(inst,txy2_)
			
			// Add em' up
			if(txy2a[0] != noone) sum += get_cwcv(inst,txy2a[0])
			if(txy2a[1] != noone) sum += get_cwcv(inst,txy2a[1])
			if(txy2a[2] != noone) sum += get_cwcv(inst,txy2a[2])
			if(txy2a[3] != noone) sum += get_cwcv(inst,txy2a[3])
			
			// Return Sum
			return sum
			
		}
		
		return noone
		
	}
	
	function wc_adj_cwcv_avg(inst,txy2_) {
		
		if(isioar(inst,oPlayer)) with(inst) {
			
			var cnt = wc_adj_cwc_sum(inst,txy2_)
			var sum = wc_adj_cwcv_sum(inst,txy2_)
			
			if(cnt != noone and sum != noone and cnt != 0)
				return sum/cnt
			
		}
		
		return noone
		
	}

#endregion