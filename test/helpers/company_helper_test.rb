require 'test_helper'

class CompanyHelperTest < ActionView::TestCase
	test '#city_state_label' do
		company = companies(:hometown_painting)
		actual = city_state_label(company)
		expected = "#{company.city}, #{company.state}"
		assert_equal(actual, expected)
	end
end