require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
	# DONT REPEAT YOURSELF - lets write a method that displays the 
	# ruby on rails tut sample app 
	# and interpolate that binch 😩👌

	def setup
		@base_title = "Ruby on Rails Tutorial Sample App"
	end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
  	get about_path
  	assert_response :success 
  	assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
  	get contact_path
  	assert_response :success
  	assert_select "title", "Contact | #{@base_title}"
  end

end
