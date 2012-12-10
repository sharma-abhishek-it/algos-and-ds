def merge_sorted (list, left_start, left_stop, right_start, right_stop, start, stop)
    a = Array.new
    (stop-start+1).times do
        break if left_start > left_stop or right_start > right_stop
        expr = list[left_start] <= list[right_start]
        index = expr ? left_start : right_start
        a.push list[index]
        expr ? left_start += 1 : right_start += 1
    end

    (left_start..left_stop).each { |i| a.push list[i] }
    (right_start..right_stop).each { |i| a.push list[i] }

    (start..stop).each do |index|
        list[index] = a[index-start]
    end
end

def recursive_merging (list, start, stop)
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

def nonrecursive_merging (list, start, stop)
    case stop - start
    when 0
    when 1
        list[start], list[stop] = list[stop], list[start] if list[start] > list[stop]
    else
        levels = Math.log2(list.size).to_i
        loop {
            break if list.size / merge_size < 1
            a = Array.new
            puts "#####"
            list.each_slice(merge_size) do |slice|
                puts slice.to_s
                middle = (slice.size - 1) / 2
                merge_sorted slice, 0, middle, middle+1, slice.size-1, 0, slice.size-1
                puts slice.to_s
                a << slice
            end

            a.flatten!

            a.each_index {|i| list[i] = a[i]}
            merge_size *= 2
            puts ""
        }
    end
end

def merge_sort (list)
    nonrecursive_merging list, 0, list.size - 1
end

a = Array.new
ARGV[0].split(",").map { |s| a.push s.to_i }
merge_sort a
puts a.to_s
