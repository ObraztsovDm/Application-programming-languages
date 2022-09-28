
def result_method(choose_user, right_choose, bad_choose, word_letters)

  if right_choose.include?(choose_user) or bad_choose.include?(choose_user) #проверка на повторение буквы
    return 0
  end

  if word_letters.include?(choose_user)
    right_choose << choose_user
  else
    bad_choose << choose_user
    return 2
  end

  if right_choose.uniq.size == word_letters.size
    return 1
  else
    return 0
  end
end

def print_result(error, right_choose, bad_choose, word_letters)
  puts("Word: " + mystery_word_method(word_letters, right_choose))

  puts("Uncorrected letters: #{bad_choose.join(", ")}")

  if error >= 5
    puts("You lose.\n" + "Correct word: #{word_letters.join("")}")
    abort
  elsif word_letters.uniq.size == right_choose.uniq.size
    puts("You win!")
    abort
  else
    puts("Current number of attempts: #{(5 - error).to_s}")
  end
end

def mystery_word_method(word_letters, right_choose)
  result = ""

  for i in word_letters
    if right_choose.include?(i)
      result += "#{i} "
    else
      result += "? "
    end
  end

  return result
end

def word_guessing_method(error, right_choose, bad_choose, word_letters)
  while error <= 5
    print_result(error, right_choose, bad_choose, word_letters)
    choose_letter = STDIN.gets.chomp
    result_check = result_method(choose_letter, right_choose, bad_choose, word_letters)
    if result_check == 2
      error += 1
    end
  end
end

puts("Welcome to the Gallows Game!" + "\nEnter your name:\n")
name = STDIN.gets.chomp
puts("Hi, #{name}!")

easy_mas = ["rain", "snow", "wind", "sunny"]
medium_mas = ["football", "hockey", "rowing"]
hard_mas = ["dermatology", "cardiology", "surgery"]

error = 0
right_choose = []
bad_choose = []
while 1
  puts("Select difficulty level!\n1) Easy (theme: weather)\n2) Medium (theme: sport)\n3) Hard (theme: science)\n4) Press \"4\" to exit")
  choose = STDIN.gets
  if choose.include? "1"
    puts("You choose easy level")
    word_letters = easy_mas.sample.split("")
    word_guessing_method(error, right_choose, bad_choose, word_letters)
    #word_letters = easy_mas[0].split("")
  elsif choose.include? "2"
    puts("You choose medium level")
    word_letters = medium_mas.sample.split("")
    word_guessing_method(error, right_choose, bad_choose, word_letters)
  elsif choose.include? "3"
    puts("You choose hard level")
    word_letters = hard_mas.sample.split("")
    word_guessing_method(error, right_choose, bad_choose, word_letters)
  elsif choose.include? "4"
    puts "Exit!"
    abort
  else
    puts "Error"
  end
end
