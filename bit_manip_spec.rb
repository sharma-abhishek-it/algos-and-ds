require "./bit_manip"

describe Int do
    describe "#insert_inside" do
        before :each do
            @integer = Int.new
            @modifier = Int.new
        end

        it "should raise error when non Integer class is passed" do
            @integer.value = 1
            lambda{@integer.insert_inside(1,1)}.should raise_error
        end

        it "should raise error when bigger number is try to inserted" do
            @integer.value = 10
            @modifier.value = 30
            lambda{@integer.insert_inside(@modifier,0)}.should raise_error
        end
        it "should raise error when bigger number is try to inserted" do
            @integer.value = 17
            @modifier.value = 10
            lambda{@integer.insert_inside(@modifier,2)}.should raise_error
        end
        
        @tests = {
            {:int=>10, :mod=>3, :from=>0} => 11,
            {:int=>10, :mod=>3, :from=>2} => 14,
            {:int=>17, :mod=>3, :from=>0} => 19,
            {:int=>17, :mod=>3, :from=>2} => 29,
            {:int=>17, :mod=>10, :from=>1} => 21,
        }
        @tests.each do |input, expected|
            it "should match expectations" do
                @integer.value = input[:int]
                @modifier.value = input[:mod]

                @integer.insert_inside @modifier, input[:from]
                @integer.value.should eql expected
            end
        end
    end
end
