require 'pry'
class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end
end

class FileWriter
  def output
    filename = ARGV[1]
    File.open(filename, "w")
  end
end

class BinaryLinkTree
  attr_reader :head, :count, :reader

  def initialize
    @reader = FileReader.new
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

  def import(data)
    reader.read.split("\n") .each { |num| data.insert(num.to_i) }
  end
end

class Node
  attr_accessor :data, :left, :right, :level, :writer

  def initialize(data)
    @writer = FileWriter.new
    @data = data
    @level = 1
    @max_depth = 0
    @values = []
  end

  def push(previous, node)
    node.level += 1
    if previous.data == node.data
      puts "Duplicate #{node.data} detected and discarded"
    else
      current = node
      check_below(previous, current, previous.left, :>)
      check_below(previous, current, previous.right, :<)
    end
  end

  def check_below(previous, current, direction, operator)
    if previous.data.send(operator, data)
      if direction == nil
        previous.left = current if operator == :>
        previous.right = current if operator == :<
      else
        target = direction
        push(target, current)
      end
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

  def child?(node)
    false ? node.left.nil? && node.right.nil? : true
  end

  def tree_depth(node)
    unless node.left.nil? && node.right.nil?
      tree_depth(node.left) unless node.left.nil?
      tree_depth(node.right) unless node.right.nil?
    end
    @max_depth = node.level unless node.level < @max_depth
    return @max_depth
  end

  def traverse_sort(node)
    if node.nil?
      return @values
    else
      traverse_sort(node.left)
      @values << node.data
      traverse_sort(node.right)
    end
  end

  def write_file(sorted)
    handle = writer.output
    handle.write(sorted.join(', '))
    puts "Just wrote a file #{sorted.length} chars long"
  end

end

if __FILE__ == $0
  list = BinaryLinkTree.new
  list.import(list)
  root = list.head
  sorted = root.traverse_sort(root)
  root.write_file(sorted)
end
