require_relative 'pixel'
require 'matrix'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = Matrix.build(height, width) {|row, col| 0 }.to_a
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix[x][y] = pixel
  end

  def at(x, y)
    inbounds(x, y)
  end

  private

  def inbounds(x, y)
    if x < 0 || y < 0
      return nil
    else
      @matrix[x][y]
    end
  end

end
