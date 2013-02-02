class Array
  def in_columns(number)
    padding = (number - size % number) % number
    collection = dup.concat([nil] * padding)
    collection.each_slice(number).to_a.transpose.collect(&:compact)
  end
end