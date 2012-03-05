require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
	test "name_must_not_be_empty" do
		author = Author.new

		assert author.invalid?
		assert author.errors[:name].any?
	end
  test "name_must_not_be_pat" do
  	author = Author.new
  	
  	author.name = "pat"
  	assert author.invalid?
  	author.name ="me"
  	assert author.valid?
	end
end
