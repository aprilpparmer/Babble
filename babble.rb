require 'spellchecker'
require 'tempfile'

require_relative 'word.rb'
require_relative 'tile_rack.rb'



puts "Welcome to Babble!"
puts "Make a word to earn points!"

tile_rack = TileRack.new(7)
tile_bag = TileBag.new
total_score = 0
tile_rack.append(tile_bag.draw_tile)

while !tile_bag.empty?  do
	
   	   tiles_needed = tile_rack.number_of_tiles_needed
   	   tiles_needed.times do tile_rack.append(tile_bag.draw_tile) end  
   
   
   puts tile_rack.to_s
   
   input = gets.chomp
   if input == ":exit" 
   	   exit
   end
   
   input.upcase! 
   
   if tile_rack.has_tiles_for?(input)
   	   if Spellchecker::check(input)[0][:correct]
   	   	   puts "You played #{input}."
   	   	   word_played = tile_rack.remove_word(input)
   	   	   #total_score += word_played.score
   	   	   puts "Great! Word #{input} is worth #{word_played.score}!"
   	   	   #puts "Your total score is #{total_score}."/
   	  end
   	  if Spellchecker::check(input)[0][:incorrect]  
   	   	   puts "Your word was not valid. Please try again."
   	   end
   	   
   if !tile_rack.has_tiles_for?(input)
   	   puts "You do not have enough tiles to make that word. Please try again"
   end
end
end

