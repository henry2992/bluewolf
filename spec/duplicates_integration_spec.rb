require "duplicates"


describe "integration" do
  

  #FindDuplicate Test Integration
  array1 =  [1,2,3,4,5,6,7,8,5,9] #Duplicate is 5 Ordered Array
  array2 =  [9,8,2,1,4,5,7,3,6,8] #Duplicate is 8 Not ordered Array 	
  array3 = 	[4,4,2,1,3,5,8,7,6,9] #Duplicate at the beggining
  array4 = 	[1,2,3,3,4,5,6,7,7,8] #2 Duplicates, first is 3 second 7
  array5 = 	[1,2,3,4,5,6,7,8,9,10]  #No Duplicate 

  # Array of a Million numbers 
  ar = Array.new
  (0..1000000).map{|i| ar[i] = i} # Fill the Array
  random = ar[rand(1000000)] # Randomise the repetition	
  ar[rand(1000000)]= random
    
  before do
    @results1 = Duplicates.findDuplicate(array1)
    @results2 = Duplicates.findDuplicate(array2)
    @results3 = Duplicates.findDuplicate(array3)
    @results4 = Duplicates.findDuplicate(array4)
    @results5 = Duplicates.findDuplicate(array5)
    @results6 = Duplicates.findDuplicate(ar)
  end

  describe Duplicates do
    it "Should find the right dupicate for Array 1" do
       expect(@results1).to eq 5
    end

    it "Should find the right dupicate for Array 2" do
       expect(@results2).to eq 8
    end

    it "Should find the right dupicate for Array 3" do
       expect(@results3).to eq 4
    end


    it "Should not find the wrong duplicate for Array 1" do
    	array1.map{|c| expect(@results1).not_to eq c if c != 5 }  
    end
    it "Should not find the wrong duplicate for Array 2" do
		array2.map{|c| expect(@results2).not_to eq c if c != 8 }
    end
    it "Should not find the wrong duplicate for Array 3" do
    	array3.map{|c| expect(@results3).not_to eq c if c != 4 }
    end

    it "Should find only the first duplicate, in case there are more" do
    	expect(@results4).to eq 3
    end

    it "Should return Fixnum value if duplicate exits" do
    	expect(@results1.class).to eq Fixnum
    	expect(@results2.class).to eq Fixnum
    	expect(@results3.class).to eq Fixnum
    	expect(@results4.class).to eq Fixnum
    end

    it "Should return nil value if duplicate does not exits" do
    	expect(@results5).to eq nil
    end
      

    # Million Values Array
    it "Should find the right duplicate for Array of million values" do
       expect(@results6).to eq random
    end

    # Proving Matematically
    # Assuming that the Array contains all numbers from 1-1000000, 
    # It is posible to find the duplicate by running the folowing math equation.
    it "Should find the right dupicate and probe it Matematically" do
		a =*(1..ar.length)
		a = a.inject(0){|sum,x| sum + x }
		b =  ar.inject(0){|sum,x| sum + x }
      	result = ar.length - (a - b)    
       	expect(@results6).to eq random
    end


    #TEST SUITES FOR CHARACTERS


    string1 =  "AHEJCBBAEICI"  #2 Characters non-repeating H,J
  	string2 =  "AHEJCBBAEICIHJ"  #All characters Repeated 	
  	string3 =  "" #Empty
  	

    before do
	    @string_results1 = Duplicates.firstNonRepeating(string1)
	    @string_results2 = Duplicates.firstNonRepeating(string2)
	    @string_results3 = Duplicates.firstNonRepeating(string3)
	end

	it "Should find only first non-repeating character" do
       expect(@string_results1).to eq 'H'
    end

    it "Should not find the wrong non-repeating character" do
    	string1.each_char.map{|c| expect(@string_results1).not_to eq c if c != 'H' }  
    end

    it "Should return nil if all are repeating characters" do
       expect(@string_results2).to eq nil
    end

    it "Should return nil if string is empty" do
       expect(@string_results3).to eq nil
    end

    it "Should return a String if Character exists" do 
    	expect(@string_results1.class).to eq String
    end
 
  end
end
