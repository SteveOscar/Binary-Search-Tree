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
  attr_accessor :data, :link, :left, :right, :count

  def initialize(data, left = nil, right = nil)
    @data = data
  end

  def push(previous, node)
    if include?(previous, node)
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

  def include?(previous, node)
    if previous.data == node.data
      puts "Duplicate #{node.data} detected and discarded. Hit Enter to continue."
            gets
      true
    else
      false
    end
  end

  def count
    @count
  end
end

tree = BinaryLinkTree.new
tree.insert(10)
tree.insert(5)
tree.insert(7)
tree.insert(15)
tree.insert(5)
tree.insert(10)
tree.insert(15)
