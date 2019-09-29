# eggs (1)
# peanuts (2)
# shellfish (4)
# strawberries (8)
# tomatoes (16)
# chocolate (32)
# pollen (64)
# cats (128)

# Using Dynamic Programming to solve a Subset sum problem.


def subset_matrix(target)
  # setting true and fal;se to a variable to use when filling arrays in later steps
  t = true
  f = false
  

  # Step 1 - create an array with the allergy numbers. If any match Target directly then then return that number or allergy.
  allergies = [0 ,1, 2, 4, 8, 16, 32, 64, 128]

  puts allergies.include?(target) ? "The only allergy is #{target}" : "There may be a set of Allergies...(Press enter to calculate)"
  gets.chomp
  system("clear")

  #This will exit the program if we have already found the allergy cause why bother with the hectic calculations unnecessarily?
  if  allergies.include?(target) == true
    exit
  end 

  # Step 2 - create an array of 0 - target number i.e the number that we are trying to find the subsets for.
  target_array = (0..target).to_a

  #Step 3 - The 0 column will all be true...the first true false value for each allergy number will be true.
  #       - compare the first allergy number to each number and see if it will fit. Basically if it isn't that exact number then it wont...its only one number
  #       - If the allergy number is less than the target array number we are comparing. Then we just take the true false value from above 
  #       - If it is equal to or greater than the number above it than we go back as many steps in the above row as the allergy number.
  #       - Do this for each allergy number against each target array number.

  # simple example as table  
  #  0 1 2 3 4
  #1 t t f f f 
  #2 t t t t f
  #3 t t t t t
  #4 t t t t t

  # The bottom right corner indicates that there is at least one subset that matches our target number. we will figure out what they are in the next steps.
  # Essentially for the allergy version we should end with 8 arrays and each will have a number of elements equal to the target number.
  # each of those elements will be a true or a false. Here goes :D.

  # Creating row 1
  element = 0 # setting an element variable to determine which element of the allergies array to compare to the target array.
  row1 = [] # empty array to append the true or flase to.
  target_array.each {|num| num == allergies[element] ?  row1 << t : row1 << f}
  row1[0] = t #the first column is set to true all the way down for this algorithm to work
  element += 1 # Adding 1 to the element so we can compare the next allergy number in row 2

  # Creating row 2

  table = [row1, 2, 3, 4] # An array to hold the other row arrays
  table_element = 1
  current_table_element = 0

  while table_element < allergies.length

  table[table_element] = []
  previous_row_element = 0 
  

  # until the length of the new row is equal to the allergy element value that we are comparing append the corresponding row 1 element value 
  # to the new row 
   while table[table_element].length < allergies[element]
       table[table_element] << table[current_table_element][previous_row_element]
       previous_row_element += 1
   end

   #row element is reset so that it the value of the allergy array back in the row above. i.e row 1
   previous_row_element -= previous_row_element

  
   # Appending the corrosponding element from the above row to the new row. i.e the value of allergies array in this case 2 back.
   # and matching its true false value 
 

   while table[table_element].length < table[current_table_element].length
   table[table_element] << table[current_table_element][previous_row_element]
   previous_row_element += 1
   end

   element += 1
   table_element +=1
   current_table_element +=1

  end
  # Tables used for testing purposes
  #  p  table[0] 
  #  p  table[1]
  #  p  table[2]
  #  p  table[3]

   # Checks to see if the last element of the last array is true or false. If its true then it means there are subsets within.
   puts table[-1][-1] == true ?  "There are matching Allergies for this target.(Press enter to calculate)" : "There are no matches to the provided number it may be incorrect" && exit
    
   gets.chomp
   system("clear")

   # Step 4 - Finding the sets

   # we basically need to step backwards through our matrix and check the elements like so.

   # check the last array element does the true match the last element of the previous array? (if the last elememt  of this array isnt true then there are no subsets anyway)

   # If false return value from allergy array that this array coresponds to then move up an array and count back the current 
   # matching allergy array value backwards. 

   # if true then does the last element of the above array match the last element from the array above it?

   #repeat previous steps

   #once at the last row we can assume all values except 0 would be false above 

  row = allergies.length - 1
  breaker = allergies.length - 1
  results = []
  table1 = -1
  element1 = -1
  table2 = -2
  counter = 0
  
  until counter == breaker

  if table[table1][element1] != table[table2][element1]
    results << allergies[row]
    table1 -= 1
    table2 -= 1
    element1 -= allergies[row]
    row -= 1
    counter += 1

  else   
    table1 -= 1
    table2 -= 1
    row -=1
    counter += 1
  end

end

puts results


end  

subset_matrix(130)

