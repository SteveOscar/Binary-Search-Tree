require 'pry'
class BinaryLinkTree
  attr_reader :head, :left, :right

  def push(data)
    node = Node.new(data)
    if head.nil?
      @head = node
    else
      if head.data > data
        node.left = true
        binding.pry
        head.push(node)
      else
        head.push(node)
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

  def initialize(data)
    @data = data
    @left = left
    @right = right
  end

  def push(node)
    binding.pry
    if link.nil?
      @link = node
    else
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
