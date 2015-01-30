require_relative 'tile_group.rb'
require_relative 'word.rb'

class TileRack
include TileGroup

@maximum_size

   def initialize(size)
   	super()
	@maximum_size = size
   end
   
   def number_of_tiles_needed
	t = @tiles.size
	needed = @maximum_size - t
	return needed
   end

  def has_tiles_for?(text)
  	tiles_copy = Array.new(@tiles)
	text.each_char do |x|
	i = tiles_copy.index(x.to_sym)
	return false if i == nil
	tiles_copy.delete_at(i)
	end
  end

   def remove_word(text)
   	   text.each_char do |x|
   	   	   i = @tiles.index(x.to_sym)
   	   	   @tiles.delete_at(i)
   	   end
   	   word = Word.new
   	   text.each_char do |x|
   	   	   word.append(x.to_sym)
   	   end
   	   return word
   end
   
   def get_tiles
   	   return @tiles
   end
end
