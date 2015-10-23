require 'minitest'
require 'minitest/autorun'
require './scratch'

class BinaryLinkTreeTest < Minitest::Test
  attr_reader :list

  def setup
    @list = BinaryLinkTree.new
  end

  #ToDo: Count

  def test_it_starts_with_zero_elements
    assert_equal 0, list.count
  end

  def test_it_pushes_elements_onto_li
    list.push("hello")
    list.push("wod")
    list.push("world")
    list.push("worsd")
    assert_equal 4, list.count
  end

  # Todo Push, Pop, Delete


end
