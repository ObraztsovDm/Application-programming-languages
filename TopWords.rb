puts "Hello in The text top words task!"

mas_letters = []

def input_data(mas_letters)
  mas_letters << "'"

  puts "Enter your text:"
  enter_text = STDIN.gets.chomp.downcase.split('')

  enter_text.each {
      if enter_text.map do |var|
        unless mas_letters.include?(var)
          var.replace(" ")
        end
      end
    end
  }

  enter_text.join
end

def get_words_count(input)
  words = input.split
  result = {}
  words.each do |word|
    # якщо слово зустрілось вперше, то відбувається дорівнювання до нуля і спрацьовує інкрементація
    result[word] ||= 0
    result[word] += 1
  end
  result
end

def result_method(mas_letters)
  input = input_data(mas_letters)
  result = get_words_count(input)

  (1..3).each { |i|
    temp = result.size - i
    if temp < 0
      puts "#{i} place: empty"
    else
      puts "#{i} place: #{result.sort_by { |key, value| value }[temp]}"
    end
  }
end

while 1
  puts "Select layout (input language):\n1.Russian\n2.English\n3.Exit"

  choose_layout = STDIN.gets.to_i
  mas_letters.clear

  case choose_layout
  when 1

    ("а".."я").each { |i|
      mas_letters << i
    }

    result_method(mas_letters)
  when 2

    ("a".."z").each { |i|
      mas_letters << i
    }

    result_method(mas_letters)
  when 3
    puts "Exit!"
    abort
  else
    puts "Error!"
  end
end
