require 'spellchecker'
require 'tempfile'

require_relative 'word.rb'
require_relative 'tile_rack.rb'



puts "Welcome to Babble!"
puts "Make a word to earn points!"

tile_rack = TileRack.new
tile_bag = TileBag.new
total_score = 0
7.times do tile_rack.append(tile_bag.draw_tile) end

while !tile_bag.empty? && tile_rack.size > 0 do

   if !tile_bag.empty?	
   	   tiles_needed = tile_rack.number_of_tiles_needed
   	   tiles_needed.times do tile_rack.append(tile_bag.draw_tile) end 
   end    
   
   puts tile_rack.to_s
   input = gets.chomp
   if input == ":exit" 
   	   exit
   end
   
   input.capitalize! 
   if tile_rack.has_tiles_for?(input)
   	   if Spellchecker::check(input)[0][:correct]
   	   	   word_played = tile_rack.remove_word(input)
   	   	   total_score += word_played.score
   	   	   puts "Great! Word #{input} is worth #{word_played.score}!"
   	   end
   
     puts "HMmmmmm..."
end
end 
