class User < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	# Regular expression for email validation
	validates :email, presence: true, length: { maximum: 255 }, 
	format: {with: VALID_EMAIL_REGEX}
	# if name and or email not present, the object will not be saved
end
