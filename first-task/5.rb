def camel(str)
  whiteSpaceIndex = str.index(/\s/)
  if whiteSpaceIndex != nil
    str[whiteSpaceIndex + 1] = str[whiteSpaceIndex + 1].upcase
    str.slice!(whiteSpaceIndex)
    camel(str)
  else
    str[0] = str[0].upcase
    str
  end
end

def underscore(str)
  whiteSpaceIndex = str.index(/\s/)
  if whiteSpaceIndex != nil
    if (str[whiteSpaceIndex + 1] != str[whiteSpaceIndex])
      str[whiteSpaceIndex] = "_"
    else
      str.slice!(whiteSpaceIndex)
    end
    underscore(str)
  else
    str.downcase!
  end
end

def css(str)
  whiteSpaceIndex = str.index(/\s/)
  if whiteSpaceIndex != nil
    if (str[whiteSpaceIndex + 1] != str[whiteSpaceIndex] && whiteSpaceIndex != 0)
      str[whiteSpaceIndex] = "-"
    else
      str.slice!(whiteSpaceIndex)
    end
    css(str)
  else
    str.downcase!
  end
end

str = "  I love           ruby"


def formatize(str, executor) 
  method(executor).call(str)
end

puts formatize(str, :css)