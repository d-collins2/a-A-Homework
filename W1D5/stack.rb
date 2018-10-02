class Stack

  def initialize
    @stack_array = Array.new([])

  end

  def push(el)
    stack_array.push(el)
    el
  end

  def pop
    stack_array.pop
  end

  def peek
    stack_array.last
  end

  private
  attr_reader :stack_array
end

class Queue
  def initialize
    @stack_array = Array.new([])
  end

  def enqueue(el)
    stack_array.push(el)
    el
  end

  def dequeue
    stack_array.shift
  end

  def peek
    stack_array.first
  end

  private
  attr_reader :stack_array

end

class Map
  def initialize
    @stack_array = Array.new([])
  end

  def set(key, value)
    idx = stack_array.index{ |el| el[0] == key }
    if el_index
      stack_array[idx][1] = value
    else
      stack_array.push([key, value])
    end
    value
  end

  def get(key)
    stack_array.each { |el| return el[1] if el[0] == key}
    nil
  end

  def delete(key)
    value = get(key)
    stack_array.reject! { |el| el[0] == key}
    value
  end

  def show
    ddub(stack_array)
  end


  private
  attr_reader :stack_array

  def ddub(arr)
    arr.map { |el| el.is_a? Array ? ddub(el) : el}
  end

end
