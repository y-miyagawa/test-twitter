require "bcrypt"
class User < ApplicationRecord

#attr_accessor:password
#before_save do
#    self.password_digest = BCrypt::Password.create(password)
#end
        has_secure_password
end
