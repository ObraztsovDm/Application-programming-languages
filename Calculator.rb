def sum_method(numbers, numbers_parentheses)
  if numbers_parentheses.any? == false
    result = numbers.inject(:+)
    return result
  else
    result = numbers_parentheses.inject(:+) + numbers.inject(:+).to_i
    return result
  end
end

def subtraction_method(numbers, numbers_parentheses, main_mas)
  if numbers_parentheses.any? == false
    result = numbers.inject(:-)
    return result
  else
    if main_mas[0].include? "("
      result = numbers_parentheses.inject(:-) - numbers.inject(:-)
      return result
    else
      result = numbers.inject(:-) - numbers_parentheses.inject(:-)
      return result
    end
  end
end

def multiplication_method(numbers, numbers_parentheses)
  if numbers_parentheses.any? == false
    result = numbers.inject(:*)
    #{ |result, elem| result * elem }
    return result
  else
    result = numbers_parentheses.inject(:*) * numbers.inject(:*).to_i
    return result
  end
end

def division_method(numbers, numbers_parentheses, main_mas)
  if numbers_parentheses.any? == false
    result = numbers.inject(:/)
    return result
  else
    if main_mas[0].include? "("
      result = numbers_parentheses.inject(:/) / numbers.inject(:/).to_i
      return result
    else
      result = numbers.inject(:/).to_i / numbers_parentheses.inject(:/)
      return result
    end
  end
end

puts("Welcome to the calculator!" + "\nEnter your name:\n")
name = STDIN.gets.chomp
puts("Hi, #{name}!")

puts("In this version of the calculator, you can enter an unlimited number of integer values.\nIn order to finish the input, enter \"finish\"!")
puts("Maximum number of brackets: 1\nMaximum number of values in brackets: 2\nExample of entering a number with brackets: \n(2 \n4)")
numbers = []
numbers_parentheses = []
main_mas = []
i = 0
while 1
  begin
    puts "Enter your #{i += 1} number:\n"
    numbers_user = STDIN.gets.chomp
    if numbers_user == "finish"
      if numbers.length + numbers_parentheses.length < 2
        puts "Enter more numbers!"
        i -= 1
      else
        break
      end
    else
      if numbers_user.include? "(" or numbers_user.include? ")"
        main_mas << numbers_user
        temp = numbers_user.delete("(").delete(")")
        result_parentheses = Integer(temp)
        numbers_parentheses << result_parentheses
      else
        main_mas << numbers_user
        result = Integer(numbers_user)
        numbers << result
      end
    end
  rescue ArgumentError
    puts("Error: Not an integer value")
    i -= 1
  end
end

while 1
  puts("1.Sum\n2.Subtraction\n3.Multiplication\n4.Division\n5.Press \"5\" to exit")
  choose_operation = STDIN.gets.chomp
  case choose_operation
  when "1"
    result_for_sum = sum_method(numbers, numbers_parentheses)
    puts result_for_sum
  when "2"
    result_for_subtraction = subtraction_method(numbers, numbers_parentheses, main_mas)
    puts result_for_subtraction
  when "3"
    result_for_multiplication = multiplication_method(numbers, numbers_parentheses)
    puts result_for_multiplication
  when "4"
    begin
      result_for_division = division_method(numbers, numbers_parentheses, main_mas)
      puts result_for_division
    rescue ZeroDivisionError # обработчик ошибки
      puts "Error: Division by zero"
    end
  when "5"
    puts "Exit!"
    abort
  else
    puts "Error! Choose \"1\", \"2\", \"3\", \"4\" or \"5\""
  end
end