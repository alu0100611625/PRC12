require "./lib/PRC_GEM/racional.rb"
require "./lib/PRC_GEM/Sparse.rb"
require "./lib/PRC_GEM/matriz.rb"

class Densa < Matriz

attr_reader :row, :col, :m

	def initialize (m,n)
		raise TypeError, "Error. Dimensiones incorrectas" if ((m < 0) or (n < 0))
		@row, @col = m, n
		@m = Array.new(@row) {Array.new(@col)}
	end
	
	def to_s
    for i in (0...self.row)
      print "("
      for j in (0...self.col)
        print " #{self.m[i][j]} "
      end
      puts ")\n"
    end
	puts "\n"
	end
  
	def fill_M(other)
		if other.is_a?(Array)
			for i in (0...self.row)
			for j in (0...self.col)
				self.m[i][j] = other[i][j]
			end
			end
		end
	end
	
def coerce (other)
      a=Densa.new(other.row,other.col)
      for i in (0...a.row)
			for j in (0...a.col)
				a.m[i][j]=0
			end
      end
      for i in (0...other.pos.size)
			a.m[other.pos[i][0]][other.pos[i][1]]= other.valor[i]
      end
      return [a,self]
end
  
	def +(other)
	raise unless other.is_a?(Matriz)
    if (other.is_a?(Sparse))
      other=self.coerce(other)
      other=other[0]
    end
    if (self.row == other.row) and (self.col == other.col)
      nueva = Densa.new(self.row,self.col)
      @row.times do |i| ##CAMBIOS
        @col.times do |j| ##CAMBIOS
         nueva.m[i][j] = self.m[i][j] + other.m[i][j]
        end
      end
      nueva
    else
      puts "Error. Las Matrices no tienen las mismas dimensiones."
    end
	end

  def -(other)
  raise unless other.is_a?(Matriz)
    if (other.is_a?(Sparse))
      other=self.coerce(other)
      other=other[0]
    end
    if (self.row == other.row) and (self.col == other.col)
      nueva = Densa.new(self.row,self.col)
      @row.times do |i| ##CAMBIOS
        @col.times do |j| ##CAMBIOS
         nueva.m[i][j] = self.m[i][j] - other.m[i][j]
        end
      end
      nueva
    else
      puts "Error. Las Matrices no tienen las mismas dimensiones"
    end
  end
  
    def *(other)
    nueva = Densa.new(self.row,self.col)
    if other.is_a?(Numeric)
      if (self.m[0][0]).is_a?(Racional)
        n=Racional.new(other,1)
      else
        n=other
      end
      @row.times do |i| ##CAMBIOS
        @col.times do |j| ##CAMBIOS
         nueva.m[i][j] = n*self.m[i][j]
       end
     end
     nueva
    elsif other.is_a?(Densa)
      if (self.col == other.row)
      @row.times do |i| ##CAMBIOS
        @col.times do |j| ##CAMBIOS
         if (self.m[0][0]).is_a?(Racional)
         nueva.m[i][j] = Racional.new(0,1)
         else
         nueva.m[i][j] = 0
         end
         self.col.times do |k| ##CAMBIOS
         #for k in (0...self.col)
         nueva.m[i][j] += self.m[i][k]*other.m[k][j]
         end
         end
        end
        nueva
      else
        puts "Error. Las Matrices no tienen las dimensiones correctas"
      end
    end
  end
  
  def max
    r=-10000
	@m.each do |i| ##CAMBIOS
    i.each do |j| ##CAMBIOS
        if (j.to_f > r.to_f)
         r = j
        end
      end
    end
    r
  end
  
   def min
    r= 10000
	@m.each do |i| ##CAMBIOS
    i.each do |j| ##CAMBIOS
        if (j.to_f < r.to_f)
         r = j
        end
      end
    end
    r
  end

#########################################################################

 def ==(other) #Compara si dos matrices son iguales o no
    raise unless other.is_a?(Matriz)
    if (other.is_a?(Sparse))
      other=self.coerce(other)
      other=other[0]
    end
    if (self.row == other.row) and (self.col == other.col)
      for i in (0...other.row)
		for j in (0...other.col)
			if self.m[i][j] != other.m[i][j]
				return false
			end
		end
      end
      true
    end #if
  end
  
  def encontrar
	@row.times do |i| ##CAMBIOS
    @col.times do |j| ##CAMBIOS
    if (yield (self.m[i][j]))
	return [i,j]
	end
    end
    end
  end
      
end
