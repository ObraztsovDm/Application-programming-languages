puts "Welcome to The sudoku game!"

sudoku = [[5, 3, 0, 0, 7, 0, 0, 0, 0],
          [6, 0, 0, 1, 9, 5, 0, 0, 0],
          [0, 9, 8, 0, 0, 0, 0, 6, 0],
          [8, 0, 0, 0, 6, 0, 0, 0, 3],
          [4, 0, 0, 8, 0, 3, 0, 0, 1],
          [7, 0, 0, 0, 2, 0, 0, 0, 6],
          [0, 6, 0, 0, 0, 0, 2, 8, 0],
          [0, 0, 0, 4, 1, 9, 0, 0, 5],
          [0, 0, 0, 0, 8, 0, 0, 7, 9]]

puts "Input data:"
(0..8).each do |i|
  puts sudoku[i].join(" ")
end

# знаходження індексів нульових елементів матриці
def find_empty_positions(sudoku)
  empty_positions = []

  (0...sudoku.length).each { |row|
    (0...sudoku[row].length).each { |col|
      if sudoku[row][col] == 0
        empty_positions << [row, col]
      end
    }
  }

  empty_positions
end

# перевірка на коректніть вводу числа до рядка
def check_rows(sudoku, row, number)
  (0...sudoku[row].length).each { |col|
    if sudoku[row][col] == number
      return false
    end
  }

  true
end

# перевірка на коректніть вводу числа до стовпчика
def check_columns(sudoku, col, number)
  (0...sudoku.length).each { |row|
    if sudoku[row][col] == number
      return false
    end
  }

  true
end

# комбінація перевірок
def check_value(sudoku, row, col, number)
  check_rows(sudoku, row, number) && check_columns(sudoku, col, number)
end

# розрахунок коректних значень
def result_correct_numbers(sudoku, empty_positions)
  temp = 0

  while temp < empty_positions.length
    row = empty_positions[temp][0]
    column = empty_positions[temp][1]
    puts "Iteration: #{temp}. Start number: #{number = sudoku[row][column] + 1}"
    found = false

    # в кожне нульове значення пропонуються числа віод 1 до 9
    # якщо в цьому діапазоні число проходить перевірки на коректність,
    # то будемо рухатись до наступного нульового значення
    while !found && number <= 9
      if check_value(sudoku, row, column, number)
        found = true
        sudoku[row][column] = number
        temp += 1

        # для пояснення
        puts "\n"
        (0..8).each do |var|
          puts sudoku[var].join(" ")
        end
      else
        number += 1

        # для пояснення
        puts "\n"
        (0..8).each do |var|
          puts sudoku[var].join(" ")
        end
      end
    end

    # якщо було запропоновано на нульовій позиції
    # значення від 0 до 9 і жодне не підійшло
    # відбувається повернення на попередню позицію
    unless found
      sudoku[row][column] = 0
      temp -= 1
    end
  end

  (0..8).each do |var|
    puts sudoku[var].join(" ")
  end
end

def final_result(sudoku)
  empty_positions = find_empty_positions(sudoku)

  result_correct_numbers(sudoku, empty_positions)
end

puts "\nResult:"
final_result(sudoku)
