require "./lib/PRC_GEM/Densa.rb"
require "./lib/PRC_GEM/Sparse.rb"
require "./lib/PRC_GEM/version.rb"

class MatrizDSL < Matriz
    attr_reader :operacion, :salida, :tipo_m1, :tipo_m2, :m1, :m2, :mr #densa o dispersa
    
    #Initialize
    
    def initialize (operador, &block) #Estructura de datos de la matriz DSL
      @operacion = operador.downcase
      @tipo_m1,@tipo_m2 = nil,nil
      @salida = "console"
      
      if block_given?
        if block.arity == 1
         yield self
        else
         instance_eval &block
        end
      end
    end 
    

    def option(cadena) #Recoge la opcion de tipo de matriz
      case cadena
      when "densas","Densas","DENSAS"
	  @tipo_m1,@tipo_m2 = "densa","densa"
      when "dispersas","Dispersas","DISPERSAS"
	  @tipo_m1,@tipo_m2 = "dispersa","dispersa"
      end
      if (@tipo_m1==nil)
	if cadena=="densa" or cadena=="Densa" or cadena=="DENSA"
	  @tipo_m1 = "densa"
	else
	    @tipo_m1 = "dispersa"
	end
      end
      if (@tipo_m2==nil)
	if cadena=="densa" or cadena=="Densa" or cadena=="DENSA"
	  @tipo_m2 = "densa"
	else
	  @tipo_m2 = "dispersa"
	end
      end
    end
    
    # MOSTRAR
    def to_s
      control=0
      @m1.to_s
      case @operacion
        when "suma","sum"
         print "+\n"
        when "resta","res"
         print "-\n"
        when "maximo","max"
         print "elemento max\n"
         control=1
        when "minimo","min"
         print "elemento min\n"
         control=1
      end
      if control==0
       @m2.to_s
      end
      print "=\n"
      @mr.to_s
    end
    
    #Construye la Matriz
    def operand(contenido) 
      if (@m1.is_a?(Densa) or @m1.is_a?(Sparse)) == false
	if @tipo_m1=="densa"
	  @m1= Densa.new(contenido.size,contenido[0].size)
	  @m1.fill_M(contenido)
	else
	  @m1= Sparse.new(contenido.size,contenido[0].size)
	  @m1.fill_M(contenido)
	end
      else
	if @tipo_m2=="densa"
	  @m2= Densa.new(contenido.size,contenido[0].size)
	  @m2.fill_M(contenido)
	else
	  @m2= Sparse.new(contenido.size,contenido[0].size)
	  @m2.fill_M(contenido)
	end
      end
    end
   
    #Realiza la operación
   def operar # Realiza la operacion
      case @operacion.downcase
        when "suma","sum"
         @mr=@m1+@m2
        when "resta","res"
         @mr=@m1-@m2
        when "maximo","max"
         @mr=@m1.max
        when "minimo","min"
         @mr=@m1.min
        else #error
         nil
        end #case
   end
      
    def fraccion (num,den)
      Racional.new(num,den)
    end  
end

ejemplo = MatrizDSL.new("max") do
  option "Densas"
# option "fichero"
# operand [[1,2,3],[4,5,6],[7,8,9]]
  operand [[1,fraccion(2,3),3],[4,5,6],[7,8,9]]
  operand [[1,1,1],[1,1,1],[1,1,1]]
  operar
end
puts ejemplo