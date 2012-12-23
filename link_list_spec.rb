require "./link_list"

describe Node do
    describe "#remove_duplicates!" do
        describe "remove 1 duplicate at random position" do
            before :each do
                @head = Node.new 1
            end
            it "removes 1 sequential duplicate at end" do
                @head.append! Node.new 2
                @head.append! Node.new 2

                @head.remove_duplicates!

                @head.next.next.should be_nil
            end
            it "removes 1 non sequential duplicate at end" do
                @head.append! Node.new 2
                @head.append! Node.new 3
                @head.append! Node.new 2

                @head.remove_duplicates!

                @head.next.next.next.should be_nil
            end
            it "removes 1 sequential duplicate in middle" do
                @head.append! Node.new 2
                @head.append! Node.new 2
                @head.append! Node.new 3

                @head.remove_duplicates!

                @head.next.next.data.should eql 3
            end 
            it "removes 1 non sequential duplicate in middle" do
                @head.append! Node.new 2
                @head.append! Node.new 1
                @head.append! Node.new 3

                @head.remove_duplicates!

                @head.next.next.data.should eql 3
            end 
        end
    end

    describe "#from_last" do
        before :each do
            @head = Node.new 1
        end
        
        it "returns nil for only one element in list" do
            (@head.from_last 2).should be_nil
        end

        it "returns nil for n more then no. of elements before last node in list" do
            @head.append! Node.new 2
            (@head.from_last 2).should be_nil
        end
        
        it "returns nil for n more then no. of elements in list" do
            @head.append! Node.new 2
            (@head.from_last 20).should be_nil
        end
        
        it "returns the head when the element asked for is at length - 1" do
            @head.append! Node.new 2
            @head.append! Node.new 3
            (@head.from_last 2).should eql @head
        end

        it "returns an element somewhere in the list which was needed" do
            @head.append! Node.new 2
            @head.append! Node.new 3
            @head.append! Node.new 4
            
            searched_element = Node.new 5
            @head.append! searched_element
            
            @head.append! Node.new 6
            @head.append! Node.new 7
            (@head.from_last 2).should eql searched_element
        end
    end

    describe "#delete!" do
        before :each do
            @head = Node.new 1
        end
        it "should raise error if last node is mentioned for deletion" do
            @head.append! Node.new 2
            lambda{(@head.next.delete!)}.should raise_error
        end
        it "should raise error if link list has only 1 node and last node is mentioned for deletion" do
            lambda{(@head.delete!)}.should raise_error
        end
        it "should delete an element somewhere before last node" do
            @head.append! Node.new 2
            @head.append! Node.new 3
            @head.append! Node.new 4
            @head.next.next.delete!
            @head.to_s.should eql "1 -> 2 -> 4"
        end
    end
end
