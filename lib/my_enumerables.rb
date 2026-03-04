module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    count = 0
    self.my_each do |value|
      yield(value,count)
      count += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    store = []
    self.my_each do |value|
      if yield(value)
        store << value
      end
    end
    store
  end

  def my_all? 
    self.my_each do |value|
      if block_given?
        if !yield(value)
          return false
        end
      elsif !value
        return false
      end  
    end
    true
  end

  def my_any?
        self.my_each do |value|
      if block_given?
        if yield(value)
          return true
        end
      elsif value
        return true
      end  
    end
    false
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    count = 0
    while count < self.length 
      yield(self[count])
      count += 1
    end
    self
  end
end
