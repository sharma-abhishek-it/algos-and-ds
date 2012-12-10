def recursive_merging (list, start, stop)
    case stop - start
    when 0
        
    when 1
        list[start], list[stop] = list[stop], list[start] if list[start] > list[stop]
    else
        left_start, left_stop = start, start + (stop-start)/2
        right_start, right_stop = start + (stop-start)/2 + 1, stop
        
        recursive_merging list, left_start, left_stop
        recursive_merging list, right_start, right_stop
        
        a = Array.new
        i1 = left_start
        i2 = left_stop
        j1 = right_start
        j2 = right_stop

        while i1 <= i2 and j1 <= j2 do
            index = 0
            if list[i1] <= list[j1]
                index = i1
                i1 += 1
            else
                index = j1
                j1 += 1
            end
            a.push list[index]
        end

        remaining_start = 0
        remaining_stop = 0
        if i1 < i2
            remaining_start = i1
            remaining_stop = i2
        else
            remaining_start = j1
            remaining_stop = j2
        end

        list[remaining_start..remaining_stop].each do |val|
            a.push val
        end
        
        (left_start..right_stop).each do |index|
            list[index] = a[index - left_start]
        end
    end
    return
end

def merge_sort (list)
    recursive_merging list, 0, list.size - 1
end

a = [8,3,1,4,5]
merge_sort a
puts a
