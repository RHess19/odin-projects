# Input: An unsorted array of any length
# Output: A sorted array the same length as the input array
# Sorts unsorted_array via the bubble sort method
def bubble_sort(unsorted_array)
  for i in (0..unsorted_array.length-1) do
    for j in (0..unsorted_array.length-2) do
      if unsorted_array[j] > unsorted_array[j+1]
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
# 1. After n iterations, we do not need to check the last n items of the array anymore since they are guaranteed to be sorted
# 2. At the end of each iteration, check if the list is sorted by changing a flag when elements are swapped, and resetting it at the beginning of an iteration. If it is, change a flag to stop and return



nums = [4, 3, 78, 2, 0, 2]
result = bubble_sort(nums)
p result