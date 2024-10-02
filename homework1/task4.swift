import Foundation

struct CircularArray {
    private var array: [Any]
    
    init(array: [Any]) {
        self.array = array
    }
    
    func getElement(at index: Int) -> Any? {
        let processedIndex = index % array.count
        if processedIndex < 0 {
            return array[array.count + processedIndex]
        }
        return array[processedIndex]
    }
}

func executionTask4() {
    print("Task 4.")
    let circularArray = CircularArray(array: [10, "dog", 5.0, 99.9, "50"])
    
    print(circularArray.getElement(at: -1) ?? "Element was not found.")
    print(circularArray.getElement(at: 5) ?? "Element was not found.")
    print(circularArray.getElement(at: -4) ?? "Element was not found.")
}
