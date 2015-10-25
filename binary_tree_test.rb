require 'pry'
require 'minitest'
require 'minitest/autorun'
require './binary_search_tree'

class BinaryLinkTreeTest < Minitest::Test
  attr_reader :list

  def setup
    @list = BinaryLinkTree.new
  end

  def test_it_starts_with_zero_elements
    assert_equal 0, list.count
  end

  def test_it_counts_first_element
    list.insert("one")
    assert_equal 1, list.count
  end

  def test_it_counts_multiple_elemets
    list.insert(10)
    list.insert(7)
    list.insert(5)
    list.insert(3)
    assert_equal 4, list.count
  end

  def test_second_node_is_linked_to_head
    list.insert(10)
    list.insert(7)
    refute list.head.left.nil?
  end

  def test_second_node_is_linked_to_third_node
    list.insert(10)
    list.insert(7)
    list.insert(6)
    refute list.head.left.left.nil?
  end

  def test_alternating_tree_pattern
    list.insert(10)
    list.insert(5)
    list.insert(8)
    list.insert(6)
    list.insert(7)
    refute list.head.left.right.left.nil?
  end

  def test_right_branching_tree
    list.insert(4)
    list.insert(10)
    list.insert(16)
    list.insert(8)
    assert list.head.right.left.data == 8
  end

  def test_left_branching_tree
    list.insert(19)
    list.insert(10)
    list.insert(5)
    list.insert(6)
    assert list.head.left.left.right.data == 6
  end

  def test_right_branch_method
    node = Node.new(7)
    previous = Node.new(3)
    result = node.check_right(previous, node)
    assert previous.right == node
  end

  def test_left_branch_method
    node = Node.new(3)
    previous = Node.new(7)
    result = node.check_left(previous, node)
    assert previous.left == node
  end

  def test_include?
    a = list.insert(3)
    b = list.insert(1)
    c = Node.new(3)
    assert c.include?(a, c)
  end

  def test_pop_off_element
    skip
    list.insert("hello")
    list.insert("wod")
    list.insert("world")
    list.pop
    assert_equal 2, list.count
  end



  # Todo Pop, Delete


end
