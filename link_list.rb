class Node
    attr_reader :data
    attr_accessor :next

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
end
