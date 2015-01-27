module TileGroup
   attr_accessor :tiles
   
   def intialize()
   	   @tiles = Array.new
   end
   
   def append(tile)
   	   @tiles.push(tile)
   end
   
   def remove(tile)
   	   i = @tiles.index(tile)
   	   @tiles.delete_at(i)
   end
   
   def to_s
   	   @tiles.join
   end
end


   class TileGroupTester
   	   include TileGroup
   end  	   
