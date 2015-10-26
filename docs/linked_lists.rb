require 'pry'
class IterativeLinkedList
  attr_reader :head

  def count
    if head.nil?
      0
    else
      count = 1
      current = head
      while current.link?
        count += 1
        current = current.link
      end
      count
    end
  end

  def push(data)
    if head.nil?
      @head = Node.new
    else
      target = head
      while target.link?  #Checks for a tail on the target
        target = target.link
      end
    target.link = Node.new #makes a new node at the end of the list
    end
  end
end

class Node
  attr_accessor :link

  def initialize
  end

  def link?
    link
  end
end
