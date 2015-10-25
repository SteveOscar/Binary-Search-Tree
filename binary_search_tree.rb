require 'pry'
class BinaryLinkTree
  attr_reader :head, :left, :right

  def initialize
    @count = 0
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
  attr_accessor :data, :link, :left, :right, :count, :direction

  def initialize(data, left = nil, right = nil)
    @data = data
  end

  def direction
    @direction
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

  def push(previous, node)
    current = node

    check_left(previous, current)
    check_right(previous, current)
  end

  def count
    @count
  end
end
