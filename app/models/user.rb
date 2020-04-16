class User < ApplicationRecord
    has_secure_password
    has_many :cars
    has_many :washes, through: :cars

    validates :name, presence: true
    validates :email, presence: true
    validates :name, length: { minimum: 2 }
    validates :email, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, :password_confirmation, presence: true

    def get_errors
        # binding.pry
        error = self.errors.messages.keys[0]
        if error == :password
            "Password #{self.errors.messages[:password][0]}"
        elsif error == :password_confirmation
            "Password Confirmation #{self.errors.messages[:password_confirmation][0]}"
        elsif error == :name 
            "Name #{self.errors.messages[:name][0]}"
        elsif error == :email
            "Email #{self.errors.messages[:email][0]}"
        end
    end
end
