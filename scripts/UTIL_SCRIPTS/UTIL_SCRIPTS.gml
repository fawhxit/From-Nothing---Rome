function mouse_in_rectangle(xy4) {
	
	return (mx > xy4[0] and mx < xy4[2]
		and my > xy4[1] and my < xy4[3])
	
}

function mouse_in_gui_rectangle(xy4) {
	
	return (wmx > xy4[0] and wmx < xy4[2]
		and wmy > xy4[1] and wmy < xy4[3])
	
}

function round2(val,dec) {

    // Prepare Calc
    var base = 1
    repeat(dec) base = base*10

    // Return result
    return round(val*base)/base
	
}

function sin2(deg,val) {
	
	return (-sin(degtorad(deg)))*val
	
}

function cos2(deg,val) {
	
	return cos(degtorad(deg))*val
	
}

function roll(n) {
    
	return irandom(n)
	
}

function chance(pct) {
    
	return (pct >= max(random(100),0.00001))
	
}

function on_screen(inst) {
	
	var xx = camera_get_view_x(view_camera[0])
	var yy = camera_get_view_y(view_camera[0])
	with(inst)
		return (x > xx and x < xx+ww and y > yy and y < yy+wh)
	
}

function random_color() {
    
	return make_color_rgb(random(255),random(255),random(255))
	
}

function iterate_enum(i,SZ) {
	
	if(i >= SZ-1) return 0	// Loop Enum
	else return i+1			// Return Next
	
}

function inv_carr(carr) {
	
	return [carr[0],carr[4],carr[3],carr[2],carr[1]]
	
}

// Change quantities based on inventory
// Returns: [new_inv, old_inv, inv_delta]
function qty(val,chng) {
	
	var o = val
	var ret = clamp(val+chng,0,val+abs(chng))
	var d = ret-o
	return [ret,o,d]
	
}

// Change quantities based on inventory (w/ Limits)
// Returns: [new_inv, old_inv, inv_delta]
function qty_lim(val,chng,ll,ul) {
	
	var o = val
	var ret = clamp(val+chng,ll,ul)
	var d = ret-o
	return [ret,o,d]
	
}

function compress_val(val,valmn,valmx,ll,ul) {
	
	var pct = (val-valmn)/(valmx-valmn)
	return ((ul-ll)*pct)+ll
	
}

function delta(minu,subtra) {
	
	return minu-subtra
	
}

function delta2(minu,subtra) {
	
	return abs(minu-subtra)
	
}

function delta_dir(src,dst) {
	
	return angle_difference(dst,src)
	
}

function rot_dir(src,dst,rot) {
	
	var dlt = delta_dir(src,dst)
	if(abs(dlt) <= rot) return dst
	else if(dlt < 0)
		if(src-rot < 0) return src-rot+360
		else  return src-rot // Negative (Clockwise)
	else if(dlt > 0)
		if(src+rot >= 360) return src+rot-360
		else  return src+rot // Negative (Clockwise)
	
}

function acc_vel(src,dst,acc) {
	
	var dlt = delta(src,dst)
	if(abs(dlt) < acc) return dst
	else if(dlt < 0)
		return src+acc // Gain
	else if(dlt > 0)
		return src-acc // Loss
	
}

function point_dist(xy2_1,xy2_2) {
	
	return point_distance(xy2_1[0],xy2_1[1],xy2_2[0],xy2_2[1])
	
}

function low_dist(srcxy2,xy2Old,xy2New) {
	
	if(point_dist(srcxy2,xy2Old) > point_dist(srcxy2,xy2New)) return t
	else return f
	
}

function dist_hipct(srcxy2,dstxy2,rad) {
	
	var dist = point_dist(srcxy2,dstxy2)
	return (dist/rad)
	
}

function dist_lopct(srcxy2,dstxy2,rad) {
	
	var dist = point_dist(srcxy2,dstxy2)
	return 1-(dist/rad)
	
}

function rng_hipct(val,ll,ul) {
	
	return (val-ll)/(ul-ll)
	
}

function rng_lopct(val,ll,ul) {
	
	return 1-((val-ll)/(ul-ll))
	
}