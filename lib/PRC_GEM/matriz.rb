
class Matriz
  attr_reader :row, :col, :m
  
  def initialize (m,n)
  		raise TypeError, "Error. Dimensiones incorrectas" if ((m < 0) or (n < 0))
		@row, @col = m, n
  end
  
  def to_s
  end
    
  def fill_M
  end
  
  def +(other)
  end
  
  def -(other)
  end

  def *(other)
  end
   
  def max
  end

  def min
  end
end
