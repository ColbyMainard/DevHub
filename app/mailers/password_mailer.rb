#Password reset code should go here
class PasswordMailer < ApplicationMailer
    def password_reset
        @greeting = "Hi"
        mail to: "to@example.org"
    end
end