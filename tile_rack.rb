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
	word_check = @@tiles
	word_check.eql?(text_array)
end
end

