require "merge_sort"

describe MergeSorter "::sort_recursuve" do
    it "sorts nothing" do
        list = []
        expected_output = []
        MergeSorter.sort_recursive list
        assert_equal list, expected_output
    end
end
