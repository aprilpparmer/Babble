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
  	contains = false  
  	text_array = text.split(//)
  	text_array = text_array.map &:to_sym  
  	tiles_copy = Array.new(@tiles)
  	text_array.each do |x|
  		if tiles_copy.include?(x) == true
  			i = tiles_copy.index(x)
  			tiles_copy.delete_at(i)
  			contains = true
  		elsif tiles_copy.include?(x) == false
  			contains = false
  		end
  	end
  	return contains
   end

   def remove_word(text)
   	   text_array = text.split(//)
   	   text_array = text_array.map &:to_sym
   	   
   	   text_array.each do |x|
   	   	   i = @tiles.index(x)
   	   	   @tiles.delete_at(i)
   	   end
   	   word = Word.new
   	   word.append(text_array)
   	   return word
   end
end
