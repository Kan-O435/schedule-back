class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :mail, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 8}
end
