class MatrixCalculator < ApplicationRecord
    def self.diagonal_difference(matrix)
        begin
          # Verificar si la matriz es cuadrada
          raise ArgumentError, "La matriz no es cuadrada" unless matrix.all? { |row| row.size == matrix.size }
    
          left_to_right_sum = 0
          right_to_left_sum = 0
          size = matrix.size
    
          size.times do |i|
            left_to_right_sum += matrix[i][i]           # Diagonal de izquierda a derecha
            right_to_left_sum += matrix[i][size - 1 - i] # Diagonal de derecha a izquierda
          end
    
          difference = (left_to_right_sum - right_to_left_sum).abs
    
          # Usar logger en lugar de puts en producción
          return puts ("La diferencia absoluta entre las diagonales es: #{difference}").green
          return true
        rescue ArgumentError => e
          puts ("Error: #{e.message}").red
          return false
        rescue => e
          puts ("Error: #{e.message}").red
          return false
        end
    end
end
