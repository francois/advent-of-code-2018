#!/usr/bin/env ruby
require "minitest"

def repeat_counts(str)
  counts = str.chomp.each_char.each_with_object(Hash.new{|h, k| h[k] = 0}) do |char, memo|
    memo[char] += 1
  end

  [
    counts.select{|_, count| count == 2}.size.zero? ? 0 : 1,
    counts.select{|_, count| count == 3}.size.zero? ? 0 : 1,
  ]
end

def process
  counts = ARGF.map(&method(:repeat_counts))
    .reject{|line| line.all?(&:zero?)}
  a = counts.map(&:first).inject(&:+)
  b = counts.map(&:last).inject(&:+)
  puts a * b
end

class RepeatCountsTest < Minitest::Test
  def test_repeat_counts_of_abcdef
    assert_equal [0, 0], repeat_counts("abcdef")
  end

  def test_repeat_counts_of_bababc
    assert_equal [1, 1], repeat_counts("bababc")
  end

  def test_repeat_counts_of_abbcde
    assert_equal [1, 0], repeat_counts("abbcde")
  end

  def test_repeat_counts_of_abcccd
    assert_equal [0, 1], repeat_counts("abcccd")
  end

  def test_repeat_counts_of_aabcdd
    assert_equal [1, 0], repeat_counts("aabcdd")
  end

  def test_repeat_counts_of_abcdee
    assert_equal [1, 0], repeat_counts("abcdee")
  end

  def test_repeat_counts_of_ababab
    assert_equal [0, 1], repeat_counts("ababab")
  end
end
