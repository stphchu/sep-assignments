require_relative 'node'

class OpenAddressing
  def initialize(size)
    @size = size
    @items = Array.new(size)
    @count = 0
  end

  def []=(key, value)
    node = Node.new(key, value)
    i = index(key, size)

    if @items[i] == nil
      @items[i] = node
      @count += 1
    else
      next_index = next_open_index(i)
      if next_index == -1
        self.resize
      else
        @items[next_index] = node
      end
    end
  end

  def [](key)
    i = index(key, size)
    while i < size do
      if @items[i].nil?
        return nil
      elsif @items[i].key == key
        return @items[i].value
      end
      i += 1
      if i == size
        i = 0
      end
    end
    nil
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_byte do |c|
      sum += c
    end
    sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    @items.each_with_index do |item, i|
		    if @items[i] == nil
				  return i
	      end
		end
		return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)
    old_array.each do |item|
      if item != nil
        i = index(item.key, @items.length)
        @items[i] = Node.new(item.key, item.value)
      end
    end
  end
end
