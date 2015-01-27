require 'spellchecker'
require 'tempfile'

require_relative 'word.rb'
require_relative 'tile_rack.rb'



puts "Welcome to Babble!"
puts "Make a word to earn points!"

@tile_rack = TileRack.new(7)
@tile_bag = TileBag.new
@total_score = 0
7.times do @tile_rack.append(@tile_bag.draw_tile) end

while !@tile_bag.empty? && @tile_rack.number_of_tiles_needed < 7 do
	
   tiles_needed = @tile_rack.number_of_tiles_needed
   tiles_needed.times do @tile_rack.append(@tile_bag.draw_tile) end  
   puts @tile_rack.to_s
   
   input = gets.chomp   
   input.upcase! 
   
   if input == ":EXIT" 
   	   exit
   end
   @rack_contains = @tile_rack.has_tiles_for?(input)
   
   if @rack_contains == true
   	   if Spellchecker::check(input)[0][:correct]
   	   	   puts "You played #{input}."
   	   	   word_played = Word.new
   	   	   word_played = @tile_rack.remove_word(input)
   	   	   puts "#{word_played.to_s} is the word played..with #{word_played.score}." 
   #	   	   @total_score = @total_score + word_played_score
   #	   	   puts "Great! Word #{input} is worth #{word_played.score}!"
   #	   	   puts "Your total score is #{@total_score}."
   	  
   	  elsif  
   	   	   puts "#{input} was not a valid word in our dictionary. Please try again."
   	   end
   	   
   elsif @rack_contains == false
   	   puts "You do not have enough tiles to make that word. Please try again"
   end
end

