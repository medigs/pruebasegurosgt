class Comparison < ApplicationRecord
    def self.compare_triples(a, b)
        begin
            score_a = 0
            score_b = 0
        
            a.each_with_index do |value, index|
            if value > b[index]
                score_a += 1
            elsif value < b[index]
                score_b += 1
            end
            end
        
            resultado=[score_a, score_b]
            return puts "El resultado es: #{resultado}"
        rescue => e
            puts ("Error: #{e.message}").red
            return false
        end
    end
end
