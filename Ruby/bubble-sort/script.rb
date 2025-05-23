# Input: An unsorted array of any length
# Output: A sorted array the same length as the input array
# Sorts unsorted_array via the bubble sort method
def bubble_sort(unsorted_array)
  for i in (0..unsorted_array.length-1) do
    for j in (0..unsorted_array.length-2) do
      if unsorted_array[j] > unsorted_array[j+1] && j < unsorted_array.length-1-i # Exclude checking the last i elements of the array. These are already guaranteed to be sorted
        temp = unsorted_array[j]
        unsorted_array[j] = unsorted_array[j+1]
        unsorted_array[j+1] = temp
      end
    end
  end

  return unsorted_array

  # loop for unsorted_array.length-1
    # loop for unsorted_array.length-2 (-2 to prevent indexing length+1 on the last pair)
      # if unsorted_array[i] < unsorted_array[i+1] do nothing
      # if unsorted_array[i] > unsorted_array[i+1] swap items
      # if unsorted_array[i] == unsorted_array[i+1] do nothing
  
  # return unsorted_array
end


# AFTER FIRST WORKING MODEL
# 2. At the end of each iteration, check if the list is sorted by changing a flag when elements are swapped, and resetting it at the beginning of an iteration. If it is, change a flag to stop and return


#nums = [1, 2, 3, 4, 5]
#nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
#nums = [4, 1, 3, 9, 7]
nums = [4, 3, 78, 2, 0, 2]
result = bubble_sort(nums)
p result