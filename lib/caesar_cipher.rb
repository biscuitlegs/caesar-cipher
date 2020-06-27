def caesar_cipher(string, num)
    def input_error?(string, num)
        string.class != String || num.class != Integer
    end

    def error_message
        "Error: Incorrect argument types given."
    end
   
    return error_message if input_error?(string, num)

    coded_string = []

    string.split("").each do |letter|
        
        if /\W/.match(letter)
            coded_string.push(letter)
            next
        end

        is_capital = false

        if letter.downcase != letter
            is_capital = true
            letter_code = letter.ord + 32
        else
            letter_code = letter.ord
        end


        if letter_code + num > 122
            letter_code = 96 + letter_code + num - 122
        elsif letter_code + num < 97
            letter_code = 122 + num + letter_code - 96
        else
            letter_code = letter_code + num
        end


        if is_capital
            coded_string.push((letter_code - 32).chr)
        else
            coded_string.push(letter_code.chr)
        end
    end
    
    coded_string.join("")
end