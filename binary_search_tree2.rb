require 'pry'
class BinaryLinkTree
  attr_reader :head, :left, :right

  def initialize
    # @left = left
    # @right = right
  end

  def push(data)
    node = Node.new(data)
    if head.nil?
      @head = node
    else
      if head.data > data
        head.left = true
        node.push(node)
      else
        head.right = true
        node.push(node)
      end
    end
  end

  def count
    if head
      head.count
    else
      0
    end
  end
end

class Node
  attr_accessor :data, :link, :left, :right

  def initialize(data, next_node = nil)
    @data = data
    # @left = left
    # @right = right
  end

  def link?
    link
  end

  def left?
    left
  end

  def right?
    right
  end

  def push(node)
    binding.pry
    if link.nil?
      @link = node
    else
      current = node
      binding.pry
      if current.data > data
        head.left = true
        head.push(node)
      else
        head.right = true
        head.push(node)
      end
      link.push(node)
    end
  end

  def count
    if link
      link.count + 1
    else
      1
    end
  end
end

# numbers = (0..1000).to_a.sample(16)
# list = BinaryLinkTree.new
# numbers.each do |num|
#   list.push(num)
# end
#
# puts list.inspect
# puts list.count

class OtherPizza
  attr_accessor :lol
  def some_method
    self.lol = "hi"
    lol = "hi"
    puts "attr lol: #{self.lol}"
    puts "lolal lol: #{lol}"
  end
end
