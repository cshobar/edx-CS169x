class Class

    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s   # make sure it's a string
        attr_reader attr_name        # create the attribute's getter
        attr_reader attr_name+"_history" # create bar_history getter

        class_eval %Q{
            
            def #{attr_name}=(new_val)
            
                @#{attr_name}_history << new_val
                @#{attr_name} = new_val
            end
        }
    
    end
    
    def initialize
        self.instance_variables.each { |var|
            if var.to_s =~ /_history$/
                instance_variable_set( var, [nil] )
            end
        }
    end

end




class Foo
    attr_accessor_with_history :bar
    attr_accessor_with_history :other
end

f = Foo.new     # => #<Foo:0x127e678>
f.bar_history
f.other_history

f.bar = 3 # => 3
f.bar = :wowzo  # => :wowzo
f.bar = 'boo!'  # => 'boo!'

f.bar_history   # => [nil, 3, :wowzo, 'boo!']
f.other_history

f.other = "a"
f.other = "b"
f.other_history
f.bar_history


b = Foo.new
b.bar = "A"
b.bar = "B"
b.bar_history 