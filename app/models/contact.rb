class Contact < ApplicationRecord
    VALID_EMAIL_REGEX = /\A\w+\.\w+@rmit\.edu\.au\z/i
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX }
    validates :message, presence: true, length: {minimum: 10, maximum: 255}
end
