class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.000 }
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

    def in( curr )
        singular_currency = curr.to_s.gsub( /s$/, '')
       if @@currencies.has_key?(singular_currency)
            self / @@currencies[singular_currency]
        else
            super
        end
    end
end

class String
  def palindrome?
      self.downcase.gsub(/[^a-z]/,'') == self.downcase.gsub(/[^a-z]/,'').split('').reverse.join
      end
end

module Enumerable
    def palindrome?
        self.to_a.to_s == self.to_a.reverse.to_s
    end
end


