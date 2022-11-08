puts "Welcome to The Polish notation task"

priority = {
  "(" => 0,
  "+" => 1,
  "-" => 1,
  "*" => 2,
  "/" => 2,
  "^" => 3,
  ")" => 4
}
operators = %w[+ - * / cos sin tg ctg ^ ( )]
operators_tmp = []
numbers = []
normal_form = []
temp_mas = []

def calculation(right, left, operation)
  case operation
  when "+"
    left + right
  when "-"
    left - right
  when "*"
    left * right
  when "/"
    if right == 0
      puts "Division by zero!"
    else
      left / right
    end
  when "^"
    left ** right
  else
    puts "Unknown operation!"
  end
end

=begin
def calculation(numbers, operation)
  s = []
  puts "s: #{s}"
  numbers.each { |i|
    if operation.include?(i)
      puts a2 = s.pop.to_f
      puts a1 = s.pop.to_f
      if i == "+"
        s << a1.to_f + a2.to_f
      elsif i == "-"
        s << a1.to_f - a2.to_f
      elsif i == "*"
        s << a1.to_f * a2.to_f
      elsif i == "/"
        if right == 0
          puts "Ділення на нуль!"
        else
          s << a1.to_f / a2.to_f
        end


      when "^"
        s.append(a1**a2)


      else
        s << Float(a)
      end
    end
  }
  s.pop
end
=end

puts "Enter a regular mathematical expression (one character at a time):"

while 1
  normal_exp = STDIN.gets.chomp

  unless normal_exp.include?("x")
    normal_form << normal_exp
  end

  if normal_exp.length <= 4

    if operators.include?(normal_exp)

      if operators_tmp.empty?

        operators_tmp << normal_exp
      else

        if normal_exp.include?("(")
          operators_tmp << "("
        end

        if priority.dig(operators_tmp[-1]) >= priority.dig(normal_exp)
          numbers << operators_tmp.pop
          operators_tmp << normal_exp
        else
          operators_tmp << normal_exp
        end

        if normal_exp.include?(")")
          operators_tmp = operators_tmp.join.delete(")").delete("(").split("")
          operators.each { |i|
            while operators_tmp.include?(i)
              numbers << operators_tmp.pop
            end
          }
        end
      end
    else
      unless normal_exp.include?("x")
        numbers << normal_exp
      end
    end
  else
    puts "Помилка"
  end

  if normal_exp.include?("x")
    numbers.delete("(")
    (0..operators_tmp.length).each {
      numbers << operators_tmp.pop
    }
=begin
    numbers.map do |var|
      if var == "("
        numbers.delete(var)
      end
    end
=end

    (0..numbers.length).each { |i|
      temp_mas << numbers[i]
      temp_mas.delete(nil)

      if operators.include?(temp_mas[i])
        temp_mas << calculation(temp_mas[i - 1].to_f, temp_mas[i - 2].to_f, temp_mas[i]).to_f

        puts "#{temp_mas}\n"
      end
    }

    temp_mas.delete(nil)

    puts "Reverse Polish notation: #{numbers.join(" ")}\nNormal form: #{normal_form.join(" ")}\nResult: #{temp_mas[-1]}"
    abort
  end

  puts("Numbers: #{numbers.join(", ")}")
  puts("Operators: #{operators_tmp.join(", ")}")

end
