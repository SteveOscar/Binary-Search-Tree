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
  attr_accessor :data, :link, :left, :right, :bucket, :count

  def initialize(data, left = nil, right = nil)
    @data = data
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


  def push(previous, node)
    current = node
    if previous.left.nil? && previous.right.nil?
      if previous.data > data
        previous.left = current

      elsif previous.data < data
        previous.right = current
      end
      target = node

    else
      target = previous.left if current.data < previous.data
      target = previous.right if current.data > previous.data
      target
      until target.left.nil? && current.right.nil?
        if target.left.nil?
          target = target.right
        else
          target = target.left
        end
      end
      current.push(target, node) unless target == node
    end
  end

  def count
    @count
  end
end
