require_relative 'tile_group.rb'

class TileRack
include TileGroup

def get_tiles
  @@tiles
end

def number_of_tiles_needed
	t = @@tiles.length
	needed = 7 - t
	return needed
end

def has_tiles_for?(text)
	text_array = text.split(//)
	text_array = text_array.map &:to_sym
	tiles_copy = @@tiles
	contains = false
	
	text_array.each do |x|
		contains = tiles_copy.include?(x)
		if contains
			i = tiles_copy.index(x)
			tiles_copy.delete_at(i)
		end
		return contains
	end
end


end

