require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name:"Example User", email:"user@example.com")
	end

	test "should be valid" do
		assert @user.valid? 
	end

	test "name should be present" do
		@user.name = "			"
		assert_not @user.valid? 
	end

	test "email should be present" do 
		@user.email = "   	"
		assert_not @user.valid?
	end

	test "name should not be too long" do 
		@user.name = "a" * 51
		assert_not @user.valid?
	end

	test "email should not be too long" do 
		@user.email = "a" * 256
		assert_not @user.valid?
	end

	test "email validation should accept valid addresses" do 
		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]

		valid_addresses.each do |x_valid_address|
			@user.email = x_valid_address
			assert @user.valid?, "#{x_valid_address.inspect} should be valid"
		end
	end

	test "email validation should reject invalid addresses" do
		invalid_addresses =  %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com] 
    invalid_addresses.each do |x_invalid_address|
    	@user.email = x_invalid_address
    	assert_not @user.valid?, "#{x_invalid_address} should be invalid_addresses"
    end
	end


	test "email addresses should be unique" do 
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end 

	test "email addresses should be saved as lower-case" do 
		mixed_case_email = "Foo@ExAMPle.CoM"
		@user.email = mixed_case_email
		@user.save
		assert_equal mixed_case_email.downcase, @user.reload.email
	end

end
