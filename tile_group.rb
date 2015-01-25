module TileGroup
   attr_accessor :tiles
   @@tiles = Array.new
   def append(tile)
   	   @@tiles.push(tile)
   end
   
   def remove(tile)
   	   i = @@tiles.index(tile)
   	   @@tiles.delete_at(i)
   end
   
   def to_s
   	   @@tiles.join(sep='')
   end
end


   class TileGroupTester
   	   include TileGroup
   end  	   
