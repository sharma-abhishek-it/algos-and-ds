class Int
    @@UINT_MAX = 4294967295
    
    attr_accessor :value

    def initialize value=0
        @value = value
    end

    def inspect
        return @value
    end

    def binary_s
        return @value.to_s(2)
    end
    
    def insert_inside(int, j)
        int_num_bits = int.binary_s.size
        raise "#{int} should be of class Integer" if not int.class.eql? Int
        raise "#{int} will exceed bounds with the given starting = #{j}" if (int_num_bits + j) > self.binary_s.size
        
        int_with_zeroes = (int << j)
        
        bits_to_save = @value & (@@UINT_MAX >> (32-j))

        @value = @value >> int_num_bits
        @value = @value << int_num_bits

        @value |= int_with_zeroes
        
        @value |= bits_to_save
    end

    def <<(shift)
        return @value << shift
    end
end
