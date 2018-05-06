class User < ApplicationRecord
	validates :name, :email, presence: true
	# if name is not present, the object will not be saved
end
