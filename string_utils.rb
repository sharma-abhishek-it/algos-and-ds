require "./merge_sort"

class String
    def remove_duplicates!
        return if self.empty?
        a = 0
        index = 0
        until index == self.size do
            char_pos = (1 << (self[index].ord - "a".ord))
            if (a & char_pos) > 0 
                self.slice! index 
            else 
                a |= char_pos
                index += 1 
            end
        end
    end

    def is_anagram?(other)
        return false if other == nil or self.size != other.size
        
        a = self.dup
        b = other.dup
        
        MergeSorter.sort_non_recursive(a)
        MergeSorter.sort_non_recursive(b)
        
        return a == b
    end
end
