require_relative 'tile_group.rb'
require_relative 'word.rb'

class TileRack
include TileGroup

@maximum_size

   def initialize(max_size)
   	super()
	@maximum_size = max_size
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
  	return false 
  	if i == nil
  	tiles_copy.delete_at(i)
  	end
   end

   def remove_word(text)
   	   text_array = text.split(//)
   	   text_array = text_array.map &:to_sym
   	   
   	   text_array.each do |x|
   	   	   i = @tiles.index(x)
   	   	   @tiles.delete_at(i)
   	   end
   	   text_array = Word.new
   	   return text_array
   end
   
   def size
   	 return @tiles.length
   end

end
end
