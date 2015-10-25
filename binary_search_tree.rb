require 'pry'
class BinaryLinkTree
  attr_reader :head, :left, :right, :values

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
  attr_accessor :data, :link, :left, :right, :count, :found

  def initialize(data, left = nil, right = nil)
    @data = data
    @found = false
  end

  def push(previous, node)
    # if include?(previous, node)
    # else
      current = node
      check_left(previous, current)
      check_right(previous, current)
    # end
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

  def depth(previous, data)
  end

  def count
    @count
  end
end

# tree = BinaryLinkTree.new
# a = tree.insert(10)
# b = tree.insert(7)
# c = tree.insert(5)
# d = tree.insert(9)
# binding.pry
# tree.insert(5)
