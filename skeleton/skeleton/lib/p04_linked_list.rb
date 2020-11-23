require 'byebug'
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  attr_reader :head, :tail

  def initialize
    @head = Node.new("head")
    @tail = Node.new("tail")
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i) # LL[ 1, 2, 3, 4, 5 ] /// LL[4]
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current = @head.next

    until current == @tail
      return current.val if current.key == key
      current = current.next
    end
    nil
  end

  def include?(key)
    return false if get(key) == nil
    true
  end

  def append(key, val)
    node = Node.new(key, val)
    previous = @tail.prev
    node.prev = @tail.prev
    @tail.prev = node
    node.next = @tail
    previous.next = node
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
        break
      end
    end
  end

  def remove(key)
      self.each do |node|
        if node.key == key
          prev_node = node.prev
          next_node = node.next
          prev_node.next = next_node
          next_node.prev = prev_node
          break
        end
      end
  end

  def each
    current = @head.next    #current = 1st node at start
    # return [] if current.val == nil

    while current != @tail
      yield current             #node.val
      current = current.next    #[-2]node.next ==> tail
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
