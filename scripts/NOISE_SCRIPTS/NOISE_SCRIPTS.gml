/// @description Compress random circles that fill grid to create "perlin-like" noise.
/// Use ie: fawhNoise(someGrid,6,40,1,0.25,255,t)
function fawhNoise2(grid,rmn,rmx,sep,vmn,vmx,ul,ll,pct,pct_ll,reps,repMltMn,repMltMx,invert) {
	
	// Grid Arg/Init
	var wd = ds_grid_width(grid)
	var ht = ds_grid_height(grid)
	
	// Clear Grid
	ds_grid_clear(grid,0)
	
	// Gen Init
	var v = 0
	var r = 0
	var do_reps = f
	var repi = 0
	var rx = undefined
	var ry = undefined
	var all_done = f
	var ixo = undefined
	for(var iy = 0; iy < ht; iy+=sep) {
		
	   for(var ix = 0; ix < wd; ix+=sep) {
	   		
	   		// Generate Disk Value
			r = random_range(rmn,rmx)
			v = random_range(vmn,vmx)
			
			// Add Value Disk
			ds_grid_add_disk(grid,ix,iy,r,v)
			
			#region Repetition Logic
				
				// Start Reps?
				var last  = (iy >= ht-sep and ix >= wd-sep)
				var start = (last and reps > 0 and !do_reps)
				if(start) do_reps = t
				
				if(do_reps) {
					
					var first_rep = (is_undefined(rx) and is_undefined(ry))
					var rx_done   = f
					var ry_done   = f
					if(!first_rep) {
						
						rx_done = (ix >= rx)
						ry_done = (iy >= ry)
						
					}
					var rep_done  = (rx_done and ry_done)
					var reps_done = (rep_done and repi >= reps-1)
					
					if(!reps_done) {
						
						if(first_rep or (!first_rep and rep_done)) {
							
							var gA = ht*wd
							rx = floor(gA*random_range(repMltMn,repMltMx))
							ry = floor(gA*random_range(repMltMn,repMltMx))
							ix = irandom_range(0,(wd-rx)-sep)
							iy = irandom_range(0,(ht-ry)-sep)
							ixo = ix
							repi += 1
							
							if(invert and irandom(1) == 1) {
								
								vmn = vmx*-1
								vmx = vmn*-1
								
							}
							
						} else if(rx_done) {
							
							ix  = ixo
							iy += sep
							
						}
						
					} else {
						
						// Totally Done
						all_done = t
						break
						
					}
					
				}
				
			#endregion
			
		}
		
		if(all_done) break
		
	}
	
	//GENERATION DONE! But max value is unknown. Normalize values
	var gridmx = (ds_grid_get_max(grid,rmx,rmx,wd - rmx,ht - rmx) + 1)
	var gridmn =  ds_grid_get_min(grid,rmx,rmx,wd - rmx,ht - rmx)
	
	// loop through grid and set range from to ll - ul (ul is set above)
	for(var iy = 0; iy < ht; iy++)
	    for(var ix = 0; ix < wd; ix++) {
			
		   // Normalize
		   v = floor((grid[#ix,iy]-gridmn) * ul / (gridmx - gridmn))
			
		   // If value is == to Lower relRngit reduce to 0
		   var r = max(v,ll)
		   if(r == ll) r = 0
			
		   // Update Grid
			if(!pct) grid[#ix,iy] = r
			else if(pct_ll)grid[#ix,iy] = clamp((r-ll)/(ul-ll),0,1)
			else grid[#ix,iy] = r/ul
			
	   }
	
}

function fawhNoise2_centered(grid,rmn,rmx,sep,vmn,vmx,ul,ll,pct,pct_ll,reps,repMltMn,repMltMx,invert) {
	
	// Grid Arg/Init
	var wd = ds_grid_width(grid)
	var ht = ds_grid_height(grid)
	
	// Clear Grid
	ds_grid_clear(grid,0)
	
	// Gen Init
	var v = 0
	var r = 0
	var do_reps = f
	var repi = 0
	var rx = undefined
	var ry = undefined
	var all_done = f
	var ixo = undefined
	for(var iy = 0; iy < ht; iy+=sep) {
		
	   for(var ix = 0; ix < wd; ix+=sep) {
			
			// Gen Disks to Grid
			// Left
			var distCL = abs(point_distance(0,0,wd*(1/4),ht/2))
			var distL = abs(point_distance(ix,iy,wd*(1/4),ht/2))
			var modrvL = max(distL,1)/distCL
			// Right
			var distCR = abs(point_distance(wd,ht,wd*(3/4),ht/2))
			var distR = abs(point_distance(ix,iy,wd*(3/4),ht/2))
			var modrvR = max(distR,1)/distCR
			
			// Apply Mod
			if(modrvL > modrvR) {
				
				r = random_range(rmn,rmx)/(1+(modrvL/4))
				v = random_range(vmn,vmx)/(1+(modrvL/4))
				
			} else {
				
				r = random_range(rmn,rmx)/(1+(modrvR/4))
				v = random_range(vmn,vmx)/(1+(modrvR/4))
				
			}
			
			// Add Value Disk
			ds_grid_add_disk(grid,ix,iy,r,v)
			
			#region Repetition Logic
				
				// Start Reps?
				var last  = (iy >= ht-sep and ix >= wd-sep)
				var start = (last and reps > 0 and !do_reps)
				if(start) do_reps = t
				
				if(do_reps) {
					
					var first_rep = (is_undefined(rx) and is_undefined(ry))
					var rx_done   = f
					var ry_done   = f
					if(!first_rep) {
						
						rx_done = (ix >= rx)
						ry_done = (iy >= ry)
						
					}
					var rep_done  = (rx_done and ry_done)
					var reps_done = (rep_done and repi >= reps-1)
					
					if(!reps_done) {
						
						if(first_rep or (!first_rep and rep_done)) {
							
							var gA = ht*wd
							rx = floor(gA*random_range(repMltMn,repMltMx))
							ry = floor(gA*random_range(repMltMn,repMltMx))
							ix = irandom_range(0,(wd-rx)-sep)
							iy = irandom_range(0,(ht-ry)-sep)
							ixo = ix
							repi += 1
							
							if(invert and irandom(1) == 1) {
								
								vmn = vmx*-1
								vmx = vmn*-1
								
							}
							
						} else if(rx_done) {
							
							ix  = ixo
							iy += sep
							
						}
						
					} else {
						
						// Totally Done
						all_done = t
						break
						
					}
					
				}
				
			#endregion
			
		}
		
		if(all_done) break
		
	}
	
	//GENERATION DONE! But max value is unknown. Normalize values
	var gridmx = (ds_grid_get_max(grid,rmx,rmx,wd - rmx,ht - rmx) + 1)
	var gridmn =  ds_grid_get_min(grid,rmx,rmx,wd - rmx,ht - rmx)
	
	// loop through grid and set range from to ll - ul (ul is set above)
	for(var iy = 0; iy < ht; iy++)
	    for(var ix = 0; ix < wd; ix++) {
			
		   // Normalize
		   v = floor((grid[#ix,iy]-gridmn) * ul / (gridmx - gridmn))
			
		   // If value is == to Lower relRngit reduce to 0
		   var r = max(v,ll)
		   if(r == ll) r = 0
			
		   // Update Grid
			if(!pct) grid[#ix,iy] = r
			else if(pct_ll)grid[#ix,iy] = clamp((r-ll)/(ul-ll),0,1)
			else grid[#ix,iy] = r/ul
			
	   }
	
}

function fawhNoise2_percentize(grid,ul,ll) {
	
	// Init
	var wd = ds_grid_width(grid)
	var ht = ds_grid_height(grid)
	
	// loop through grid and percentize
	for(var iy = 0; iy < ht; iy++)
	    for(var ix = 0; ix < wd; ix++)
			if(is_undefined(ll)) grid[#ix,iy] = clamp(grid[#ix,iy]/ul,0,1)
			else grid[#ix,iy] = (grid[#ix,iy]-ll)/(ul-ll)
	
}

function fawhNoise2_color_cell(v,col,dbg_c) {
	
	// Init
	var r = color_get_red(dbg_c)
	var g = color_get_green(dbg_c)
	var b = color_get_blue(dbg_c)
	var relRng = col.ul-col.ll
	var relV   = v-col.ll
	
	// Ocean Deep -> Shallow
	// Set Red
	var relUL = relRng*col.r_pct2Off
	var relLL = relRng*col.r_pct1Off
	var pct1 = 0
	var pct2 = 0
	if(relLL != 0) pct1 = clamp(floor(relV/relLL),0,1)
	else pct1 = 1
	pct2 = ((relV-relLL)/(relUL-relLL))*pct1
	pct1 = 1-pct2
	if(col.r1 < col.r2)
		r = clamp((col.r1*pct1)+(col.r2*pct2),col.r1,col.r2)
	else r = clamp((col.r1*pct1)+(col.r2*pct2),col.r2,col.r1)
	
	// Set Green
	relUL = relRng*col.g_pct2Off
	relLL = relRng*col.g_pct1Off
	if(relLL != 0) pct1 = clamp(floor(relV/relLL),0,1)
	else pct1 = 1
	pct2 = ((relV-relLL)/(relUL-relLL))*pct1
	pct1 = 1-pct2
	if(col.g1 < col.g2)
		g = clamp((col.g1*pct1)+(col.g2*pct2),col.g1,col.g2)
	else g = clamp((col.g1*pct1)+(col.g2*pct2),col.g2,col.g1)
	
	// Set Blue
	relUL = relRng*col.b_pct2Off
	relLL = relRng*col.b_pct1Off
	if(relLL != 0) pct1 = clamp(floor(relV/relLL),0,1)
	else pct1 = 1
	pct2 = ((relV-relLL)/(relUL-relLL))*pct1
	pct1 = 1-pct2
	if(col.b1 < col.b2)
		b = clamp((col.b1*pct1)+(col.b2*pct2),col.b1,col.b2)
	else b = clamp((col.b1*pct1)+(col.b2*pct2),col.b2,col.b1)
	
	// Make
	return make_color_rgb(r,g,b)
	
}