def substrings(str, dictionary)
    substr = []
    result = Hash.new(0)
    temp_str = []

    #split the current string into individual words
    #make each word lowercase and remove any punctuation
    #and add it to temp_str array
    str.split(" ").each do |s|
        temp_str.push(s.downcase.gsub(/[^a-z0-9\s]/i, ''))
    end

    #for each string in temp_str, split the string into substrings
    #and add it to the substr array
    temp_str.each do |s|
        s.split("").each_with_index do |val, index|
            for i in 0...s.length
                substr.push(s[index..i])
            end
        end
    end

    #check to see if the substring is in the dictionary
    substr.each do |val|
        result[val] += 1 if dictionary.include?(val)
    end

    return result
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("Howdy partner, sit down! How's it going?", dictionary)