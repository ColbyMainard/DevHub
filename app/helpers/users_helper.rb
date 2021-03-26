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
            if not (is_digit || is_lowercase_letter || is_uppercase_letter)
                return false
            end
        end
        return true
    end
    def valid_password? password
    end
    def valid_social? social_handle
    end
end