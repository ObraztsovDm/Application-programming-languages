puts("Enter your name:")
name = STDIN.gets.chomp()
puts("Hi," + name + "!")
dif_Choice = ["Stone", "Scissors", "Paper"]

puts("Welcome to the PaperGame!\nGood luck!\n")
score_val_player = 0
score_val_computer = 0
while (1)
  begin
  puts("Make your choice:\n1 - " + dif_Choice[0] + "\n2 - " + dif_Choice[1] + "\n3 - " + dif_Choice[-1])
  choose = gets.to_i
  #if (choose > 3 or choose < 0)
  #puts("Wrong input")
  #else
    choose_player = dif_Choice[choose - 1]
    choose_enemy = dif_Choice.sample()

    puts("Your choose - " + choose_player)
    puts("Your enemy choose - " + choose_enemy)

    if choose_player == choose_enemy
      puts ("Draw")
    elsif (choose_player == dif_Choice[0] and choose_enemy == dif_Choice[1]) or (choose_player == dif_Choice[1] and choose_enemy == dif_Choice[2]) or (choose_player == dif_Choice[2] and choose_enemy == dif_Choice[0])
      puts("You win!")
      score_val_player += 1
    else
      puts("You lose")
      score_val_computer += 1
    end
    puts ("Your score: ")
    puts score_val_player
    puts ("Computer score: ")
    puts score_val_computer
  rescue # обработчик ошибки
    puts("Wrong input")
  end

end