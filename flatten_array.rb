class FlattenArray

  def self.flatten(arr, result=[])

     return if arr.class != Array
     arr.each do |a|
       if a.class == Array
 	  flatten(a, result)
       else
	  result << a
       end
     end

    return result
   end

end

