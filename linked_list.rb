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
    (0...size).each { |n| print "( #{self.at(n).value} ) -> "}
    print "nil\n"
  end

    



end



a = LinkedList.new
a.append(5)
a.append(4)
a.append(5)
a.append(4)
a.prepend 8
a.to_s



