module UsersHelper
    uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    lowercase = "abcdefghijklmnopqrstuvwxyz"
    numeric = "1234567890"
    underscore = "_"
    dash = "-"
    valid_special_characters = "~!@#$%^&*()_-+=[{]}\\|<>?"
    def valid_username? name
        for index in 0..name.length
            is_uppercase_letter = uppercase.include? name[index]
            is_lowercase_letter = lowercase.include? name[index]
            is_digit = numeric.include? name[index]
            is_underscore = underscore.include? name[index]
            if not (is_digit || is_lowercase_letter || is_uppercase_letter || is_underscore)
                return false
            end
        end
        return true
    end
    def valid_password? password
        for index in 0..name.length
            is_uppercase_letter = uppercase.include? name[index]
            is_lowercase_letter = lowercase.include? name[index]
            is_digit = numeric.include? name[index]
            is_underscore = underscore.include? name[index]
            is_special = valid_special_characters.include? name[index]
            if not (is_digit || is_lowercase_letter || is_uppercase_letter || is_underscore)
                return false
            end
        end
        return true
    end
    def valid_social? social_handle
        for index in 0..name.length
            is_uppercase_letter = uppercase.include? name[index]
            is_lowercase_letter = lowercase.include? name[index]
            is_digit = numeric.include? name[index]
            is_underscore = underscore.include? name[index]
            is_special = valid_special_characters.include? name[index]
            if not (is_digit || is_lowercase_letter || is_uppercase_letter || is_underscore)
                return false
            end
        end
        return true
    end
end