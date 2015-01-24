module TileGroup
   @@tiles = Array.new
   
   def append(tile)
   	   @@tiles.push(tile)
   end
   
   def remove(tile)
   	   i = @@tiles.index(tile)
   	   @@tiles.delete)_at(i)
   end
   	   
