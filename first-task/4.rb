def find_nested_hash_value(obj,key)
  if obj.respond_to?(:key?) && obj.key?(key)
    obj[key]
  elsif obj.respond_to?(:each)
    findingObj = nil
    obj.find{ |a| findingObj=find_nested_hash_value(a.last, key) }
    findingObj
  end
end

hash = { key1: {}, key2: {}, key3: { key4: 'str', key5: 'str2', key6: { key7: { key8: 1, key9: [2]} } }}
p find_nested_hash_value(hash, :key9)