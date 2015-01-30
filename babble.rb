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

while !@tile_bag.empty? || @tile_rack.get_tiles.length > 0 do
	
   if !@tile_bag.empty?		
   tiles_needed = @tile_rack.number_of_tiles_needed
   tiles_needed.times do @tile_rack.append(@tile_bag.draw_tile) end  
   end
   puts "There are #{@tile_bag.tiles_left} tiles left in the bag," 
   puts "and #{@tile_rack.get_tiles.length} tile(s) on the rack"
   if @tile_rack.get_tiles.length == 0
   	   break
   end
   puts @tile_rack.to_s
   
   input = gets.chomp   
   input.upcase! 
   
   if input == ":EXIT" 
   	   exit
   end
   
   if @tile_rack.has_tiles_for?(input)
   	  if Spellchecker::check(input)[0][:correct]
   	   	   word_played = Word.new
   	   	   word_played = @tile_rack.remove_word(input)
   	   	   word_score = word_played.score
   	   	   @total_score = @total_score + word_score
   	   	   puts "Great! Word #{input} is worth #{word_score}!"
   	   	   puts "Your total score is #{@total_score}."
   	  elsif  
   	   	   puts "#{input} was not a valid word in our dictionary. Please try again."
   	  end
   	   
   elsif !@tile_rack.has_tiles_for?(input)
   	  puts "You do not have enough tiles to make that word. Please try again"
   end
end

puts "Congratulations, you've finished the game! Your final score was #{@total_score}!"
exit
