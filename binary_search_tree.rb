require 'pry'
class BinaryLinkTree
  attr_reader :head

  def initialize
    @count = 0
    @values = []
  end

  def insert(data)
    node = Node.new(data)
    @count += 1
    if head.nil?
      @head = node
    else
      node.push(head, node)
    end
  end

  def count
    @count
  end
end


class Node
  attr_accessor :data, :link, :left, :right, :found, :level, :max, :min

  def initialize(data, left = nil, right = nil)
    @data = data
    @found = false
    @level = 1
  end

  def push(previous, node)
    node.level += 1
    if previous.data == node.data
      puts "Duplicate #{node.data} detected and discarded"
    else
      current = node
      check_left(previous, current)
      check_right(previous, current)
    end
  end

  def check_left(previous, current)
    if previous.data > data
      if previous.left == nil
        previous.left = current
      else
        target = previous.left
        push(target, current)
      end
    end
  end

  def check_right(previous, current)
    if previous.data < data
      if previous.right == nil
        previous.right = current
      else
        target = previous.right
        push(target, current)
      end
    end
  end

  def include?(node, value)
    if node.data == value
        @found = true
        return @found
      else
      include?(node.right, value) unless node.right.nil?
      include?(node.left, value) unless node.left.nil?
    end
    @found
  end

  def depth_of(node, value)
    if node.data == value
        @depth = node.level
      else
      depth_of(node.right, value) unless node.right.nil?
      depth_of(node.left, value) unless node.left.nil?
    end
    @depth
  end

  def max(node)
    until node.right.nil?
      node = node.right
    end
    node.data
  end

  def min(node)
    until node.left.nil?
      node = node.left
    end
    binding.pry
    node.data
  end

end

# tree = BinaryLinkTree.new
# tree.insert(10)
# tree.insert(7)
# tree.insert(5)
# tree.insert(5)
# tree.insert(9)
# binding.pry
# tree.insert(5)
