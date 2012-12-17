class Array
    def rotate_by_90
        return if [0,1].include? self.size
        outer_most, start = self.size - 1, 0
        (outer_most).downto(1) do |level|
            break if level - start < 1
            puts start,level
            a = ""
            x = start
            start.upto(level) do |y|
                a += [x,y].to_s
            end
            puts a,"*****"
            start += 1
        end
    end
end
