class SuperclassHash
  def initialize()
    @normal_hash = {}
    @classes_hash = {}
  end

  def [](key)
    unless key.is_a? Class
      return @normal_hash[key]
    else
      ancestors = key.ancestors
      ancestors = ancestors[0..ancestors.index(Object)].map { |klass| klass.to_s.to_sym } #Going only as far as you can via superclass method
      ancestors.each do |klass|
        return @classes_hash[klass] if @classes_hash.has_key?(klass)
      end
      return nil
    end
  end

  def []=(key, value)
    if key.is_a? Class
      @classes_hash[key.to_s.to_sym] = value
    else
      @normal_hash[key] = value
    end
  end
end
