class Coordinator < ApplicationRecord
    has_one :course
        attr_accessor :remember_token

    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A\w+\.\w+@rmit\.edu\.au\z/i
    #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[rmit]+(\.[edu]+)*\.au/i
    VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/

    validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
    validates :name, presence: true, length: { maximum: 50 }
    has_secure_password
    validates :password, presence: true, length: {minimum: 8},
                    format: {with: VALID_PASSWORD_REGEX}



    def Coordinator.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def Coordinator.new_token
      SecureRandom.urlsafe_base64
    end

    def remember
      self.remember_token = Coordinator.new_token
      update_attribute(:remember_digest, Coordinator.digest(remember_token))
    end

    # Returns true if the given token matches the digest.
    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
      update_attribute(:remember_digest, nil)
    end
end
