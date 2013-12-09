require "./lib/PRC_GEM/gcd"

class Racional
attr_reader :x,:y

# Metodo Inicializar

	def initialize (x, y)
		aux = gcd(x, y)
		@x,@y = x/aux, y/aux
	end

# Minimo común multiplo
	def Racional.mcm(x,y)
		(x.to_i*y.to_i)/gcd(x.to_i,y.to_i)
	end

# to_s # devuelve una cadena con la representación del racional
   	def to_s
		"(#{@x}/#{@y})"
	end

# to_f #

	def to_f
		tmp = @x.to_f/ @y.to_f
		return tmp
	end
	
# coerce #

   def coerce(other)
     if (other.is_a?(Integer))
       [Racional.new(other.to_i,1),self]
     end
   end
   
#suma # devuelve un nuevo racional que suma al objeto que invoca el que le pasan como parámetro
	def +(other)
	if (other.is_a?(Integer))
      other=Racional.new(other,1)
    end
	if (other.is_a?(Racional))
		den = (@y * other.y)
		num = (@x*other.y)+(other.x*@y)
		Racional.new(num,den)
		end
	end
		
#resta # devuelve un nuevo racional que resta al objeto que invoca el que le pasan como parámetro
	def -(other)
		if (other.is_a?(Integer))
      other=Racional.new(other,1)
    end
	if (other.is_a?(Racional))
		den = (@y * other.y)
		num = (@x*other.y)-(other.x*@y)
		Racional.new(num,den)
		end
	end
#producto # devuelve un nuevo racional que multiplica al objeto que invoca el que le pasan como parámetro

	def *(other)
		if (other.is_a?(Integer))
      other=Racional.new(other,1)
    end
	if (other.is_a?(Racional))
		den = (@y*other.y)
		num = (@x*other.x)
		Racional.new(num,den)
		end
	end
#division # devuelve un nuevo racional que multiplica al objeto que invoca el que le pasan como parámetro
	def /(other)
		if (other.is_a?(Integer))
      other=Racional.new(other,1)
    end
	if (other.is_a?(Racional))
		den = (@y*other.x)
		num = (@x*other.y)
		Racional.new(num,den)
		end
	end
	
# > #

	def >(other)
		if (self.to_f > other.to_f)
			true
		else
			false
		end
	end

# < #

  def <(other)
    if (self.to_f < other.to_f)
      true
    else
      false
    end
  end

# <= #

  def <=(other)
    if (self.to_f <= other.to_f)
      true
    else
      false
    end
  end



# >= #

  def >=(other)
    if (self.to_f >= other.to_f)
      true
    else
      false
    end
	end
  
# <=> #

   def <=>(other)
     self.to_f <=> other.to_f
   end

# == #
	def == (other)
		if (self.to_f == other.to_f)
		true
		else
		false
		end
	end
# -@ # 

   def -@
       Racional.new(-self.x,self.y)
   end
   
end

#P1= Racional.new(12,9)
#P2= Racional.new(8,18)
#P3= Racional.new(8,16)


#puts " Salidas Programa "

#P4 = P2 + P1
#puts P4
#P5 = P2 - P1
#puts P5
#P6 = P2 * P1
#puts P6
#P7 = P2 / P1
#puts P7 

