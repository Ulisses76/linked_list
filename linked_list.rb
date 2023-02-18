class LinkedList
  attr_accessor :head, :last

  def initialize
    @head = nil
  end

  def append(value)
    if head.nil?
      head = Node.new(value, nil)
    else
      last_node = head
      p last_node

      while !last_node.next_node.nil?
        last_node = last_node.next_node
      end

      last_node.next_node = Node.new(value, nil)
    end
  end

  def prepend(value)
    if head.nil?
      head = Node.new(value, nil)
    else
      temp_node = head
      head = Node.new(value, temp_node) 
    end
      
  end

  def size
    return 0 if head.nil?
    counter=1
    last_node = head.next_node
    while !last_node.nil?
      last_node = last_node.next_node
      counter += 1
    end
    counter
  end

  def first
    head.nil? ? nil : head.value
  end

  def last
    last_node = head.next_node
    while !last_node.nil?
      last_node = last_node.next_node
    end 
    p last_node
    
  end

  def tail
    head.nil? ? nil : last
  end

  

  private

  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node)
      @value = value
      @next_node = next_node
    end
  end 

end

a = LinkedList.new
a.append(10)
a.append(20)
a.append(30)
a.append(40)
p a
# p "head a = #{a.first}"

# a.prepend(-50)
# # p a.size
# b = LinkedList.new
# b.append(-3)
# b.prepend(100)
# # p b.size
# # p "head b = #{b.first}"
# p a.tail
# p b.tail



