#!/bin/ruby

#pick a random number 
randnum = rand(100)

#read a number from cli
loop do
guess = gets

#compare to random number
if guess.to_i == randnum
	break
elsif guess.to_i > randnum
	puts "You guessed too high."
else
	puts "You guessed too low."
end

end

#print result
puts "Correct!"
