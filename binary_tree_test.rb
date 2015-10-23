require 'minitest'
require 'minitest/autorun'
require './binary_search_tree'

class BinaryLinkTreeTest < Minitest::Test
  attr_reader :list

  def setup
    @list = BinaryLinkTree.new
  end

  def test_it_starts_with_zero_elements
    skip
    assert_equal 0, list.count
  end

  def test_it_counts_first_element
    skip
    list.push("one")
    assert_equal 1, list.count
  end

  def test_it_pushes_multiple_elemets
    list.push(10)
    list.push(7)
    list.push(13)
    list.push(6)
    assert_equal 4, list.count
  end

  def test_single_node_gets_a_tail
    skip
    node = Node.new("Carl")
    node.push(node)
    assert node.link.nil? == false
  end

  def test_second_node_is_linked
    skip
    node = Node.new("Carl")
    node.push(node)
    node2 = Node.new("Shake")
    node2.push(node2)
    assert node2.link.nil? == false
  end

  def test_pop_off_element
    skip
    list.push("hello")
    list.push("wod")
    list.push("world")
    list.pop
    assert_equal 2, list.count
  end

  # Todo Pop, Delete


end
