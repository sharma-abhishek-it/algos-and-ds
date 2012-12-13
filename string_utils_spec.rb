require "./string_utils"

describe String do
    describe "#remove_duplicates" do
        @tests = {
            "aabbddtcg" => "abdtcg",
            "abgahha" => "abgh",
            "abdeedba" => "abde",
            "aba" => "ab",
        }
        @tests.each do |input, expected|
            it "yields expected output" do
                str = input.dup
                str.remove_duplicates!
                str.should eql expected
            end
        end
        @tests = {
            "a" => "a",
            "" => "",
        }
        @tests.each do |input, expected|
            it "does nothing on one or zero character strings" do
                str = input.dup
                str.remove_duplicates!
                str.should eql expected
            end
        end
    end
end
