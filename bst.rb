class Node
    attr_accessor :value
    attr_accessor :left
    attr_accessor :right
    attr_accessor :balance_factor

    def initialize(data)
        @value = data
        @left = nil
        @right = nil
        @balance_factor = 0
    end

    def insert(node)
        throw "only objects of class Node can be inserted" unless node.class.eql? Node
        
        tree_traversed = []

        current_node = self

        until current_node.left.nil? and current_node.right.nil? do
            case current_node.value <=> node.value
            when -1
                tree_traversed.push({:insertion_on_left => false, :node => current_node})
                current_node = current_node.right
            when 1    
                tree_traversed.push({:insertion_on_left => true, :node => current_node})
                current_node = current_node.left
            else
                return
            end
        end
        
        
        case current_node.value <=> node.value
        when -1
            current_node.right = node
            current_node.balance_factor += -1
            tree_traversed.push({:insertion_on_left => false, :node => current_node})
        when 1
            current_node.left = node
            current_node.balance_factor += 1
            tree_traversed.push({:insertion_on_left => true, :node => current_node})
        else
            return
        end
        
        until tree_traversed.empty? do
        end
    end
end
