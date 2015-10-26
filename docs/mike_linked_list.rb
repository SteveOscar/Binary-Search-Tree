class LinkedList

  attr_reader :head

  def initialize(data)
    @head = Node.new(data)
  end

  def push(data)
    tail.next = Node.new(data)
  end

  def tail
    current = @head

    until current.next.nil?
      current = current.next
    end
    current
  end

  def almost_tail
    current = @head

    until current.next.next.nil?
      current = current.next
    end
    current
  end

  def recursive_almost_tail(current = @head)
    if current.next.next.nil?
      current
    else
      recursive_almost_tail(current.next)
    end
  end

  def recursive_tail(current = @head)
    if current.next.nil?
      current
    else
      recursive_tail(current.next)
    end
  end

  def pop
    temp = almost_tail.next
    almost_tail.next = nil
    temp.data
  end
end

class Node

  attr_accessor :next
  attr_reader :data

  def initialize(data)
    @data = data
    @next = nil
  end
end
