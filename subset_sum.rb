# eggs (1)
# peanuts (2)
# shellfish (4)
# strawberries (8)
# tomatoes (16)
# chocolate (32)
# pollen (64)
# cats (128)

# Using Dynamic Programming to solve a Subset sum problem.


def subset_sum_calc(target)
  # setting true and fal;se to a variable to use when filling arrays in later steps
  t = true
  f = false

  # Step 1 - create an array with the allergy numbers. If any match Target directly then then return that number or allergy.
  allergies = [1, 2, 4, 8,]

  puts allergies.include?(target) ? "The only allergy is #{target}" : "There is more than one allergy"

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
  p row1
  element += 1 # Adding 1 to the element so we can compare the next allergy number in row 2

  # Creating row 2

  row2 = []
  row1_element = 0 

  # until the length of the new row is equal to the allergy element value that we are comparing append the corresponding row 1 element value 
  # to the new row 
   while row2.length < allergies[element]
       row2 << row1[row1_element]
       row1_element += 1
   end

   p row2

end  

# Goodmorning! you need to compare row1 and row2 elements and append a true or false value to row 2 that is equal to row1 elememt 
# but back the number of elements that coresponds with the value of the element of the allergies array that we are creating
# the new row from. i.e we are comparing integer 2 so we will move back 2 elements in row1 and append the corresponding value to row2.
subset_sum_calc(7)




