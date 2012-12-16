class Picture < Array
    def rotate_by_90
        return if [0,1].include? this.size
        outer_most, start = this.size - 1, 0
        outer_most.downto(1) do |level|
            start.upto(level) do |x|
                y = level
                
            end
        end
    end
end