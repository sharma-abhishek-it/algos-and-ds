class MergeSorter
    def self.merge_sorted (list, left_start, left_stop, right_start, right_stop, start, stop)
        a = Array.new
        (stop-start+1).times do
            break if left_start > left_stop or right_start > right_stop

            is_left_element_smaller = list[left_start] <= list[right_start]

            index = is_left_element_smaller ? left_start : right_start

            a.push list[index]

            is_left_element_smaller ? left_start += 1 : right_start += 1
        end

        (left_start..left_stop).each { |i| a.push list[i] }
        (right_start..right_stop).each { |i| a.push list[i] }

        (start..stop).each do |index|
            list[index] = a[index-start]
        end
    end

    def self.recursive_merging (list, start, stop)
        case stop - start
        when 0
        when 1
            list[start], list[stop] = list[stop], list[start] if list[start] > list[stop]
        else
            left_start, left_stop = start, start + (stop-start)/2
            right_start, right_stop = left_stop + 1, stop

            recursive_merging list, left_start, left_stop
            recursive_merging list, right_start, right_stop

            merge_sorted list, left_start, left_stop, right_start, right_stop, start, stop
        end
    end

    def self.nonrecursive_merging (list, start, stop)
        case stop - start
        when 0
        when 1
            list[start], list[stop] = list[stop], list[start] if list[start] > list[stop]
        else
            merge_size = 2
            loop {
                break if merge_size / 2 >= list.size

                0.step(list.size, merge_size) do |step|
                    start = step
                    stop = list.size <= step+merge_size ? list.size - 1 : step+merge_size - 1
                    break if stop - start + 1 < merge_size / 2
                    merge_sorted list, start, start + merge_size/2 - 1, start + merge_size/2, stop, start, stop
                end

                merge_size *= 2
            }
        end
    end

    def self.sort_recursive (list)
        return if list.empty?
        recursive_merging list, 0, list.size - 1
    end

    def self.sort_non_recursive (list)
        return if list.empty?
        nonrecursive_merging list, 0, list.size - 1
    end
end
