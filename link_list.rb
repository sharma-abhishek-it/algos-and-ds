class Node
    attr_reader :data
    attr_accessor :next
    
    def to_s
        s = ""
        node = self
        s << node.data.to_s
        until node.next.nil? do
            s << " -> "
            s << node.next.data.to_s
            node = node.next
        end
        return s
    end

    def initialize(val)
        @data = val
        @next = nil
    end

    def append!(node)
        raise "Only a valid node link list object can be appened" unless node.class == Node

        node_for_appending = self
        until node_for_appending.next.nil? do
            node_for_appending = node_for_appending.next
        end
        node_for_appending.next = node
    end

    def find(val)
        node = self
        until node.nil? do
            return node if node.data.eql? val
            node = node.next
        end
    end
    
    def remove_duplicates!
        return if self.next.nil?
        
        hash = {}
        node = self
        hash[node.data] = true
        until node.next.nil? do
            if hash.has_key? node.next.data
                node.next = node.next.next
                next
            else
                hash[node.next.data] = true
            end
            node=node.next
        end
    end

    def from_last(n)
        i = 0
        node = self
        follow_up = self

        until node.next.nil? do
            if i < n
                i += 1
            else
                follow_up = follow_up.next
            end
            node = node.next
        end

        return ((i.eql? n) ? follow_up : nil)
    end

    def delete!
        raise "last node cannot be deleted" if self.next.nil?
        @data, @next = self.next.data, self.next.next
    end
end
