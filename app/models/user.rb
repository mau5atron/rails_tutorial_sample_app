class User < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 }
	# if name and or email not present, the object will not be saved
end
