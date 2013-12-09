require "./lib/PRC_GEM/matriz.rb"
require "./lib/PRC_GEM/racional.rb"
require "./lib/PRC_GEM/Densa.rb"


class Sparse < Matriz

attr_reader :row, :col, :valor, :pos 

	def initialize (m,n)
		raise TypeError, "Error. Dimensiones incorrectas" if ((m < 0) or (n < 0))
		@row, @col = m, n
		@valor = Array.new(0) {}
		@pos = Array.new(0){}
	end
	
	def fill_M (pos,dat)
	if dat.is_a?(Array) and pos.is_a?(Array)
    for i in (0...dat.size)
      @pos << pos[i]
      @valor << dat[i]
    end
	end
	end
	
	 def coerce(other)
     #if (other.is_a?(Densa))
    a=Sparse.new(other.row,other.col)
    for i in (0...other.row)
      for j in (0...other.col)
	if (other.m[i][j] != 0)
	  a.pos << [i,j]
	  a.valor << other.m[i][j]
	end
      end
    end
    return[a,self]
    end
 
		  
	def to_s
		aux = Densa.new(self.row,self.col)
		aux = (aux.coerce(self))[0]
		puts aux.to_s

	end

	def buscar (i,j) #devuelve una posicion del array que coincide con los indices de los param
		aux=[i,j]
		posicion= -1
		k=0
		while (k < @pos.size) and (posicion==-1)
		  if (@pos[k]==aux)
			posicion=k
		  end
			k=k+1
		end
			posicion
	end

	##SUMA##
	
	def +(other)
    raise unless other.is_a?(Matriz) # Deben Ser Matrices
    if (other.is_a?(Densa))
      other=self.coerce(other)
      other=other[0]
    end
    if (@row == other.row) and (@col == other.col)
      nueva= Sparse.new(@row,@col)
      @pos.size.times do |i| ##CAMBIOS
        k = other.buscar(@pos[i][0],@pos[i][1])
        if (k!= -1) #Si existe
         if (@valor[i]+other.valor[k]) != 0
         nueva.pos << @pos[i]
         nueva.valor << (@valor[i]+other.valor[k])
         end
        else
         nueva.pos << @pos[i]
         nueva.valor << @valor[i]
        end
      end 
      #almacenamos los que no se hayan sumado de la otra matriz
      other.pos.size.times do |i| ##CAMBIOS
        k = nueva.buscar(other.pos[i][0],other.pos[i][1])
        if (k==-1)
         nueva.pos << other.pos[i]
         nueva.valor << other.valor[i]
        end
      end
    else
      puts "No se pueden sumar, no tienen las mismas dimensiones"
    end #if
    nueva
  end
  
  ## RESTA
  
   def -(other)
    raise unless other.is_a?(Matriz) #deben ser matrices, da = si se comparan densas con dispersas
    if (other.is_a?(Densa))
      other=self.coerce(other)
      other=other[0]
    end
    if (@row == other.row) and (@col == other.col)
      nueva= Sparse.new(@row,@col)
	@pos.size.times do |i| ##CAMBIOS         
		k = other.buscar(@pos[i][0],@pos[i][1])
        if (k!= -1) #existe esa pos
         nueva.pos << @pos[i]
         nueva.valor << (@valor[i]-other.valor[k])
        else
         nueva.pos << @pos[i]
         nueva.valor << @valor[i]
        end
      end #for
      #almacenamos los que no se hayan sumado de la otra matriz
      other.pos.size.times do |i|  
        k = nueva.buscar(other.pos[i][0],other.pos[i][1])
        if (k==-1)
         nueva.pos << other.pos[i]
         nueva.valor << -other.valor[i]
        end
      end
    else
      puts "No se pueden restar, no tienen las mismas dimensiones"
    end #if
    nueva
  end
  
  def max
    r = -999999
    aux=valor
    aux<< 0
      @valor.each do |i| ##CAMBIOS
      if (i.to_f>r.to_f)
        r=i
      end
    end
    r
  end

  def min
    r = 999999
    aux=valor
    aux<< 0
      @valor.each do |i| #CAMBIOS
      if (i.to_f<r.to_f)
        r=i
      end
    end
    r
  end
  
##########################################

def ==(other) #Compara si dos matrices son iguales o no
    raise unless other.is_a?(Matriz) #deben ser matrices, da = si se comparan densas con dispersas
    if (other.is_a?(Densa))
      other=self.coerce(other)
      other=other[0]
    end
    if (@row == other.row) and (@col == other.col)
      if (@pos.size == 0) and (other.pos.size == 0)#si ambos estan estan vacios...
	return true
      elsif (@pos.size == other.pos.size)
	for i in (0...@pos.size)
	  k = other.buscar(@pos[i][0],@pos[i][1]) #buscamos esa pos en el otro vector
	  if (k == -1)
	    return false
	  elsif (@valor[i] != other.valor[k])
	    return false
	  end
	end
	return true
      else
	return false
      end
    else
      return false
    end
  end

end
