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
    assert list.head.left.left.data == 6
  end

  def test_alternating_tree_pattern
    list.insert(10)
    list.insert(5)
    list.insert(8)
    list.insert(6)
    list.insert(7)
    assert list.head.left.right.left.data == 6
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

  def test_head_include?
    list.insert(13)
    assert list.head.include?(list.head, 13)
  end

  def test_false_include?
    list.insert(13)
    list.insert(10)
    list.insert(5)
    list.insert(15)
    refute list.head.include?(list.head, 2)
  end

  def test_after_split_branch_include?
    list.insert(13)
    list.insert(10)
    list.insert(5)
    list.insert(15)
    list.insert(8)
    assert list.head.include?(list.head, 8)
  end

  def test_string_include?
    list.insert("car")
    list.insert("truck")
    list.insert("plane")
    assert list.head.include?(list.head, "plane")
  end

  def test_blank_include?
    list.insert("car")
    list.insert("truck")
    list.insert("plane")
    refute list.head.include?(list.head, "")
  end

  def test_depth_of_head
    list.insert(13)
    tree = list.head
    assert_equal 1, tree.depth_of(list.head, 13)
  end

  def test_depth_of_second_node
    list.insert(13)
    list.insert(10)
    tree = list.head
    assert_equal 2, tree.depth_of(list.head, 10)
  end

  def test_depth_of_branched_node
    list.insert(13)
    list.insert(10)
    list.insert(5)
    list.insert(15)
    list.insert(8)
    list.insert(11)
    tree = list.head
    assert_equal 3, tree.depth_of(list.head, 11)
  end





  # Todo Pop, Delete


end
