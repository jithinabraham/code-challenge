require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test '#errors_for' do
    company = Company.new(zip_code: 'invalid')
    company.valid?
    actual = errors_for(company)
    expected = "<div class=\"card border-danger\"><div class=\"card-header bg-danger text-white\">1 error prohibited this company from being saved:</div><ul class=\"mb-0 list-group list-group-flush\"><li class=\"list-group-item\">Zip code Company zip code is not valid</li></ul></div>"
    assert_equal(actual, expected)
  end
end
