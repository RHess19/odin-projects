# Input: An unsorted array of any length
# Output: A sorted array the same length as the input array
# Sorts unsorted_array via the bubble sort method
def bubble_sort(unsorted_array)
  # Track whether the list has been sorted via a "swapped" variable
  sorted = false
  swapped = false

  # Store length for inner loop in a variable so it can be shortened after each iteration.
  # After n iterations, the last n items are guaranteed to be sorted so they do not need to be checked.
  outer_limit = unsorted_array.length-2 
  
  for i in (0..unsorted_array.length-1) do
    swapped = false # reset each iteration
    if sorted # no items needed to be sorted on the last iteration, so the list is sorted
      return unsorted_array
    else
      for j in (0..outer_limit) do # -2 since we need to check j+1. this avoids indexing out of bounds with j+1
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
    outer_limit -= 1
  end

  return unsorted_array
end


#nums = [1, 2, 3, 4, 5]
#nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
#nums = [4, 1, 3, 9, 7]
#nums = [2, 1, 3, 4, 5]
nums = [4, 3, 78, 2, 0, 2]

result = bubble_sort(nums)
p result