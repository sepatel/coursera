class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader "#{attr_name}_history"
    class_eval %Q[def #{attr_name}=(newvalue)
        @#{attr_name}_history = [nil] if @#{attr_name}_history.nil?
        @#{attr_name}_history << newvalue
        @#{attr_name} = newvalue
      end]
  end
end

class Foo
  attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 1
f.bar = 2
f.bar_history

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub(/s$/, '')
    if @@currencies.has_key? singular_currency
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(new_currency)
    new_currency = new_currency.to_s.gsub(/s$/, '')
    self / @@currencies[new_currency]
  end
end

class String
  def palindrome?
    trimmed = self.gsub(/\W/, '').downcase
    trimmed == trimmed.reverse
  end
end

module Enumerable
  def palindrome?
    self == self.reverse
  end
end
