class Duplicates

	def self.findDuplicate(array)
	  	@hash = Hash.new 
	  	array.map{|x| @hash.has_key?(x) ? (return x) : @hash[x] = ""}	    
	    return nil
	end

  	def self.firstNonRepeating(string)
	    repeat =  Hash.new 
	    nonrepeat = []
	 	string.each_char.map{|c| repeat.has_key?(c) ? (repeat[c] = repeat[c] + 1) : repeat[c] = 1 }
	 	repeat.map{|k,v| nonrepeat << k if v == 1 }
	 	return nonrepeat.first
	end

end
