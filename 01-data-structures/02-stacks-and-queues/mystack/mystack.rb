class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.length] = item
    self.top = @stack[@stack.length-1]
  end

  def pop
    temp =  @stack[@stack.length-1]
    @stack.delete_at(@stack.length-1)
    self.top = @stack[@stack.length-2]
    return temp
  end

  def empty?
    if @stack.length == 0
      return true
    else
      return false
    end
  end

end
