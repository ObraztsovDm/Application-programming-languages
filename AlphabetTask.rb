puts "Welcome to the Alphabet program!"

mas_letters = []

def input_data(mas_letters)

  mas_input = []
  result = []

  puts "Enter the string"
  choose_string = STDIN.gets.chomp.to_s.split("")

  mas_input << choose_string


=begin перевірка
  for i in 0..mas_letters.length - 1
    puts("#{i + 1} - #{mas_letters[i]}")
  end
=end


  for i in mas_input.join("").downcase.split("")

    if i.upcase != i.downcase
      result << (mas_letters.join("").split("").index(i).to_i + 1).to_s
    end
  end

  puts result.join(" ")
end

while 1
  puts "Select layout (input language):\n1.Russian\n2.English\n3.Exit"
  choose_layout = STDIN.gets.to_i
  mas_letters.clear
  case choose_layout
  when 1

    for i in "а".."я"
      mas_letters << i
    end

    input_data(mas_letters)
  when 2

    for i in "a".."z"
      mas_letters << i
    end

    input_data(mas_letters)
  when 3
    puts "Exit!"

    abort
  else
    puts "Error!"
  end
end