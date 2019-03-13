require 'benchmark'
require_relative 'linked_list'

array = [1..10000]
list = LinkedList.new
i = 1
while i <= 10000
  node = Node.new(i)
  list.add_to_tail(node)
  i += 1
end


# Creating a 10,000 item Array versus appending 10,000 items to a Linked List
Benchmark.bm(14) do |x|
  new_array = []
  x.report("Array:") {
    new_array[1..10000]
    }
  x.report("Linked List:") {
    10000.times do
      list.add_to_tail(node)
    end
    }

end

puts "\n"

# Accessing the 5000th element of the Array versus accessing the 5000th Node in the Linked List
Benchmark.bm(14) do |x|
  x.report("Array:") {
      array[4999]
    }
  x.report("Linked List:") {
    counter = 0
    pointer = list.head
    while counter != 5000
      pointer = pointer.next
      counter += 1
    end
    }
  end

puts "\n"

# The time it takes to remove the 5000th element from the Array versus removing the 5000th Node in the Linked List
Benchmark.bm(14) do |x|
  x.report("Array:") {
    array.delete_at(4999)
    }
  x.report("Linked List:") {
    pointer = list.head
    while pointer.next.data != 5000
      pointer = pointer.next
    end
    pointer.next = pointer.next.next
    }
end
