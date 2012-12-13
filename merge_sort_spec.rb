require "./merge_sort"

describe MergeSorter do
    describe "::sort_recursive" do
        @tests = {
            [] => [],
            [1] => [1],
            [2,1] => [1,2], [1,2] => [1,2],
            [2,3,1] => [1,2,3], [1,2,3] => [1,2,3], [3,2,1] => [1,2,3],
            [9,2,4,7,1,4,6,8,9,3] => [1,2,3,4,4,6,7,8,9,9]

        }
        @tests.each do |input, expected|
            it "sorts input according to expectation" do
                list = input
                expected_output = expected
                MergeSorter.sort_recursive list
                list.should eql expected_output
            end
        end
    end
    describe "::sort_non_recursive" do
        @tests = {
            [] => [],
            [1] => [1],
            [2,1] => [1,2], [1,2] => [1,2],
            [2,3,1] => [1,2,3], [1,2,3] => [1,2,3], [3,2,1] => [1,2,3],
            [9,2,4,7,1,4,6,8,9,3] => [1,2,3,4,4,6,7,8,9,9]

        }
        @tests.each do |input, expected|
            it "sorts input according to expectation" do
                list = input
                expected_output = expected
                MergeSorter.sort_non_recursive list
                list.should eql expected_output
            end
        end
    end
end
