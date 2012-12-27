require "./link_list"

class Stack
    attr_accessor :top

    def initialize
        @top = nil
    end

    def push(data)
        new_node = Node.new data
        
        if @top.nil?
            @top = new_node
            return
        end

        @top, @top.next = new_node, @top
    end
end
