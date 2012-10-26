class CartesianProduct
    include Enumerable
    def initialize( seq1, seq2)
        @cp = []
        seq1.each { |element1|
            seq2.each { |element2|
                @cp << [element1, element2]
            }
        }
    end
            
    def each
        @cp.each { |elt| yield elt}
    end
end
            

#c = CartesianProduct.new([:a,:b],[4,5])
#c.each { |elt| puts elt.inspect }
#
#c = CartesianProduct.new([:a,:b],[])
#c.each { |elt| puts elt.inspect }