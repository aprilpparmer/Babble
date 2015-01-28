class TileBag
  def initialize()
	@tiles = [:E, :E, :E, :E, :E, :E, :E, :E, :E, :E, :E, :E, :A, :A, :A,
		   :A, :A, :A, :A, :A, :A, :I, :I, :I, :I, :I, :I, :I, :I, :I,
		   :O, :O, :O, :O, :O, :O, :O, :O, :N, :N, :N, :N, :N, :N, :R,
		   :R, :R, :R, :R, :R, :T, :T, :T, :T, :T, :T, :L, :L, :L, :L,
		   :S, :S, :S, :S, :U, :U, :U, :U, :D, :D, :D, :D, :G, :G, :G,
		   :B, :B, :C, :C, :M, :M, :P, :P, :F, :F, :H, :H, :V, :V, :W, 
		   :W, :Y, :Y, :K, :J, :X, :Q, :Z] 
	@@tile_points = {E: 1, A: 1, I: 1, O: 1, N: 1, R: 1, T: 1, L: 1, S: 1, 
  	  	  U: 1, D: 2, G: 2, B: 3, C: 3, M: 3, P: 3, F: 4, H: 4,
  	  	  V: 4, W: 4, Y: 4, K: 5, J: 8, X: 8, Q: 10, Z: 10}
  end
  def get_tiles
  	  return @tiles
  end	  
  def draw_tile
  	  i = rand(@tiles.length - 1)
  	  tile = @tiles[i]
  	  @tiles.delete_at(i)
  	  return tile
  end
  def empty?
  	@tiles.empty?  
  end
  def self.points_for(tile)  	
  	  return @@tile_points[tile]
  end
  
  def tiles_left
  	@tiles.length
end
end		