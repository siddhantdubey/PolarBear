#This is the CS4040 "Flash Game #1" project by Siddhant Dubey, Meseker Worku Kebede, Jack Snyder, and Haziq Valliani

def roll_dice(n, size)
    dice = []
    n.times do
        dice.append(roll_die(size))
    end
    return dice
end

def roll_die(size)
    return rand(1..size)
end

def sum_dice(n, size)
    dice = roll_dice(n, size)
    sum = 0
    dice.each do |d|
        sum += d 
    end 
    return sum 
end  

=begin
You'll notice that there's a lot of .gsub() in this code.
This is so that we can get rid of the new line that is taken in when the user gives input to the program.
=end
puts ("Welcome to Greenland's Number 1 Casino: Polar Bear Gambling Inc.")
puts
puts("What is your name Player 1?")
player1_name = gets().chomp
puts
puts("What is your name Player 2?")
player2_name = gets().chomp
puts 

game_over = false
p1money = 0
p2money = 0

#The following while loop will run until the players don't say yes.
while !game_over
    
    puts("How much are you willing to bet players?")
	p1bet = gets().chomp.to_i
	puts
	
	player1 = 0 #current player1 score 
    player2 = 0 #current player2 score

    def play_turn(player)
        dice = roll_dice(5, 6)
        dice.each do |die|
            if die == 3
                player += 2
            elsif die == 5
                player += 4
            end
        end
        return player, dice
    end

    player1, dice1 = play_turn(player1)
    player2, dice2 = play_turn(player2)

	puts(player1_name + " rolled:")
	print(dice1)
	puts
	puts
	puts("And had " + player1.to_s + " polar bears")
	
	puts
	
	puts(player2_name + " rolled:")
	print(dice2)
	puts
	puts
	puts("And had " + player2.to_s + " polar bears")
	puts 

    if player1 > player2
		puts (player1_name + " Wins!")
		puts
		p1money += p1bet
		p2money -= p1bet
    else 
		puts (player2_name + " Wins!")
		puts
		p2money += p1bet
		p1money -= p1bet
	end
	
	puts(player1_name + " has " + p1money.to_s + " dollars.")
	puts(player2_name + " has " + p2money.to_s + " dollars.") 
	
	puts
	puts("-----"*10)
	puts("Do you wish to continue playing?(yes/No)")

    answer = gets().chomp
	
	if(answer == "yes")
        game_over=false
    else
        game_over=true
    end

end

puts
puts(player1_name + " ended with " + p1money.to_s + " dollars.")
puts
puts(player2_name + " ended with " + p2money.to_s + " dollars.")
