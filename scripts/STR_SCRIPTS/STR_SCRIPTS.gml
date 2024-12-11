function string_cap(str) {
	
	var char = string_upper(string_char_at(str,1))
	return string(char+string_copy(str,2,string_length(str)))
	
}

function string_capAll(str) {
	
	var ret = ""
	var arr = string_split(str," ")
	for(var i = 0; i < array_length(arr); i ++) {
		var e = arr[i]
		if(e == "") continue
		var char = string_upper(string_char_at(e,1))
		if(string_length(e) > 1)
			ret += string(char+string_copy(e,2,string_length(e)))+" "
		else ret += char+" "
	}
	
	return string_trim(ret)
	
}

function string_clean(str) {
	
	try {
		
		str = string_trim(str)
		var str2
		do {
			
			// Remove middle whitespace
			str2 = str
			str = string_replace_all(str,"  "," ")
			
		} until(str == str2) // Break when no change
		
	} catch(_ex) {
		
		str = ""
		
	}
	
	return str
	
}