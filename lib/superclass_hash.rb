class SuperclassHash
  def initialize()
    @hash = {}
  end

  def [](key)
    unless key.is_a? Class
      return @hash[key]
    else
      ancestors = key.ancestors
      ancestors = ancestors[0..ancestors.index(Object)] #Going only as far as you can via superclass method
      ancestors.each do |klass|
        return @hash[klass] if @hash.has_key?(klass)
      end
      return nil
    end
  end

  def []=(key, value)
    @hash[key] = value
  end
end
