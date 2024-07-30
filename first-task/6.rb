def get_values_from_array(incomingValue, type, result = [])
  incomingValue.each do |value|
    get_values_from_array(value, type, result) if (value.is_a? Array)
    result.push(value) if (value.is_a? type)
  end
  result
end

def get_all(arr, type) 
  result = []
  arr.each do |value|
    if (value.is_a? Array) 
      arrayResult = get_values_from_array(value, type)
      result.concat(arrayResult)
    end

    result.push(value) if (value.is_a? type)
  end
  result
end


array = [[1, 2, 3, 4, '1'], ['2', '5', '10'], [111, 222, 333, 444], ['i', 'love', 'ruby'], { key: 'value' }, [[['text', 100_000]]]]

p get_all(array, String)