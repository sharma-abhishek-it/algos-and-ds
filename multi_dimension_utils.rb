class Array
    def pp
        self.each do |i|
            puts i.to_s
        end
    end
    def rotate_by_90
        return if self.size == 0 or self.size == 1
        outer_most, start = self.size - 1, 0
        (outer_most).downto(1) do |level|
            break if level - start < 1
            x = start
            start.upto(level-1) do |y|
                self[start][y],self[y][level],self[level][level-(y-start)],self[level-(y-start)][start] = 
                    self[level-(y-start)][start],self[start][y],self[y][level],self[level][level-(y-start)]
            end
            start += 1
        end
    end
end
