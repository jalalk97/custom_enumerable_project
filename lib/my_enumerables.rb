# frozen_string_literal: true

module Enumerable
  def my_each_with_index
    i = 0
    for element in self
      yield element, i
      i += 1
    end
    self
  end

  def my_select
    array = []
    my_each { |element| array.push element if yield element }
    array
  end

  def my_all?
    all_match = true
    my_each { |element| all_match &&= yield element }
    all_match
  end

  def my_any?
    any_match = false
    my_each { |element| any_match ||= yield element }
    any_match
  end

  def my_none?
    my_all? { |element| !(yield element) }
  end

  def my_count
    count = 0
    my_each { |element| count += 1 unless block_given? && !(yield element) }
    count
  end

  def my_map
    array = []
    my_each { |element| array.push(yield element) }
    array
  end

  def my_inject(initial_value)
    result = initial_value
    for element in self
      result = yield result, element
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for element in self
      yield element
    end
    self
  end
end
