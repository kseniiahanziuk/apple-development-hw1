import Foundation

class Node {
    var value: Int
    var children: [Node]

    init(value: Int, children: [Node] = []) {
        self.value = value
        self.children = children
    }

    func addChild(_ node: Node) {
        children.append(node)
    }
}

class Tree {
    var root: Node

    init(root: Node) {
        self.root = root
    }

    func depth(node: Node?) -> Int {
        if node == nil {
            return 0
        }
        if node!.children.isEmpty {
            return 1
        }
        return 1 + node!.children.map { depth(node: $0) }.max()!
    }

    func calculateDepth() -> Int {
        return depth(node: root)
    }
    
    func search(value: Int, node: Node?) -> Bool {
        if node!.value == value {
            return true
        }
        
        if node == nil {
            return false
        }

        for child in node!.children {
            if search(value: value, node: child) {
                return true
            }
        }
        
        return false
    }
}

func executionTask3() {
    print("Task 3. Part 1.")
    let rootNode = Node(value: 15)
    let tree = Tree(root: rootNode)

    let child1 = Node(value: 12)
    let child2 = Node(value: 3)

    rootNode.addChild(child1)
    rootNode.addChild(child2)

    let grandChild1 = Node(value: 4)
    child1.addChild(grandChild1)
    let grandChild2 = Node(value: 8)
    child1.addChild(grandChild2)
    let greatGrandChild1 = Node(value: 5)
    grandChild2.addChild(greatGrandChild1)
    let greatGrandChild2 = Node(value: 3)
    grandChild2.addChild(greatGrandChild2)
    let gggChild = Node(value: 1)
    greatGrandChild2.addChild(gggChild)

    print("Tree depth: \(tree.calculateDepth())")
    print("\n")
    
    print("Part 2.")
    let valueForDFS = 20
    if tree.search(value: valueForDFS, node: tree.root) {
        print("Value \(valueForDFS) found in the tree.")
    } else {
        print("Value \(valueForDFS) not found in the tree.")
    }
    print("\n")
}
