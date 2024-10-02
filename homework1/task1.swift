import Foundation

// Part 1
func gnomeSorting(array: [Int]) -> [Int] {
    var ptr = 0
    var newArray = array
    
    while ptr < newArray.count {
        if (ptr == 0 || newArray[ptr] >= newArray[ptr - 1]) {
            ptr += 1
        } else {
            newArray.swapAt(ptr, ptr - 1)
            ptr -= 1
        }
    }
    
    return newArray
}

// Part 2
func builtInSorting(array: [Int]) -> [Int] {
    let sortedArray = array.sorted()
    return sortedArray
}

func measuringTime(typeOfSort: String, sortingFunction: ([Int]) -> [Int], array: [Int]) {
    let clock = ContinuousClock()
    let time = clock.measure { _ = sortingFunction(array) }
    print("\(typeOfSort) took \(time).")
}

func executionTask1() {
    print("Task 1. Part 1.")
    let smallArray = [35, 12, 43, 8, 51, 27, 19, 3, 47, 30]
    print("Gnome Sorting of the given array: ", gnomeSorting(array: smallArray))
    print("Built-in sorting of the given array: ", builtInSorting(array: smallArray))
    print("\n")
    
    print("Part 2.")
    let bigArray = (1...10000).map { _ in Int.random(in: 1...10000) }
    measuringTime(typeOfSort: "Gnome sort for big array", sortingFunction: gnomeSorting, array: bigArray)
    measuringTime(typeOfSort: "Built-in sort for big array", sortingFunction: builtInSorting, array: bigArray)
    print("\n")
}

// Results of the program:
// Gnome Sorting of the given array:  [3, 8, 12, 19, 27, 30, 35, 43, 47, 51]
// Built-in sorting of the given array:  [3, 8, 12, 19, 27, 30, 35, 43, 47, 51]
// Gnome sort for big array took 7.463398257 seconds.
// Built-in sort for big array took 0.022787176 seconds.
//
// Conclusions:
// The amount of time to perform Gnome Sort is exceeding the results of the built-in sort that much because of repeatedly comparing and changing the positions of elements. This way, Gnome sort has complexity O(n^2), every time the pointer finds a smaller element, it has to get back and go through all of the array once again. Meanwhile built-in sorted() function is a combination of merge sort and insertion sort(as i've researched) and has smaller complexity of O(n log n). It makes built-in method more efficient(of course, why else would it be built-in then?) than Gnome sort.
