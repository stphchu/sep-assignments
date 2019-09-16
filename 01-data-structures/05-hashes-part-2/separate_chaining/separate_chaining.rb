require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @count = 0
    @size = size
  end

  def []=(key, value)
    node = Node.new(key, value)
    i = index(key, size)

    if @items[i] == nil
      @items[i] = LinkedList.new
    end

    @items[i].add_to_tail(node)
    @count += 1
#    @items.print_hash

    if load_factor > @max_load_factor
      self.resize
    end
  end

  def [](key)
    i = index(key, size)
    return unless @items[i]
    node = @items[i].head
    while node
      if node.key == key
        return node.value
      else
        node = node.next
      end
    end
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

  # Calculate the current load factor
  def load_factor
    @count/(self.size).to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_array = @items
    @size *= 2
    @items = Array.new(@size)
    old_array.each do |item|
      if item != nil
        @items[index(item.head.key, @size)] = item
      end
    end
    @items
  end

  def print_hash
    @items.each_with_index do |item, index|
      print "[#{index}]"
      if !item.nil?
        print "\t"'-> '
        node = item.head
        node_num = 1
        while node
          print "(NODE: #{node_num}) " + '[KEY]: "' + node.key + '" [VALUE]: "' + node.value + '"'
          if !node.next.nil?
            node_num += 1
            print "\n\t" + "-> "
          end
          node = node.next
        end
      end
      print "\n"
    end
    puts "\n*** LOAD FACTOR: " + self.load_factor.to_s + " ***\n\n"
  end
end
