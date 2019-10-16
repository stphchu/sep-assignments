require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating >= root.rating
      if root.right.nil?
        root.right = node
      else
        insert(root.right, node)
      end
    else
      if root.left.nil?
        root.left = node
      else
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if root.nil? || data.nil?
    return root if root.title == data

    right = find(root.right, data)
    return right if !right.nil?
    left = find(root.left, data)
    return left if !left.nil?
  end

  def delete(root, data)
    return nil if data.nil? || root.nil?
    if !root.left.nil? && root.left.title == data
      root.left = nil
    elsif !root.right.nil? && root.right.title == data
      root.right = nil
    elsif find(root.left, data)
      delete(root.left, data)
    elsif find(root.right, data)
      delete(root.right, data)
    end
  end

  # Recursive Breadth First Search
  def printf
    queue = Queue.new
    queue.enq(@root)
    while !queue.empty?
      movie = queue.deq
      puts "#{movie.title}: #{movie.rating}"
      queue.enq(movie.left) if movie.left
      queue.enq(movie.right) if movie.right
    end
  end
end
