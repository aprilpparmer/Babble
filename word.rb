require_relative 'tile_group.rb'
require_relative 'tile_bag.rb'

class Word
include TileGroup

   def initialize()
   	   super()
   	   @tiles = Array.new
   	   @score = 0
   end
   
   def score
   	   @tiles.each do |x|
   	   	   @score = @score + TileBag.points_for(x)
   	   end
   	return @score   
   end
end
