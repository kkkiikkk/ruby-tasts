# frozen_string_literal: true

def get_values_from_array(incoming_value, type, result = [])
  incoming_value.each do |value|
    get_values_from_array(value, type, result) if value.is_a? Array
    result.push(value) if value.is_a? type
  end
  result
end

def get_all(arr, type)
  result = []
  arr.each do |value|
    if value.is_a? Array
      array_result = get_values_from_array(value, type)
      result.concat(array_result)
    end

    result.push(value) if value.is_a? type
  end
  result
end

array = [[1, 2, 3, 4, '1'], %w[2 5 10], [111, 222, 333, 444], %w[i love ruby], { key: 'value' },
         [[['text', 100_000]]]]

p get_all(array, String)
