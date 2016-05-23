task :default => [:run]

desc "pretty print review tweets generated from reviews and movies json"
task "run" do
  $LOAD_PATH.unshift(File.dirname(__FILE__), "lib", "data")
  
  require 'duplicates'

  #Given an array with 1,000,000 integers between 1 and 1,000,000, one integer is in the array twice. Find the duplicate.
  array =  [1,2,3,4,5,6,5,7,8,9]
  duplicate = Duplicates.findDuplicate(array)
  puts "Duplicate in Array is #{duplicate}"


  # Find the first non­repeating character in a string: ("DEFD" ­> E)	
  string = "DEFD"
  duplicateChar = Duplicates.firstNonRepeating(string)
  puts "First Non Repeating character is #{duplicateChar}"

end


