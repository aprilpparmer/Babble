require_relative 'tile_bag.rb'
require_relative 'tile_group.rb'

class Word 
	include TileGroup
	@score
	def initialize()
		super()
		@score = 0
	end

	def score
		@tiles.each do |x|
		i = @tiles.index(x.to_sym)
		@score +=  TileBag.points_for(@tiles[i])
		
	end
		return @score
	end
end
