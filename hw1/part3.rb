def combine_anagrams(words)
    anagrams = {}
    words.each  { |word|
        key = word.downcase.split(//).sort.to_s
        #puts key
        if anagrams.has_key?(key)
            #puts "have the key"
            anagrams[key] << word
        else
            #puts "dont have the key"
            anagrams[key] = [word]
        end
    }
    anagrams.values

end

#combine_anagrams ( ['a','be','A','eb'] )
#combine_anagrams( ['a'])
#combine_anagrams( ['a','A'])
