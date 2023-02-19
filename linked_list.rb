class Node
  attr_accessor :value, :nextNode
  
  def initialize(value, nextNode)
    @value = value
    @nextNode = nextNode
  end

end

class LinkedList
  attr_accessor :head
  
  def initialize
    @head = nil
  end

  def lastnode
    lastnode = @head
    until lastnode.nextNode.nil?
      lastnode = lastnode.nextNode
    end    
    lastnode
  end

  def first
    @head.nil? ? nil : @head.value
  end

  def tail 
    @head.nil? ? @head : lastnode
  end

  def append(value)    
    head.nil? ? @head = Node.new(value, nil) : 
      lastnode.nextNode = Node.new(value, nil)
  end

  def prepend(value)
    head.nil? ? @head = Node.new(value, nil) : 
      @head = Node.new(value, @head)
  end

  def size
    if @head.nil?
      0
    else
      size = 1
      lastnode = @head
      until lastnode.nextNode.nil?
        lastnode = lastnode.nextNode
        size += 1
      end
      size
    end
  end

  def at(index)
    if (index >= size) || @head.nil?
      return
    else
      node = @head
      index.times {node = node.nextNode}
      node
    end
  end

  def pop
    if size < 2
      return if @head.nil?
      temp = @head.value
      @head = nil
      return temp
    else
      temp = self.at(size - 1)
      self.at(size - 2).nextNode = nil     
      return temp.value
    end  
  end 

  def contains?(value)
    if head.nil? 
      return nil
    else
      contains = false
      (0...size).each { |n| contains = true if self.at(n).value == value}
      contains
    end
  end

  def find(value)
    return if head.nil?
    index = nil
    (0...size).each { |n| index = n if self.at(n).value == value && index.nil?}
    index
  end

  def to_s
    return if head.nil?
    (0...size).each { |n| print "( #{self.at(n).value || "nil"} ) -> "}
    puts "nil"
  end

  def insert_at(value, index)
    return if head.nil?
    if index == 0
      self.prepend(value)
    elsif index < size
      header = @head
      (index - 1).times {header = header.nextNode}
      node_temp = header.nextNode
      header.nextNode = Node.new(value, node_temp)
    else
      header = lastnode
      (index - size).times {self.append(nil)}
      self.append(value)
    end
  end

  def remove_at(index)
    return if head.nil? || index >= size || index < 0
    if index > 0
      header = @head
      (index - 1).times { header = header.nextNode}
      value_retorned = header.nextNode.value
      value_temp = header.nextNode.nextNode.value
      node_temp = header.nextNode.nextNode.nextNode
      header.nextNode = Node.new(value_temp, node_temp)
      return value_retorned
    else
      self.shift
    end

  end

  def shift
    return if head.nil?
    if size > 1
      shifter = @head.value
      @head = Node.new(@head.nextNode.value, @head.nextNode.nextNode)
      return shifter
    else
      shifter = @head.value
      @head = LinkedList.new
      return shifter
    end
  end
end



a = LinkedList.new
a.append(1)
a.append(2)
a.append(3)
puts a.to_s
a.insert_at(1.5, 1)
puts a.to_s
a.insert_at(0,0)
puts a.to_s
a.remove_at(1)
puts a.to_s
a.remove_at 0
puts a.to_s
p a.remove_at 3
puts a.to_s










