class HashTable < Array
    def initialize
        @keys = [1,2,4,6,8,9]
        @values = [1,2,4,6,8,9]
    end
    def find(key)
        start, stop = 0, @keys.size - 1
        until start == stop
            middle = (stop-start)/2 + start
            return @values[middle] if @keys[middle] == key
            if middle == start
                return @values[stop] if @keys[stop] == key
                break
            end
            start = middle if @keys[middle] < key
            stop = middle if @keys[middle] > key
        end
        return nil
    end
    def [](key)
        return find(key)
    end
    def []=(key, value)
    end
end

a = HashTable.new
puts a[ARGV[0].to_i]
