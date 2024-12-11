#region Core
	
	function is(inst) {
		
		try {
			
			return (!is_undefined(inst) and inst != noone)
			
		} catch(_ex) {}
			
		return f
		
	}
	
	function isi(inst) {
		
		try {
			
			if(is(inst)) {
				
				if(inst.initd) inst.init = f
				return inst.initd
				
			}
			
		} catch(_ex) {}
		
		return f
		
		
	}
	
	function iso(inst,obj) {
		
		try {
			
			if(is(inst))
				if(instance_exists(inst))
					return inst.object_index == obj
			
		} catch(_ex) {}
		
		
		return f
		
	}
	
	function iso_any(inst) {
		
		try {
			
			if(is(inst)) return instance_exists(inst)
			
		} catch(_ex) {}
		
		
		return f
		
	}
	
	function isa(inst) {
		
		try {
			
			if(is(inst)) return inst.active
			
		} catch(_ex) {}
		
		return f
		
	}
	
	function isr(inst) {
		
		try {
			
			if(is(inst)) return inst.in_room == room
			
		} catch(_ex) {}
		
		return f
		
	}
	
	function isar(inst) {
		
		try {
			
			if(is(inst)) return (isa(inst) and isr(inst))
			
		} catch(_ex) {}
		
		return f
		
	}
	
	function isia(inst) {
		
		try {
			
			is(inst) return (isi(inst) and isa(inst))
			
		} catch(_ex) {}
		
		return f
		
	}
	
	function isio(inst,obj) {
		
		try {
			
			is(inst) return (isi(inst) and iso(inst,obj))
			
		} catch(_ex) {}
		
		return f
		
	}
	
	function isir(inst) {
		
		try {
			
			is(inst) return (isi(inst) and isr(inst))
			
		} catch(_ex) {}
		
		return f
		
	}
	
	function isior(inst,obj) {
		
		try {
			
			is(inst) return (isi(inst) and iso(inst,obj) and isr(inst))
			
		} catch(_ex) {}
		
		return f
		
	}
	
	function isioa(inst,obj) {
		
		try {
			
			if(is(inst)) return (isi(inst) and iso(inst,obj) and isa(inst))
			
		} catch(_ex) {}
		
		return f
		
	}
	
	function isiar(inst) {
		
		try {
			
			return (isi(inst)
				and isa(inst)
				and isr(inst))
			
		} catch(_ex) {}
		
		return f
		
	}
	
	function isioar(inst,obj) {
		
		try {
			
			return (isi(inst)
				and iso(inst,obj)
				and isa(inst)
				and isr(inst))
			
		} catch(_ex) {}
		
		return f
		
	}
	
#endregion

#region DS
	
	function isl(inst,fill_check) {
		
		var rtn = f
		
		try {
			
			if(is(inst)) {
				
				rtn = ds_exists(inst,ds_type_list)
				if(rtn and fill_check) rtn = !ds_list_empty(inst)
				
			}
			
		} catch(_ex) {}
		
		return rtn
		
	}
	
#endregion