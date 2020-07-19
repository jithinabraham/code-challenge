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

  test 'valid without zip_code' do
    @company.zip_code = nil
    assert @company.valid?
  end

  test 'invalid with invalid zip code' do
    @company.zip_code = "123456"
    refute @company.valid?, 'company is valid with invalid zipcode'
    assert_not_nil @company.errors[:zip_code], 'no validation error for zip_code present'
  end

  # Callbacks

  test '#set_state_and_city - set state and city on valid zip_code' do
    @company.save
    assert_not_nil @company.city
    assert_not_nil @company.state
  end

  test '#set_state_and_city - should not set state and city on empty zip_code' do
    @company.zip_code = nil
    @company.save
    assert_nil @company.city
    assert_nil @company.state
  end

  test '#set_state_and_city - update state and city on valid zip_code' do
    @company.save
    saved_city = @company.city
    saved_state = @company.state
    @company.update(zip_code: '30301')
    assert_not_equal saved_city, @company.city
    assert_not_equal saved_state, @company.state
  end
end
