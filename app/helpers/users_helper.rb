module UsersHelper
    uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    lowercase = "abcdefghijklmnopqrstuvwxyz"
    numeric = "1234567890"
    underscore = "_"
    dash = "-"
    valid_special_characters = "~!@#$%^&*()_-+=[{]}|<>?"
    single_quotes = "\'"
    double_quotes = "\""
    def valid_username? name
        #if username provided is made up of valid alphanumeric characters and of valid length, return true
        #else, return false
        if name.length < 7
            return false
        end
        if name.length > 30
            return false
        end
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
        if name.length < 10
            return false
        end
        if name.length > 30
            return false
        end
        for index in 0..password.length
            is_uppercase_letter = uppercase.include? password[index]
            is_lowercase_letter = lowercase.include? password[index]
            is_digit = numeric.include? password[index]
            is_underscore = underscore.include? password[index]
            is_special = valid_special_characters.include? password[index]
            if not (is_digit || is_lowercase_letter || is_uppercase_letter || is_underscore || is_special)
                return false
            end
        end
        return true
    end
    def valid_social? social_handle
        if social_handle.length == 0
            return true
        end
        for index in 0..social_handle.length
            is_uppercase_letter = uppercase.include? social_handle[index]
            is_lowercase_letter = lowercase.include? social_handle[index]
            is_digit = numeric.include? social_handle[index]
            is_underscore = underscore.include? social_handle[index]
            is_special = valid_special_characters.include? social_handle[index]
            is_dash = dash.include? social_handle[index]
            if not (is_digit || is_lowercase_letter || is_uppercase_letter || is_underscore || is_special || is_dash)
                return false
            end
        end
        return true
    end
    def valid_email? email
        valid_email_endings = ["@gmail.com", "@yahoo.com", "@hotmail.com", "@aol.com", "@hotmail.com", "@verizon.net", "@msn.com", "@aim.com"]
        end_is_valid = false
        for index in 0..valid_email_endings.length
            if email.include? valid_email_endings[index]
                if not end_is_valid
                    end_is_valid = true
                end
            end
        end
        if not end_is_valid
            return false
        end
        if not (email.length > 11)
            return false
        end
        if email.include? single_quotes
            return false
        end
        if email.include? double_quotes
            return false
        end
        return true
    end
    def valid_link? link
        if ((link.index("http://") == 0) and length > 7)
            return true 
        end
        if ((link.index("https://") == 0) and length > 8)
            return true 
        end
        return (link.length == 0)  #it is okay to leave a link blank, but not 
    end
end