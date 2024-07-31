class RubyLogger
  def self.log
    moments = [10, 20, 25]
    (1..30).each do |i| 
      msg = moments.include?(i) ? "ruby" : "<3ruby"

      puts msg
    end
  end
end

class Circle
  def self.draw
    puts "Enter readius of the future circle: "
    radius = gets.chomp.to_i
    r_in = radius - 0.4
    r_out = radius + 0.4

    (radius.downto(-radius)).each do |y|
      (-radius..r_out).step(0.5).each do |x|
        value = x * x + y * y
        if value >= r_in * r_in && value <= r_out * r_out
          print "*"
        else
          print " "
        end
      end
      puts
    end
  end
end

class MatrixLogger
  def self.log
    puts "Enter properties of matrix";
    puts "Column size: "
    columns = gets.chomp.to_i

    puts "Raws size: "
    raws = gets.chomp.to_i

    (0...raws).each do |i|
      arr = [];
      arr.fill(0, 0...columns);
      arr[i] = 1 if i < columns
      p arr
    end
  end
end

class HashFinder
  def self.find_nested_hash_value(obj,key)
    if obj.respond_to?(:key?) && obj.key?(key)
      obj[key]
    elsif obj.respond_to?(:each)
      findingObj = nil
      obj.find{ |a| findingObj=find_nested_hash_value(a.last, key) }
      findingObj
    end
  end
end

class StringConvertor  
  def formatize(str, executor) 
    method(executor).call(str)
  end

  private

  def camel(str)
    white_space_index = str.index(/\s/)
    if white_space_index != nil
      str[white_space_index + 1] = str[white_space_index + 1].upcase
      str.slice!(white_space_index)
      camel(str)
    else
      str[0] = str[0].upcase
      str
    end
  end

  def underscore(str)
    white_space_index = str.index(/\s/)
    returnstr.downcase! if white_space_index != nil
    if (str[white_space_index + 1] != str[white_space_index] && white_space_index != 0)
      str[white_space_index] = "_"
    else
      str.slice!(white_space_index)
    end
    underscore(str)
  end

  def css(str)
    white_space_index = str.index(/\s/)
    return str.downcase! if white_space_index != nil
    if (str[white_space_index + 1] != str[white_space_index] && white_space_index != 0)
      str[white_space_index] = "-"
    else
      str.slice!(white_space_index)
    end
    css(str)
  end
end

class ArrayValueExtractor 
  def self.get_values_from_array(incoming_value, type, result = [])
    incoming_value.each do |value|
      get_values_from_array(value, type, result) if (value.is_a? Array)
     result.push(value) if (value.is_a? type)
    end
    result
  end

  def self.get_all(arr, type) 
    result = []
    arr.each do |value|
      if (value.is_a? Array) 
        array_result = get_values_from_array(value, type)
        result.concat(array_result)
      end

      result.push(value) if (value.is_a? type)
    end
    result
  end

end

class App
  def self.run
    puts "Welcome to multy tasksing app"
    puts "Choose app that you want to run"
    puts "1. App that will print ruby in console"
    puts "2. App that draw circle in console by the provided radius"
    puts "3. App that will print matrix and highlight main diagonal"
    puts "4. App that will find in the current hash value by key"
    puts "5. App that will convert string into the another string by case"
    puts "6. App that will extract values from array by the type"
    puts "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1 
      RubyLogger.log
    when 2
      Circle.draw
    when 3
      MatrixLogger.log
    when 4
      hash = { key1: {}, key2: {}, key3: { key4: 'str', key5: 'str2', key6: { key7: { key8: 1, key9: [2]} } }}
      p HashFinder.find_nested_hash_value(hash, :key9) 
    when 5
      str = "  I love           ruby"
      str_conv = StringConvertor.new
      p str_conv.formatize(str, :camel)
    when 6 
      array = [[1, 2, 3, 4, '1'], ['2', '5', '10'], [111, 222, 333, 444], ['i', 'love', 'ruby'], { key: 'value' }, [[['text', 100_000]]]]
      p ArrayValueExtractor.get_all(array, String)
    else 
      puts "You've made wrong choice try again!"
    end
  end
end

App.run