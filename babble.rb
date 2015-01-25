require 'spellchecker'
require 'tempfile'

require_relative 'word.rb'
require_relative 'tile_rack.rb'



puts "Welcome to Babble!"
puts "Make a word to earn points!"

tile_rack = TileRack.new
tile_bag = TileBag.new
7.times do tile_rack.append(tile_bag.draw_tile) end

while !tile_bag.empty? && tile_rack.size > 0 do

   if !tile_bag.empty?	
   	   tiles_needed = tile_rack.number_of_tiles_needed
   	   tiles_needed.times do tile_rack.append(tile_bag.draw_tile) end 
   end    
   
   puts tile_rack.to_s
   input = gets.chomp 

end 
   puts "Your word is #{input}."

