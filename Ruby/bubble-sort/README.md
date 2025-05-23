Build a method #bubble_sort that takes an array and returns a sorted array using the bubble sort methodology.

Example:
> bubble_sort([4,3,78,2,0,2])
=> [0,2,2,3,4,78]


My solution includes two optimizations:
1. After n iterations over the array, the last n items of the array are guaranteed to be sorted and do not need to be included in future comparisons.
2. After each iteration, check if the array is sorted by always monitoring if, during an iteration, no swaps need to be made in the array.
