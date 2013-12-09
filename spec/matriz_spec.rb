require "./lib/PRC_GEM/racional.rb"
require "./lib/PRC_GEM/Sparse.rb"
require "./lib/PRC_GEM/matriz.rb"
require "./lib/PRC_GEM/Densa.rb"



describe Matriz do
  

  before :each do
    @m1 = Densa.new(2,2)
    @m1.fill_M([[1,2],[3,4]])

    @m2 = Densa.new(2,2)
    @m2.fill_M([[4,3],[2,1]])

    @m3 = Densa.new(2,2)
    @m3.fill_M([[Racional.new(1, 1),Racional.new(1, 1)],[Racional.new(1, 1),Racional.new(1, 1)]])

    @m4 = Densa.new(2,2)
    @m4.fill_M([[Racional.new(1, 2),Racional.new(3, 4)],[Racional.new(4, 3),Racional.new(3, 6)]])

    
    @m5 = Sparse.new(2,2)
    @m5.fill_M([[0,1]],[5])

    @m6 = Sparse.new(2,2)
    @m6.fill_M([[1,0]],[5])

    @m7 = Sparse.new(2,2)
    @m7.fill_M([[1,1]],[Racional.new(1, 2)])

    @m8 = Sparse.new(2,2)
    @m8.fill_M([[0,0]],[Racional.new(5, 3)])

  end
  
  describe " Definicion de argumentos: " do

    it " - Las dimensiones son correctas" do

      @m1.row.should eq(2)
      @m1.col.should eq(2)
      @m5.row.should eq(2)
      @m5.col.should eq(2)

    end

    it "- Contenido de la matriz dispersa" do
       @m9 = Sparse.new(2,2)
       @m9.fill_M([[0,1]],[5])
       aux= (@m5 == @m9)
       aux.should eq(true)
    end

end

describe "Operacion con matrices: "do
 
	it "- Se pueden sumar matrices densas de enteros" do
	  @m9 = Densa.new(2,2)
	  @m9.fill_M([[5,5],[5,5]])
	  ((@m1+@m2) == @m9).should eq (true)
	end
		
	it "- Se pueden restar matrices densas de enteros" do
	
		@m9 = Densa.new(2,2)
		@m9.fill_M([[-3,-1],[1,3]])
		((@m1-@m2) == @m9).should eq (true)
	end
  
	it "- Maximo de densas con enteros" do
		((@m2.max)== 4).should eq (true)
	end
  
	it "- Minimo de dispersas con enteros" do
       ((@m5.min)== 0).should eq (true)
    end
         
end
 describe "Prueba en Clase: " do
 
		it "Sumando Matrices Densas (2x2) de enteros" do
			@ma = Densa.new(2,2)
			@mb = Densa.new(2,2)
			@mc = Densa.new(2,2)
		
			@ma.fill_M([[1,1],[1,1]])
			@mb.fill_M([[1,0],[0,0]])
			@mc.fill_M([[2,1],[1,1]])
			
			((@ma+@mb) == @mc).should eq (true)
		end
	
			it "Sumando Matrices Densas (2x2) de enteros con Racionales" do
			@ma = Densa.new(2,2)
			@mb = Densa.new(2,2)
			@mc = Densa.new(2,2)
		
			@ma.fill_M([[1,1],[1,1]])
			@mb.fill_M([[Racional.new(1,2),0],[0,0]])
			@mc.fill_M([[Racional.new(3,2),1],[1,1]])
			
			((@ma+@mb) == @mc).should eq (true)
		end
		
		it "Sumando Matrices Densas (2x2) de Racionales" do
			@ma = Densa.new(2,2)
			@mb = Densa.new(2,2)
			@mc = Densa.new(2,2)
		
			@ma.fill_M([[Racional.new(1,1),Racional.new(1,1)],[Racional.new(1,1),Racional.new(1,1)]])
			@mb.fill_M([[Racional.new(1,2),Racional.new(0,1)],[Racional.new(0,1),Racional.new(0,1)]])
			@mc.fill_M([[Racional.new(3,2),Racional.new(1,1)],[Racional.new(1,1),Racional.new(1,1)]])
			
			((@ma+@mb) == @mc).should eq (true)
		end
		
		it "Sumando Matrices Densas (2x2) de Racionales con enteros" do
			@ma = Densa.new(2,2)
			@mb = Densa.new(2,2)
			@mc = Densa.new(2,2)
		
			@ma.fill_M([[Racional.new(1,2),Racional.new(1,2)],[Racional.new(1,2),Racional.new(1,2)]])
			@mb.fill_M([[1,1],[1,1]])
			@mc.fill_M([[Racional.new(3,2),Racional.new(3,2)],[Racional.new(3,2),Racional.new(3,2)]])
			
			((@ma+@mb) == @mc).should eq (true)
		end
		it "Sumando Matrices Dispersas (2x2) de enteros" do
			
			@ma = Sparse.new(2,2)
			@mb = Sparse.new(2,2)
			@mc = Sparse.new(2,2)
		
			@ma.fill_M([[0,0]],[1])
			@mb.fill_M([[0,0]],[1])
			@mc.fill_M([[0,0]],[2])
						
			((@ma+@mb) == @mc).should eq(true)
		end
	end
end
