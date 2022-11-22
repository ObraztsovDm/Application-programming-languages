puts "Welcome to The cake task!"

#види пирогів
cake_one = [["o......."],
        ["........"],
        [".....o.."],
        ["........"]]

cake_two = [["........"],
        ["..o....."],
        ["....o..."],
        ["........"]]

cake_three = [[".o......"],
            ["..o....."],
            ["....o..."],
            [".....o.."]]

cake_four = [[".o........."],
              ["..........."],
              ["..........."],
              [".....o....."]]

cake_five = [[".o....o."],
              ["..o....."],
              ["....o..."],
              [".....o.."]]

# метод розрахунку площі одного шматочка
def calculate_area_one_piece(cake)
  raisin_sum = 0

  (0...cake.length).each do |row|
    (0...cake[row].length).each { |col|
      if cake[row][col].include?("o")
        raisin_sum += 1
      end
    }
  end

  {
    :area => cake.length * cake[0].join.to_s.length / raisin_sum,
    :count_of_pieces => raisin_sum
  }
end

# метод нарізки пирога
def slice_cake(cake)
  calculate_var = calculate_area_one_piece(cake)
  tmp_empty_layer = []
  tmp_index = []
  pieces = []
  flag = false

  # цикл запису індексів "порожніх" шарів пирога та самих шарів
  (0...cake.length).each do |var|

    unless cake[var].join.include?("o")
      tmp_index << var
    end

    unless flag
      unless cake[var].join.include?("o")
        tmp_empty_layer << cake[var].join
        flag = true
      end
    end
  end

  # цикл розрізу пирога
  (0...cake.length).each do |i|
    pieces_arr_temp = []

    if calculate_var.dig(:count_of_pieces) == cake.length
      if cake[i].join.include?("o")
        pieces << cake[i]
      end
    elsif calculate_var.dig(:count_of_pieces) < cake.length
      if cake[i].join.include?("o")

        if cake.index(cake[i]) > tmp_index[0]
          pieces_arr_temp << tmp_empty_layer + cake[i]
        else
          pieces_arr_temp << cake[i] + tmp_empty_layer
        end

        tmp_index.delete(tmp_index[0])

        if pieces_arr_temp.join.to_s.length == calculate_var.dig(:area)
          pieces << pieces_arr_temp
        end
      end
    end
  end

  pieces
end

# метод результатів
def result_method(cake)
  puts "Cake:"
  (0...cake.length).each do |row|
    puts "#{cake[row].join("")}"
  end

  puts("Area of one piece: #{calculate_area_one_piece(cake).dig(:area)}")

  puts "Slice cake:"
  slice = slice_cake(cake)

  (0...slice.length).each do |i|
    puts("#{i + 1} piece:\n#{slice[i].join("\n")}\n")
  end
end

# наведені результати
puts "\nFirst cake:"
result_method(cake_one)
puts "\nSecond cake:"
result_method(cake_two)
puts "\nThird cake:"
result_method(cake_three)
puts "\nFourth cake:"
result_method(cake_four)
puts "\nError cake:"
result_method(cake_five)
