class LinkedList
  attr_reader :head, :tail, :size

  def initialize(value = nil)
    @size = 0
    @head = Node.new(value)
    @tail = @head
    @size += 1 unless value == nil
  end

  def append(value)
    if @head.value.nil?
      initialize(value)
    else
      new_node = Node.new(value)
      @tail.next_node = new_node
      @tail = new_node
      @size += 1
    end
  end

  def prepend(value)
    if @head.value.nil?
      initialize(value)
    else
      new_node = Node.new(value, @head)
      @head = new_node
      @size += 1
    end
  end

  def at(index)
    return puts "Index does not exist." if index >= @size
    node = @head
    index.times do
      node = node.next_node unless node.next_node.nil?
    end
    node
  end

  def pop
    return puts "List is empty." if @size == 0

    @tail = nil
    @tail = at(@size - 2)
    @tail.next_node = nil
    @size -= 1
  end

  def contains?(value)
    return false if @size == 0
    node = @head
    result = false
    @size.times do
      if node.value == value
        result = true
        break
      else
        node = node.next_node
      end
    end
    result
  end

  def find(value)
    return nil if @size == 0
    node = @head
    index = 0
    @size.times do
      if node.value == value
        puts "#{value} is at index #{index}"
        break
      elsif index == @size - 1
        puts "Value not in list."
        break
      else
        node = node.next_node
        index += 1
      end
    end
  end

  def to_s
    return puts "List is empty." if @size == 0

    node = @head
    @size.times do
      print "( #{node.value} ) -> "
      node.next_node.nil? ? break : node = node.next_node
    end
    print "nil\n"
  end

  def insert_at(value, index)
    return @head.value = value if @size == 0
    
    i = 0
    node = @head
    new_node = Node.new(value)
    @size += 1
    @size.times do
      if i == index - 1
        new_node.next_node = node.next_node
        node.next_node = new_node
        break
      else
        node = node.next_node
        i += 1
      end
    end
  end

  def remove_at(index)
    return puts "List is empty." if @size == 0
    return puts "Index doesn't exist." if index >= @size
    if index == @size - 1
      @tail = at(@size - 2)
      @tail.next_node = nil
      @size -= 1
    end
    i = 0
    node = @head
    @size -= 1
    @size.times do
      if i == index - 1
        removed_node = node.next_node
        node.next_node = removed_node.next_node
        break
      else
        node = node.next_node
        i += 1
      end
    end
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def tail?
    next_node.nil?
  end

end

list = LinkedList.new
list.to_s
list.append("Lucas")
puts "Head: #{list.head.value}"
list.append("Donuts")
puts "Tail: #{list.tail.value}"
list.prepend("I")
list.to_s
list.insert_at("Am", 1)
list.to_s
puts "Size: #{list.size}"
puts "Head: #{list.head.value}"
list.tail
puts "Tail: #{list.tail.value}"
puts "Index 2: #{list.at(2).value}"
list.to_s
puts "Tail before: #{list.tail.value}"
list.pop
list.to_s
puts "Tail after: #{list.tail.value}"
puts "Contains \"Lucas\"? #{list.contains?("Lucas")}"
puts "Contains \"Donuts\"? #{list.contains?("Donuts")}"
list.find("Lucas")
list.find("Am")
list.to_s
list.insert_at("Not", 2)
list.to_s
list.remove_at(2)
list.to_s