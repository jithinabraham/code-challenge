require 'test_helper'

class ZipCodeValidatorTest < ActiveSupport::TestCase
	module Test
		ZipCodeValidatable = Struct.new(:zip_code) do
			include ActiveModel::Validations
	
			validates :zip_code, zip_code: true
		end
	end

	def setup
    @zip_code_validatable = Test::ZipCodeValidatable.new '93003'
  end

	test "valid zip_code" do
		assert @zip_code_validatable.valid?
	end

	test "Invalid with wrong zip_code" do
		@zip_code_validatable.zip_code = '1234567'
		refute @zip_code_validatable.valid?, 'record is valid with invalid zip_code'
	end
end