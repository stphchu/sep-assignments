require 'benchmark'
require_relative 'node'
require_relative 'min_binary_heap'
require_relative 'binary_search_tree'

root = Node.new("1", 1)
binarytree = BinarySearchTree.new(root)
binaryheap = MinBinaryHeap.new(root)


Benchmark.bm(14) do |x|
  x.report("Binary Tree (Insert):") {
    for i in 2..5000
      node = Node.new(i.to_s, i)
      binarytree.insert(root, node)
    end
    }
  x.report("Min Binary Heap (Insert):") {
    for i in 2..5000
      node = Node.new(i.to_s, i)
      binaryheap.insert(root, node)
    end
    }

  x.report("Binary Tree (Find):"){
      binarytree.find(root,2500)
  }
  x.report("Min Binary Heap (Find):"){
      binaryheap.find(root,2500)
  }
  
  x.report("Binary Tree (Delete):"){
      binarytree.delete(root,2500)
  }
  x.report("Min Binary Heap (Delete):"){
      binaryheap.delete(root,2500)
  }
  end
