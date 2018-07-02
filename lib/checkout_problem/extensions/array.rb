class Array
  def sum(identity = nil, &block)
    if block_given?
      map(&block).sum(identity)
    else
      sum = identity ? inject(identity, :+) : inject(:+)
      sum || identity || 0
    end
  end
end
