class User < ApplicationRecord
	before_save {email.downcase!}
	# callback - right before the user is saved to the database
	# the email is downcased

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	# Regular expression for email validation
	validates :email, presence: true, length: { maximum: 255 }, 
	format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
	# replaced unqueness true with case_sensitive - rails should know that it
	# is true as well
	# if name and or email not present, the object will not be saved
end
