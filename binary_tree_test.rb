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

  def test_left_right_tree_pattern
    list.insert(10)
    list.insert(5)
    list.insert(8)
    list.insert(6)
    list.insert(7)
    refute list.head.left.right.left.nil?
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
