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

    describe "#is_anagram?" do
        it "returns false for unequal sized strings" do
            ("bbc".is_anagram? "bc").should eql false
        end
        it "returns true for empty strings" do
            ("".is_anagram? "").should eql true
        end
        it "returns true for valid anagrams" do
            ("geddayg".is_anagram? "edadgyg").should eql true
        end
        it "returns false for non valid anagrams" do
            ("gedpydg".is_anagram? "edadgyg").should eql false
        end
        it "handles nil values" do
            ("".is_anagram? nil).should eql false
        end
    end
end
