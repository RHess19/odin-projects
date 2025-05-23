# Input: An unsorted array of any length
# Output: A sorted array the same length as the input array
# Sorts unsorted_array via the bubble sort method
def bubble_sort(unsorted_array)
  # Track whether the list has been sorted via a "swapped" variable
  sorted = false
  swapped = false
  
  for i in (0..unsorted_array.length-1) do
    swapped = false
    if sorted # no items needed to be sorted on the last iteration, so the list is sorted
      return unsorted_array
    else
      puts "iteration"
      for j in (0..unsorted_array.length-2) do # -2 since we need to check j+1. this avoids indexing out of bounds with j+1
        if unsorted_array[j] > unsorted_array[j+1] # if j > j+1, swap the elements
          temp = unsorted_array[j]
          unsorted_array[j] = unsorted_array[j+1]
          unsorted_array[j+1] = temp
          swapped = true # mark swapped as true so the conditional below does not trigger
        end
      end
      if !swapped # if this triggers, no items needed to be sorted in the previous iteration. mark sorted as true so the loop will exit next time
        sorted = true
      end
    end
  end

  return unsorted_array
end


# AFTER FIRST WORKING MODEL
# 1. After n iterations, we do not need to check the last n items of the array anymore since they are guaranteed to be sorted
# 2. At the end of each iteration, check if the list is sorted by changing a flag when elements are swapped, and resetting it at the beginning of an iteration. If it is, change a flag to stop and return


#nums = [1, 2, 3, 4, 5]
#nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
#nums = [4, 1, 3, 9, 7]
#nums = [2, 1, 3, 4, 5]
nums = [4, 3, 78, 2, 0, 2]

result = bubble_sort(nums)
p result