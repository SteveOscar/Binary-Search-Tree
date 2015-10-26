require 'pry'
class BinaryLinkTree
  attr_reader :head, :count

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
end

class Node
  attr_accessor :data, :left, :right, :level

  def initialize(data)
    @data = data
    @level = 1
    @max_depth = 0
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
    return if previous.data < data
    if previous.left.nil?
      previous.left = current
    else
      target = previous.left
      push(target, current)
    end
  end

  def check_right(previous, current)
    return if previous.data > data
    if previous.right.nil?
      previous.right = current
    else
      target = previous.right
      push(target, current)
    end
  end

  def include?(node, value)
    if node.data == value
      @found = true
      return @found
    else
      @found = false
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
    node = node.right until node.right.nil?
    node.data
  end

  def min(node)
    node = node.left until node.left.nil?
    node.data
  end

  def tree_depth(node)
    unless node.left.nil? && node.right.nil?
      tree_depth(node.left) unless node.left.nil?
      tree_depth(node.right) unless node.right.nil?
    end
    @max_depth = node.level unless node.level < @max_depth
    return @max_depth
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
