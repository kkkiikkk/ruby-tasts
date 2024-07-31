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

str = "  I love           ruby"


def formatize(str, executor) 
  method(executor).call(str)
end

puts formatize(str, :css)