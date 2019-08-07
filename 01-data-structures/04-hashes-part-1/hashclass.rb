class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    index = self.index(key, self.size)
    if @items[index] != nil
      if @items[index].key != key
        self.resize
        self[key] = value
      else
        item = @items[index]
        if item.value != value
          self.resize
        end
        item.value = value
      end
    else
      @items[index] = HashItem.new(key, value)
    end
  end

  def [](key)
    @items[self.index(key, self.size)].value if @items[self.index(key, self.size)]
  end

  def resize
    old_items = @items
    @items = Array.new(@items.size * 2)
    old_items.each do |item|
      if item != nil
        index = self.index(item.key, self.size)
        if @items[index] != nil
          self[item.key] = item.value
        else
          @items[index] = item
        end
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

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
