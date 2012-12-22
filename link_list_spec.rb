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
end
