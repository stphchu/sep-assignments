require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @tail != nil
      @tail.next = node
    end
      @tail = node
      @tail.next = nil
    if @head.nil?
      @head = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    pointer = @head
    if @head == @tail
      @head = nil
      @tail = nil
      return
    end
    while pointer.next != @tail
      pointer = pointer.next
    end
    pointer.next = nil
    @tail = pointer
  end

  # This method prints out a representation of the list.
  def print
    pointer = @head
    list = []
    while pointer.next
      list << pointer.data
      pointer = pointer.next
    end
    list << pointer.data
    puts list.join("\n")
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head === node
      remove_front
    elsif @tail === node
      remove_tail
    else
      pointer = @head
      while pointer.next != node
        pointer = pointer.next
      end
      pointer.next = pointer.next.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
  end
end
