puts "Welcome to The brackets check task!"
puts "Enter only one character at a time!\n"

mas_brackets_all = []

def check (mas_brackets_all)

  mas_open_brackets = %w|( { [|
  mas_close_brackets = %w|) } ]|

  temp_mas = []

  (0..mas_brackets_all.length).each { |i|
    open = mas_open_brackets.find_index(mas_brackets_all[i])

    if open != nil
      temp_mas << open
      next
    end

    close = mas_close_brackets.find_index(mas_brackets_all[i])

    if close != nil
      open = temp_mas.pop
      if close != open
        return false
      end
    end
  }

  if temp_mas.length != 0
    return false
  end

  true
end

def input_brackets(mas_brackets_all)
  brackets = %w|( ) { } [ ]|

  while 1
    puts "Your input:\n"
    choose_brackets = STDIN.gets.chomp

    if choose_brackets.length == 1

      if brackets.include?(choose_brackets)
        mas_brackets_all << choose_brackets
        puts("Your input data: #{mas_brackets_all.join("")}")
        result = check(mas_brackets_all)

        if !result
          puts "Error in brackets."
        else
          puts "Correct bracket sequence."
        end
        break

      else
        puts "Uncorrected brackets! Repeat input."
      end

    else
      puts "More then one symbol! Repeat input."
    end
  end
end

while 1
  puts "1) For input press \"1\"\n2) For exit press \"x\""
  choose_operation = STDIN.gets.chomp

  case choose_operation
  when "1"
    input_brackets(mas_brackets_all)
  when "x"
    puts "Exit!"
    abort
  else
    puts "Error"
  end
end