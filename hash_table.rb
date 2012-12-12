class HashTable < Array
    def initialize
        @keys = []
        @values = []
    end
    def insert(pos, key, value)
        @keys.insert pos, key
        @values.insert pos, value
    end

    def find(key)
        start, stop = 0, @keys.size - 1
        if @keys.empty? or key < @keys[start]
            return nil, start
        elsif key > @keys[stop]
            return nil, @keys.size
        else
            until start == stop
                middle = (stop-start)/2 + start
                return middle if key == @keys[middle]
                if middle == start
                    return stop if key == @keys[stop]
                    return nil, stop if @keys[stop]
                end
                start = middle if key > @keys[middle]
                stop = middle if key < @keys[middle]
            end
        end
    end
    def [](key)
        pos, insert_pos = find(key)
        return pos.nil? ? insert_pos : @values[pos]
    end
    def []=(key, value)
        pos, insert_pos = find(key)
        pos.nil? ? (insert insert_pos, key, value) : (@values[pos] = value)
    end
    def disp
        puts @keys.to_s, @values.to_s
    end
end

a = HashTable.new
a[1] = 1
a[4] = 4
a[6] = 6
a[2] = 2
a[9] = 9
a[8] = 8
a.disp
puts a[ARGV[0].to_i]
