require 'test_helper'

class EmailValidatorTest < ActiveSupport::TestCase
  module Test
    EmailValidatable = Struct.new(:email) do
      include ActiveModel::Validations

      validates :email, email: true
    end
  end

  def setup
    @email_validatable = Test::EmailValidatable.new 'test@getmainstreet.com'
  end

  test "valid email format" do
    assert @email_validatable.valid?
  end

  test "Invalid with invalid email format" do
    @email_validatable.email = 'test@test.com'
    refute @email_validatable.valid?, 'record is valid with invalid email format'
  end
end
