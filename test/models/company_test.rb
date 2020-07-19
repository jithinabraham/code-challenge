require 'test_helper'
class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = Company.new(name: 'Hometown Painting', 
													email: 'hometown_painting@getmainstreet.com', 
													zip_code: '93003')
  end
  # Validations

	test 'valid company' do
    assert @company.valid?
  end

	test 'valid without email' do
		@company.email = nil
		assert @company.valid?
	end

  test 'invalid with invalid email' do
    @company.email = "hometown_painting@hometown_painting.com"
    refute @company.valid?, 'company is valid with invalid email'
    assert_not_nil @company.errors[:email], 'no validation error for email present'
  end
  
end
