variable_names = [0, 1, 2, 3, 4, 5, 6, 7, 8]
arr = (1..8).to_a
var_elements = 1

while var_elements < arr.length

    variable_names[var_elements] = []
    variable_names[var_elements] << "hello"
    var_elements += 1
end  
 p variable_names