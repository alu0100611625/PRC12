require "./lib/PRC_GEM/racional.rb"
require "./lib/PRC_GEM/Sparse.rb"
require "./lib/PRC_GEM/matriz.rb"
require "./lib/PRC_GEM/Densa.rb"


M1 = Densa.new(3,3)
M2 = Sparse.new(3,3)
M11 = Sparse.new(3,3)

M3 = Densa.new(3,3)
M4 = Sparse.new(3,3)



M1.fill_M([[Racional.new(1,2),Racional.new(1,2),Racional.new(1,2)],[Racional.new(1,2),Racional.new(1,2),Racional.new(1,2)],[Racional.new(1,2),Racional.new(1,2),Racional.new(1,2)]])
M2.fill_M([[0,0],[1,1],[2,2]],[1,2,3])
M11.fill_M([[0,0]],[Racional.new(1,2)])

M3.fill_M([[1,1,1],[1,1,1],[1,1,1]])
M4.fill_M([[0,0],[1,1],[2,2]],[1,2,3])

Mp = Densa.new(3,3)
Mp.fill_M([[Racional.new(3,2),1,1],[1,1,1],[1,1,1]])
puts "\nMatrices densas\n\n"
M3.to_s
M1.to_s
puts "\nSuma de matrices densas\n\n"
M6 = M1 + M3
M6.to_s

puts "\nResta de matrices densas\n\n"
M6 = M1 - M3
M6.to_s
puts "\nMatrices dispersas\n\n"
M4.to_s
M11.to_s
puts "\nSuma de matrices dispersas\n\n"
M7=M4+M11
M7.to_s
puts "\nResta de matrices dispersas\n\n"
MD=M4-M11
MD.to_s

puts "Matriz densa\n\n"
M10 = Densa.new(2,2)
M10.fill_M([[1,2],[3,4]])
M10.to_s
puts "Maximo de matriz densa\n\n"
puts M10.max
puts "Minimo de matrices densa\n\n"
puts M10.min
puts "Matriz dispersa\n\n"
M12 = Sparse.new(3,3)
M12.fill_M([[0,0],[1,1],[2,2]],[1,2,3])
M12.to_s
puts "\nMaximo de matriz dispersa\n\n"
puts M12.max
puts "\nMinimo de matriz dispersa\n\n"
puts M12.min

puts "ENCONTRAR"
ME = Densa.new(3,3)
ME.fill_M([[1,2,3],[4,5,6],[7,8,9]])
puts "#{ME.encontrar {|e| (e*e >= 16)}}"

